-- TODO: remove `killall xmobar` once xmobar will use stdin reader.

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.Submap
import XMonad.Config
import qualified Data.Map as M
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig


-- | Prefixes everything with mod+t instead of a mod key, so that
-- mod+1 becomes mod+t 1 (e.g., C-1 -> C-t 1), for instance.
myKeys :: (XConfig Layout -> M.Map (KeyMask, KeySym) (X ()))
       -> XConfig Layout
       -> M.Map (KeyMask, KeySym) (X ())
myKeys oldKeys conf@(XConfig {XMonad.modMask = modMask}) =
  M.fromList [((modMask, xK_t), submap (oldKeys conf { modMask = noModMask }))]


{- | On CentOS 7, with GeForce GTX 660 and a proprietary NVIDIA driver,
with vsync enabled in nvidia-settings:

- default: white flash when switching to FF, and screen tearing on
  smooth scrolling there
- compton --backend glx: screen tearing in emacs on scroll/text
  movement, apparently happens just after some time (may be a bug)
- compton --backend glx --vsync opengl-swc: same
- compton --backend glx --paint-on-overlay: same
- compton --backend glx --vsync opengl --paint-on-overlay: same
- compton --backend glx --vsync opengl-swc --sw-opti: same, probably
  FF scrolling gets less smooth
- compton with
  <https://bbs.archlinux.org/viewtopic.php?pid=1541023#p1541023>
  configuration: same, probably FF scrolling got worse
- compton with that and `glx-swap-method = "buffer-age"`, as suggested
  further in that thread: some text bits in emacs begin changing back
  and forth even without scrolling (apparently that's what is
  described even further there).
- compton --backend xrender: same as with no compton
- compton --dbe: same
- compton --backend xrender --vsync opengl-oml: same
- compton --backend xrender --vsync opengl: same, but reduces the
  flashing
- compton --backend xrender --vsync opengl --paint-on-overlay: same
- compton --backend xrender --vsync opengl --dbe: same
- compton --backend xrender -cf: hides (smoothes) the white flash,
  though a bit slower; same as without -cf otherwise
- with --vsync drm: "VBlank ioctl did not work, unimplemented in this
  drmver?"

Apparently these and similar issues are not uncommon (and not specific
to xmonad), and there's a bunch of different solutions -- some of them
probably working for some users, but they tend to have side effects as
well. Pretty much as described on
<https://github.com/chjj/compton/wiki/vsync-guide>.

Using 'spawnOnce' here, so that it wouldn't run multiple compton
processes on xmonad restart: that would load CPU and make the display
unusable. A drawback is that restarting xmonad doesn't suffice to
restart a killed compton. This actually shouldn't be an issue, since
compton is supposed to handle it:

- https://specifications.freedesktop.org/wm-spec/latest/ar01s08.html#idm139870829889072
- https://github.com/chjj/compton/issues/301

But I've got an old version from repositories (apparently they don't
do much of versioning or releases, or of other conventional things,
but the package update date is 2014-10-16). I still don't see why this
happens (would probably have to debug, or at least to try a newer
version), but it does.


With "Full Composition Pipeline" enabled in nvidia-settings:

Occasionally some kind of a phantom mouse cursor appears and blinks on
top of emacs window now; can be erased by moving a real cursor through
it. Sometimes it vanishes on its own. Happens with or without compton.

- no compton: white flashes when switching to FF, fine otherwise (no
  screen tearing in FF)
- compton --backend xrender: same as without compton
- compton --backend xrender -cf: hides (smoothes) the flashes.
- compton --backend glx: no flashes, but screen tearing in emacs
- compton --backend glx --paint-on-overlay: same (maybe the tearing
  gets visible faster -- that is, worse)
- compton --backend glx --vsync opengl: same
- compton --backend glx --vsync opengl --paint-on-overlay: same
- compton --backend glx --vsync opengl-swc --sw-opti: maybe slightly
  better, but essentially the same

A summary of the more common issues:

@
| issue / backend         | xrender     | glx    |
|-------------------------+-------------+--------|
| screen tearing in FF    | without FCP | never  |
| screen tearing in emacs | never       | always |
| phantom cursor          | with FCP    | ?      |
| white flashes in FF     | always      | never  |
@



-}

-- for some reason this doesn't seem to work anymore
runCompton = spawnOnce "compton --backend xrender -cf"

main = do
  -- This is awkward, but apparently there's no better standard way to
  -- avoid multiple xmobar instances.
  c <- statusBar "killall --quiet --exact xmobar; xmobar" xmobarPP
       (\(XConfig {XMonad.modMask = modMask}) -> (modMask, xK_b))
       def
  -- EWMH (extended window manager hints) are used to control xmonad
  -- with xdotool from xmobar.
  xmonad $ ewmh c
    { layoutHook = avoidStruts $ layoutHook c
    , manageHook = manageHook c <+> manageDocks
    , keys = myKeys $ keys $ c `additionalKeys`
             -- C-t C-t would send C-t to a focused window.
             [((controlMask, xK_t), spawn "xdotool key ctrl+t")]
    , modMask = controlMask
    , focusedBorderColor = "#444"
    , normalBorderColor = "#000"
    , startupHook = runCompton
    }

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ---------------------------
;;
;; Blueish: a blueish theme.
;;
;; Based on the fogus theme from sublime-themes.
;;
;; ----------------------------

(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

(deftheme blueish
  "A blueish theme")

(custom-theme-set-faces
 'blueish

 ;; ----------------- Frame stuff --------------------
 '(default ((((type graphic)) (:background "#091419" :foreground "#c0d0d6"))))
 '(link ((t (:foreground "DarkSlateGray3"))))
 '(cursor  ((t (:background "#F8F8F0"))))
 '(hl-line ((t (:background "#666666"))))
 '(modeline ((t (:background "#183c66" :foreground "white"))))
 '(mode-line-inactive ((t (:background "#2f2f3b" :foreground "#d0dfe6" :box nil))))
 '(mode-line ((t (:box nil :foreground "white" :background "#183c66"))))
 '(fringe ((((type graphic)) (:background "#14191f"))))
 ;; Dir-ed search prompt
 '(minibuffer-prompt ((default (:foreground "white"))))
 ;; Highlight region color
 '(region ((t (:foreground "#FFE792" :background "#1b232c"))))
 '(vertical-border ((t (:foreground "#30303f"))))

 ;; ---------------- Code Highlighting ---------------
 ;; Builtin
 '(font-lock-builtin-face ((t (:foreground "#6ee2ff"))))
 ;; Comments
 '(font-lock-comment-face ((t (:foreground "#709999"))))
 ;; Function names
 '(font-lock-function-name-face ((t (:foreground "#effbff"))))
 ;; Keywords
 '(font-lock-keyword-face ((t (:foreground "#748aa6"))))
 ;; Strings
 '(font-lock-string-face ((t (:foreground "#6ea0d0"))))
 ;; Variables
 '(font-lock-variable-name-face ((t (:foreground "#d0dfe6"))))
 '(font-lock-type-face ((t (:foreground "#95cc5e"))))
 '(font-lock-warning-face ((t (:foreground "white" :bold t))))

 ;; ---------------- Package Specific Stuff -----------
 ;; circe
 '(circe-my-message-face ((t (:foreground "#d0ffff"))))
 ;; ido
 '(ido-only-match ((t (:foreground "#66ff66"))))
 '(ido-subdir ((t (:foreground "#ffaaaa"))))
 ;; mail
 '(message-header-name ((t (:foreground "#66FF99"))))
 ;; w3m
 '(w3m-form ((t (:foreground "#ffdddd" :underline t))))
 '(w3m-form-button ((t (:background "#363b40" :foreground "#c0c4c8" :box (:line-width 2 :color "#202020" :style released-button)))))
 ;; w3m-haddock
 '(w3m-haddock-heading-face ((t (:background "#1b2025"))))
 ;; idris-mode
 '(idris-semantic-data-face ((t (:foreground "#f99"))))
 '(idris-semantic-function-face ((t (:foreground "#de8"))))
 '(idris-semantic-bound-face ((t (:foreground "#a9d"))))

 ;; ansi-colors
 '(ansi-color-blue ((t (:background "#8bf" :foreground "#8bf"))))
 '(ansi-color-bright-black ((t (:background "gray80" :foreground "gray80"))))
 '(ansi-color-bright-blue ((t (:background "#2bf" :foreground "#2bf"))))
 '(ansi-color-bright-cyan ((t (:background "#4ff" :foreground "#4ff"))))
 '(ansi-color-bright-green ((t (:background "#4f4" :foreground "#4f4"))))
 '(ansi-color-bright-magenta ((t (:background "#f8f" :foreground "#f8f"))))
 '(ansi-color-bright-red ((t (:background "#faa" :foreground "#faa"))))
 '(ansi-color-bright-yellow ((t (:background "khaki1" :foreground "khaki1"))))
 '(ansi-color-cyan ((t (:background "#8ff" :foreground "#8ff"))))
 '(ansi-color-green ((t (:background "#8f8" :foreground "#8f8"))))
 '(ansi-color-magenta ((t (:background "#fbf" :foreground "#fbf"))))
 '(ansi-color-red ((t (:background "#fbb" :foreground "#fbb"))))
 '(ansi-color-yellow ((t (:background "LightYellow1" :foreground "LightYellow1"))))

 ;; mastodon.el
 '(mastodon-display-name-face ((t (:foreground "lemon chiffon"))))
 )


;;;###Autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'blueish)

;; Local Variables:
;; no-byte-compile: t
;; End:

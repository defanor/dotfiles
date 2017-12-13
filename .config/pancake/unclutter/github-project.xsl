<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:variable name="project_uri"
                  select="//strong[@itemprop='name']/a/@href"/>
    <html>
      <body>
        <!-- header -->
        <h1>
          <xsl:copy-of select="//a[@rel='author']" />
          /
          <xsl:copy-of select="//strong[@itemprop='name']/a" />
        </h1>

        <!-- issues and such -->
        <p>
          <a href="{$project_uri}/issues">
            issues:
            <xsl:copy-of select="//a[@data-hotkey='g i']/span[@class='Counter']" />
          </a>
          |
          <a href="{$project_uri}/pulls">
            PRs:
            <xsl:copy-of select="//a[@data-hotkey='g p']/span[@class='Counter']" />
          </a>
          |
          <a href="{$project_uri}/wiki">
            wiki
          </a>
        </p>

        <!-- files -->
        <p>
        <xsl:for-each select="//div[@class='file-wrap']//tr[position()>1]">
          <xsl:copy-of select="td[@class='content']//a" />
          (<xsl:copy-of select=".//time-ago" />)
          <br/>
        </xsl:for-each>
        </p>

        <!-- readme -->
        <xsl:copy-of select="//div[@id='readme']" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

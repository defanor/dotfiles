<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <body>
        <!-- Mostly copying, just inserting horizontal rules before
             function descriptions. -->
        <xsl:copy-of select="//div[@id='package-header']" />
        <xsl:copy-of select="//div[@id='module-header']" />
        <xsl:copy-of select="//div[@id='description']" />
        <xsl:copy-of select="//div[@id='table-of-contents']" />
        <xsl:copy-of select="//div[@id='synopsis']" />
        <div id="interface">
          <xsl:for-each select="//div[@id='interface']/node()">
            <xsl:if test="@class = 'top'">
              <hr />
            </xsl:if>
            <xsl:copy-of select="." />
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

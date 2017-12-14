<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <body>
        Hoogle: <xsl:value-of select="//h1" />
        <ul>
          <xsl:for-each select="//div[@class='ans']">
            <li>
              <xsl:copy-of select="a[@class='a']" />
              <xsl:value-of select="a[position()=3]" />
              <xsl:copy-of select="following::div[position()=1]" />
              <xsl:copy-of select="following::div[position()=2]" />
              <br/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

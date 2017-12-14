<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <body>
        <!-- Copy metadata and ToC -->
        <xsl:copy-of select="//div[@id='package-header']" />
        <xsl:copy-of select="//div[@id='module-header']" />
        <xsl:copy-of select="//div[@id='description']" />
        <xsl:copy-of select="//div[@id='table-of-contents']" />
        <xsl:copy-of select="//div[@id='synopsis']" />
        <xsl:apply-templates select="//div[@id='interface']" />
      </body>
    </html>
  </xsl:template>

  <!-- Function declarations: add <hr /> before them. -->
  <xsl:template match="div[@class='top']">
    <hr />
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>

  <!-- Don't show all the class methods for each instance. -->
  <xsl:template match="div[@class='subs methods']" />

  <!-- Catch-all: copy and apply templates -->
  <xsl:template match="node()" priority="0">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>

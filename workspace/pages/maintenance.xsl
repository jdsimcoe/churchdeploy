<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  encoding="UTF-8"
  method="xml"
  omit-xml-declaration="yes"
  indent="no"
  />

<xsl:template match="/">
  <xsl:call-template name="maint"/>
</xsl:template>

<xsl:template name="maint">
  <xsl:comment><![CDATA[[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" /> <![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if IE 7]> <html class="no-js ie7 oldie" lang="en" /> <![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if IE 8]> <html class="no-js ie8 oldie" lang="en" /> <![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if gt IE 8]><!]]></xsl:comment><html class="no-js" lang="en"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
    <head>
      <script type="text/javascript" src="//use.typekit.net/tix6unz.js"></script>
      <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
      <link rel="stylesheet" href="{$root}/workspace/themes/active/css/maint.css"/>
    </head>
    <body>
      <div class="logo">
        <img src="http://atheycreek.com/workspace/themes/active/img/apple-touch-icon.png" height="300px" width="300px" />
      </div>
      <h1><span>AtheyCreek.com</span> is currently under contruction.<br/>Please check back soon.</h1>
    </body>
  </html>

</xsl:template>

</xsl:stylesheet>
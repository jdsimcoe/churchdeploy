<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:include href="../utilities/classes.xsl" />
<xsl:include href="../utilities/components.xsl" />
<xsl:include href="../utilities/date-time-advanced.xsl" />
<xsl:include href="../utilities/date-utilities.xsl" />
<xsl:include href="../utilities/pagination.xsl" />
<xsl:include href="../utilities/timespan-format.xsl" />
<xsl:include href="../utilities/toolkit.xsl" />
<xsl:include href="../utilities/url-encode.xsl" />
<xsl:include href="../themes/active/xsl/template.xsl" />

<xsl:template match="/">
    <script type="text/javascript" src="//use.typekit.net/tix6unz.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
    <link rel="stylesheet" href="{$root}/workspace/themes/active/css/maint.css"/>
    <div class="logo">
      <img src="http://atheycreek.com/workspace/themes/active/img/apple-touch-icon.png" height="300px" width="300px" />
    </div>
  <h1><span>404 Error!</span><br/>The page you are looking for is no longer available.<br/><a href="{$root}">Return to AtheyCreek.com &#8594;</a></h1>
</xsl:template>


</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:include href="../utilities/xmltojson.xsl" />

<xsl:param name="url-request" />


<xsl:template match="/">
	<xsl:call-template name="json">
		<xsl:with-param name="xml" select="//data/node()[name() = $url-request]"/>
	</xsl:call-template>
</xsl:template>


</xsl:stylesheet>
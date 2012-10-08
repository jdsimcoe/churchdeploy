<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	encoding="UTF-8"
	indent="yes" />

<xsl:param name="url-request" />


<xsl:template match="/">
	<xsl:copy-of select="//data/node()[name() = $url-request]" />
</xsl:template>


</xsl:stylesheet>
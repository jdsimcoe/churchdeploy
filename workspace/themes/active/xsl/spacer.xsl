<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-spacer">

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="'spacer'" />
		</xsl:call-template>
		<div class="spacer">•••</div>
	</div>

</xsl:template>


</xsl:stylesheet>
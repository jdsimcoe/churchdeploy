<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-text">

	<xsl:param name="component" select="'text'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>

			<xsl:for-each select="$entries">
				<div>
					<xsl:call-template name="class-rows" />
					<xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
					<xsl:call-template name="edit-entry">
						<xsl:with-param name="component" select="$component"/>
					</xsl:call-template>
				</div>
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>


</xsl:stylesheet>
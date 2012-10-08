<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-videos">

	<xsl:param name="component" select="'videos'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">

		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<!-- <h3>Videos</h3> -->
			<div class="entries">
				<xsl:attribute name="class">
					<xsl:text>entries</xsl:text>
					<xsl:if test="$position = 'column-center'">
						<xsl:text> row</xsl:text>
					</xsl:if>
				</xsl:attribute>
				<xsl:for-each select="$entries">
					<xsl:choose>
						<xsl:when test="$position = 'column-center'">
							<div class="span4">
								<xsl:call-template name="component-videos-entry" />
							</div>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="component-videos-entry" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="component-videos-entry">

	<div>
		<xsl:call-template name="class-rows" />
		<h4><xsl:value-of select="title" disable-output-escaping="yes" /></h4>
		<xsl:call-template name="edit-entry">
			<xsl:with-param name="component" select="$component"/>
		</xsl:call-template>
		<iframe src="http://player.vimeo.com/video/{id}?title=0&amp;byline=0&amp;portrait=0&amp;color=F16522" frameborder="0"></iframe>
	</div>

</xsl:template>


</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-downloads">

	<xsl:param name="component" select="'downloads'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<h3>Downloads</h3>
			<ul class="documents nav nav-tabs nav-stacked">
				<xsl:for-each select="$entries">
					<li class="entry">
						<xsl:call-template name="class-rows" />
						<a target="_blank">
							<xsl:call-template name="url-downloads" />
							<i class="icon-file icon-large"></i>
							<xsl:text>&#160;&#160;</xsl:text>
							<xsl:text>&#160;&#160;</xsl:text>
							<span class="title">
								<xsl:value-of select="name" />
							</span>
						</a>
						<xsl:call-template name="edit-entry">
							<xsl:with-param name="component" select="$component"/>
						</xsl:call-template>
					</li>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:if>
</xsl:template>


</xsl:stylesheet>
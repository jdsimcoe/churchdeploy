<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl" />
<xsl:import href="../themes/active/xsl/search.xsl" />


<xsl:template match="/">
	<xsl:comment><![CDATA[[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]> <html class="no-js ie7 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]> <html class="no-js ie8 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if gt IE 8]><!]]></xsl:comment><html class="no-js" lang="en"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
	
		<xsl:call-template name="template-header-main" />
		<xsl:call-template name="template-header-outside-container"/>
		
		<div class="container main-container">
			<xsl:call-template name="component-search">
				<xsl:with-param name="position" select="column-full-width" />
				<xsl:with-param name="entries" select="data/search/entry" />
			</xsl:call-template>
		</div>
		
		<xsl:call-template name="template-footer-inside-container" />
	
	</html>
	
</xsl:template>


</xsl:stylesheet>
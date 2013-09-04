<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
	method="xml"
	omit-xml-declaration="yes"
	indent="no"
	/>

<xsl:include href="../utilities/classes.xsl" />
<xsl:include href="../utilities/components.xsl" />
<xsl:include href="../utilities/date-time-advanced.xsl" />
<xsl:include href="../utilities/date-utilities.xsl" />
<xsl:include href="../utilities/navigation.xsl" />
<xsl:include href="../utilities/pages.xsl" />
<xsl:include href="../utilities/footer.xsl" />
<xsl:include href="../utilities/pagination.xsl" />
<xsl:include href="../utilities/timespan-format.xsl" />
<xsl:include href="../utilities/toolkit.xsl" />
<xsl:include href="../utilities/url-encode.xsl" />
<xsl:include href="../themes/active/xsl/template.xsl" />

<xsl:param name="cookie-username" />
<xsl:param name="url-language" />
<xsl:param name="url-sections" />
<xsl:param name="url-keywords" />

<xsl:variable name="events-entries-per-page" select="'5'" />
<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')" />


<xsl:template match="/">
	<xsl:call-template name="master"/>
</xsl:template>


<xsl:template name="master">
	<xsl:comment><![CDATA[[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]> <html class="no-js ie7 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]> <html class="no-js ie8 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if gt IE 8]><!]]></xsl:comment><html class="no-js" lang="en"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>

		<xsl:call-template name="template-header-main" />
		<body>
			<xsl:attribute name="class">
				<xsl:text>pageid-</xsl:text>
				<xsl:choose>
					<xsl:when test="$pt1">
						<xsl:value-of select="$pt1" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="data/tags-all-entries/entry[tag/@handle = 'home']/@id" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:text>layout-</xsl:text>
				<xsl:value-of select="/data/layouts-ds-tags-entries-by-tag/entry/name/@handle" />
				<xsl:if test="data/events-entry-by-id-preview/entry or /data/events-entry-by-id/entry or /data/events-recurring-entry-by-id/entry or /data/events-recurring-entry-by-id-preview/entry">
					<xsl:text> profile</xsl:text>
				</xsl:if>
			</xsl:attribute>

				<xsl:call-template name="template-header-outside-container" />
				<xsl:call-template name="template-main-container" />
				<xsl:call-template name="template-header-inside-container" />

				<xsl:choose>
					<xsl:when test="$pt1 = 'toolkit' and $cookie-username">
						<xsl:call-template name="toolkit" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="count(/data/layouts-ds-tags-entries-by-tag/entry)">
								<xsl:call-template name="call-components">
									<xsl:with-param name="xpath" select="/data/layouts-ds-tags-entries-by-tag/entry" />
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="call-components">
									<xsl:with-param name="xpath" select="/data/layouts-default/entry" />
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>

				<xsl:call-template name="template-footer-inside-container" />
				<xsl:call-template name="template-footer-outside-container" />

		</body>
	</html>
</xsl:template>

<xsl:template name="template-header-main">
	<head>
		<xsl:comment>This is an installation of ChurchDeploy.com — The mission of Church Deploy is to build, as a community, the best church website framework possible and give it away, free of charge.</xsl:comment>
		<xsl:variable name="page-title">
			<xsl:if test="string-length($pt1)">
				<xsl:for-each select="/data/tags-all-entries/entry[tag/@handle = $pt1]">
					<xsl:choose>
						<xsl:when test="string-length(description)">
							<xsl:value-of select="description" />
						</xsl:when>
						<xsl:when test="string-length(tag)">
							<xsl:value-of select="tag" />
						</xsl:when>
					</xsl:choose>
					<xsl:if test="string-length(description) or string-length(tag)">
						<xsl:text disable-output-escaping="yes"> · </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:value-of select="$main-pagetitle" />
		</xsl:variable>
		<title>
			<xsl:value-of select="$page-title" />
		</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="{$main-meta-description}" />
		<meta name="keywords" content="{$main-meta-keywords}" />
		<meta name="author" content="{$website-name}" />
		<meta name="application-name" content="{$website-name}" />
		<meta name="msapplication-tooltip" content="{$page-title}" />
		<meta name="msapplication-starturl" content="{$root}" />
		<meta name="responsimage">
			<xsl:attribute name="data-server">
				<xsl:value-of select="$root" disable-output-escaping="yes" />
				<xsl:text>/image/2/width/height/responsimageanchor/0/uploads/images/leaderboards/filename</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="data-static">
				<xsl:value-of select="$workspace" disable-output-escaping="yes" />
				<xsl:text>/img/spacer.gif</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="data-loading">
				<xsl:value-of select="$workspace" disable-output-escaping="yes" />
				<xsl:text>/img/loading.gif</xsl:text>
			</xsl:attribute>
		</meta>
		<meta property="og:type" content="website" />
		<meta property="og:url" content="{$root}" />
		<meta property="og:image" content="{$workspace}/themes/active/img/apple-touch-icon.png" />
		<meta property="og:title" content="{$page-title}" />
		<meta property="og:description" content="{$main-meta-description}" />
		<link rel="apple-touch-icon-precomposed" href="{$workspace}/themes/active/img/apple-touch-icon.png" type="image/png" />
		<link href="{$workspace}/themes/active/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
		<xsl:call-template name="template-head" />
	</head>
</xsl:template>


<xsl:template name="call-components">

	<xsl:param name="xpath" />

	<xsl:call-template name="component">
		<xsl:with-param name="xpath" select="$xpath/column-full-width" />
	</xsl:call-template>

	<xsl:call-template name="component">
		<xsl:with-param name="xpath" select="$xpath/column-center" />
	</xsl:call-template>

	<xsl:call-template name="component">
		<xsl:with-param name="xpath" select="$xpath/column-right" />
	</xsl:call-template>

</xsl:template>


<xsl:template name="css-hide-all">
	<style type="text/css">
		* { display: none !important; }
	</style>
</xsl:template>


</xsl:stylesheet>

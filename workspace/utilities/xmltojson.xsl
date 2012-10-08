<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	extension-element-prefixes="exsl">

<xsl:import href="toolkit.xsl" />

<xsl:variable name="array" />

<xsl:strip-space elements="* | @*" />


<xsl:template name="json">

	<xsl:param name="xml" />

	<xsl:text>{</xsl:text>
	<xsl:apply-templates select="exsl:node-set($xml)" mode="json" />
	<xsl:text>}</xsl:text>

</xsl:template>


<xsl:template match="*" mode="json">

	<xsl:variable name="has-siblings" select="name(.) = name(preceding-sibling::*) or name(.) = name(following-sibling::*)" />
	<xsl:variable name="has-children" select="child::*" />
	<xsl:variable name="has-attributes" select="@*" />
	<xsl:variable name="is-node" select="$has-siblings and position() = 1 or not($has-siblings) or  $has-children" />

	<xsl:if test="$is-node and not($array) and not($has-siblings)">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name(.)" />
		<xsl:text>": </xsl:text>
	</xsl:if>

	<xsl:if test="$has-siblings">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name(.)" />
		<xsl:text>": </xsl:text>
	</xsl:if>

	<xsl:choose>
		<xsl:when test="$has-attributes and $has-children">
			<xsl:text>{ "_attributes" : {</xsl:text>
			<xsl:apply-templates select="@*" mode="json" />
			<xsl:text>}, </xsl:text>
			<xsl:apply-templates select="* | text()" mode="json" />
			<xsl:text> }</xsl:text>
		</xsl:when>
		<xsl:when test="$has-attributes">
			<xsl:text>{ "_attributes" : {</xsl:text>
			<xsl:apply-templates select="@*" mode="json" />
			<xsl:text>}, "_value" : </xsl:text>
			<xsl:apply-templates select="* | text()" mode="json" />
			<xsl:if test=". = ''">
				<xsl:text>null</xsl:text>
			</xsl:if>
			<xsl:text> }</xsl:text>
		</xsl:when>
		<xsl:when test="$has-children">
			<xsl:text>{ </xsl:text>
			<xsl:apply-templates select="* | text()" mode="json" />
			<xsl:text> }</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="* | text()" mode="json" />
			<xsl:if test=". = ''">
				<xsl:text>null</xsl:text>
			</xsl:if>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:if test="$has-siblings and position() = last()">
		<!-- <xsl:text>}</xsl:text> -->
	</xsl:if>

	<xsl:if test="position() != last()">
		<xsl:text>,</xsl:text>
	</xsl:if>

</xsl:template>


<xsl:template match="text()" mode="json">
	<xsl:variable name="is-string" select="string(number(.)) = 'NaN' and . != 'true' and . != 'false'" />
	<xsl:text>"</xsl:text>
	<xsl:call-template name="string-replace"><!-- Escape Quotes -->
		<xsl:with-param name="haystack" select="." />
		<xsl:with-param name="search" select="'&#34;'" />
		<xsl:with-param name="replace" select="'&#92;&#34;'" />
	</xsl:call-template>
	<xsl:text>"</xsl:text>
</xsl:template>


<xsl:template match="@*" mode="json">
	<xsl:text>"</xsl:text>
	<xsl:value-of select="name()" />
	<xsl:text>" : </xsl:text>
	<xsl:variable name="is-string" select="string(number(.)) = 'NaN' and . != 'true' and . != 'false'" />
	<xsl:if test="not(. = '')">"</xsl:if>
	<xsl:call-template name="string-replace">
		<xsl:with-param name="haystack" select="." />
		<xsl:with-param name="search" select="'&#34;'" />
		<xsl:with-param name="replace" select="'&#92;&#34;'" />
	</xsl:call-template>
	<xsl:if test="not(. = '')">"</xsl:if>
	<xsl:if test=". = ''">null</xsl:if>
	<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>


</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="class-nav">

	<!--

	Call on the component container

	<xsl:call-template name="class-nav">
		<xsl:with-param name="xpath" select="." />
		<xsl:with-param name="classes" select="'additional classes'" />
	</xsl:call-template>

	-->

	<xsl:param name="xpath" />
	<xsl:param name="class" />

	<xsl:attribute name="class">
		<xsl:text>entry </xsl:text>
		<xsl:if test="
			$pt1 = @id or
			//tags-all-entries/entry[ @id = $pt1 ]/parent/item/@id = @id or
			not($pt1) and tag/@handle = 'home'
		">
			<xsl:text>active</xsl:text>
		</xsl:if>
		<xsl:if test="string-length($class)">
			<xsl:text> </xsl:text>
			<xsl:value-of select="$class" disable-output-escaping="yes" />
		</xsl:if>
	</xsl:attribute>

</xsl:template>


<xsl:template name="class-position">

	<!--

	Call on the component container

	<xsl:call-template name="class-position">
		<xsl:with-param name="component" select="'events'" />
	</xsl:call-template>

	-->

	<xsl:param name="component" select="$component" />
	<xsl:param name="class" />

	<xsl:attribute name="class">
		<xsl:text>component </xsl:text>
		<xsl:text>component-</xsl:text>
		<xsl:value-of select="$component" disable-output-escaping="yes" />
		<xsl:if test="string-length($class)">
			<xsl:text> </xsl:text>
			<xsl:value-of select="$class" disable-output-escaping="yes" />
		</xsl:if>
	</xsl:attribute>

</xsl:template>


<xsl:template name="class-rows">

	<!--

	Call on the component rows

	-->

	<xsl:param name="class" />
	<xsl:param name="clearfix" select="true()" />

	<xsl:attribute name="class">
		<xsl:text>entry</xsl:text>
		<xsl:if test="$clearfix">
			<xsl:text> clearfix</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="position() mod 2 = 0">
				<xsl:text> even</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text> odd</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="position() = 1">
			<xsl:text> first</xsl:text>
		</xsl:if>
		<xsl:if test="position() &gt; 1 and position() &lt; last()">
			<xsl:text> middle</xsl:text>
		</xsl:if>
		<xsl:if test="position() = last()">
			<xsl:text> last</xsl:text>
		</xsl:if>
		<xsl:for-each select="tags/item">
			<xsl:text> category-</xsl:text>
			<xsl:value-of select="@id" />
		</xsl:for-each>
		<xsl:if test="file">
			<xsl:choose>
				<xsl:when test="file/@type = 'application/pdf'">
					<xsl:text> pdf</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> unknown</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="string-length($class)">
			<xsl:text> </xsl:text>
			<xsl:value-of select="$class" disable-output-escaping="yes" />
		</xsl:if>
	</xsl:attribute>

</xsl:template>


</xsl:stylesheet>
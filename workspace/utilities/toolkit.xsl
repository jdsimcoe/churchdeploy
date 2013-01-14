<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!--

Toolkit

-->

<xsl:template name="toolkit">

	<xsl:if test="$pt1 = 'toolkit' and $pt2 = 'images'">
		<h1>Responsive Image Toolkit</h1>
		<hr class="soften" />
		<xsl:if test="//images-create/message or //images-create/image/@message">
			<p>
				<b><xsl:value-of select="//images-create/message" /></b>
				<br />
				<xsl:value-of select="//images-create/image/@message" />
			</p>
		</xsl:if>
		<br />
		<form method="post" action="" enctype="multipart/form-data" class="center">
			<input name="fields[image]" type="file" class="btn" />
			<xsl:text>&#160;&#160;</xsl:text>
			<input name="action[images-create]" type="submit" value="Submit" class="btn btn-warning" style="padding:8px; text-transform:uppercase; font-weight: bold;" />
		</form>
		<br /><br />
		<p class="center"><a href="{$root}/symphony/publish/images/new/" class="link link-small">OR use the multiple file uploader »</a></p>
		<br />
		<xsl:if test="//images-toolkit-all-entries-filtered/entry">
			<hr class="soften" />
			<table border="1" style="border-collapse: collapse; width: 100%; border-color: #ededec; border: 1px solid #ededec;">
				<xsl:for-each select="//images-toolkit-all-entries-filtered/entry">
					<tr>
						<td style="padding: 10px">
							<img src="{$root}/image/2/0/50/5/0{image/@path}/{image/filename}" style="border: #000 1px solid" />
						</td>
						<td style="padding: 10px">
							<input value='&lt;img data-responsimage="{image/filename}" style="width: 350px; height: 200px;" class="inline" data-responsimage-anchor="5" src="/workspace/img/spacer.gif" /&gt;' style="width: 550px; font-size: 13px" onclick="this.select()" />
							<p style="font-size: 12px; margin: 5px 0; font-family: helvetica">
								Filesize: <xsl:value-of select="image/@size" /> |
								Type: <xsl:value-of select="image/@type" /> |
								Created: <xsl:value-of select="image/meta/@creation" /> |
								Original size: <xsl:value-of select="image/meta/@width" />x<xsl:value-of select="image/meta/@height" />
							</p>
						</td>
						<td style="padding: 10px">
							<a href="{$root}/symphony/publish/images/edit/{@id}/" class="link link-small">Edit/Delete »</a>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:if>

</xsl:template>


<!--

Global date formatting

-->

<xsl:template name="date-with-format">

	<div class="date">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date" />
			<xsl:with-param name="format" select="'m x, Y'" />
		</xsl:call-template>
	</div>

</xsl:template>


<!--

Global Pagination

-->

<xsl:template name="cd-pagination">

	<xsl:param name="pagination"     select="$pagination" />
	<xsl:param name="pagination-url" select="$pagination-url" />

	<xsl:call-template name="pagination">
		<xsl:with-param name="pagination" select="$pagination" />
		<xsl:with-param name="pagination-url" select="$pagination-url" />
		<xsl:with-param name="show-range" select="5" />
		<xsl:with-param name="label-previous" select="'← Previous'" />
		<xsl:with-param name="label-next" select="'Next →'" />
		<xsl:with-param name="class-pagination" select="'pagination'" />
		<xsl:with-param name="class-page" select="''" />
		<xsl:with-param name="class-next" select="'next'" />
		<xsl:with-param name="class-previous" select="'prev'" />
		<xsl:with-param name="class-selected" select="'active'" />
		<xsl:with-param name="class-disabled" select="'disabled'" />
		<xsl:with-param name="class-ellipsis" select="'disabled'" />
	</xsl:call-template>

</xsl:template>

<!--

Pluralization

Count items to check for pluralization

USAGE:

	<xsl:call-template name="pluralize">
		<xsl:with-param name="singular" select="'Location'" />
		<xsl:with-param name="plural" select="'Locations'" />
		<xsl:with-param name="xpath" select="//locations-entries-by-tag/entry" />
	</xsl:call-template>

-->

<xsl:template name="pluralize">

	<xsl:param name="singular" />
	<xsl:param name="plural" />
	<xsl:param name="xpath" />

	<xsl:choose>
		<xsl:when test="number($xpath - 1)">
			<xsl:choose>
				<xsl:when test="$xpath = 1">
					<xsl:value-of select="$singular" disable-output-escaping="yes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$plural" disable-output-escaping="yes" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="count($xpath) = 1">
					<xsl:value-of select="$singular" disable-output-escaping="yes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$plural" disable-output-escaping="yes" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<!--

How to start a URL when using multi-lingual

-->

<xsl:template name="root">

	<xsl:choose>
		<xsl:when test="$url-language">
			<xsl:value-of select="concat($root, '/', $url-language, '/')" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="concat($root, '/')" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


<!--

Removes HTML tags

-->

<xsl:template name="remove-html">

	<xsl:param name="text" />

	<xsl:choose>
		<xsl:when test="contains($text, '&lt;')">
			<xsl:value-of select="normalize-space(substring-before($text, '&lt;'))" />
			<xsl:text> </xsl:text>
			<xsl:call-template name="remove-html">
				<xsl:with-param name="text" select="normalize-space(substring-after($text, '&gt;'))" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="normalize-space($text)" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


<!--

Strip out spaces in source

-->

<xsl:strip-space elements="*" />

<xsl:template name="nbsp">

	<xsl:param name="text" />

	<xsl:call-template name="string-replace-all">
		<xsl:with-param name="text" select="$text" />
		<xsl:with-param name="replace" select="' '" />
		<xsl:with-param name="by" select="'&#160;'" />
	</xsl:call-template>

</xsl:template>


<!--

Search and replace

-->

<xsl:template name="string-replace-all">
	<xsl:param name="text" />
	<xsl:param name="replace" />
	<xsl:param name="by" />
	<xsl:choose>
		<xsl:when test="contains($text,$replace)">
			<xsl:value-of select="substring-before($text,$replace)" />
			<xsl:value-of select="$by" />
			<xsl:call-template name="string-replace-all">
				<xsl:with-param name="text" select="substring-after($text,$replace)" />
				<xsl:with-param name="replace" select="$replace" />
				<xsl:with-param name="by" select="$by" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$text" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<!--

Truncate

USAGE:

	<xsl:apply-templates select="description" mode="truncate" />

-->

<xsl:strip-space elements="*" />
<!-- limit: the truncation limit -->
<xsl:variable name="limit" select="250" />
<!-- t: Total number of characters in the set -->
<xsl:variable name="t" select="string-length(normalize-space(//body))" />


<xsl:template match="*" mode="truncate">

	<xsl:variable name="preceding-strings">
		<xsl:copy-of select="preceding::text()[ancestor::body]" />
	</xsl:variable>
	<!-- p: number of characters up to the current node -->
	<xsl:variable name="p" select="string-length(normalize-space($preceding-strings))" />

	<xsl:if test="$p &lt; $limit">
		<xsl:element name="{name()}">
			<xsl:apply-templates select="@*" mode="truncate" />
			<xsl:apply-templates mode="truncate" />
		</xsl:element>
	</xsl:if>

</xsl:template>


<xsl:template match="text()" mode="truncate">

	<xsl:variable name="preceding-strings">
		<xsl:copy-of select="preceding::text()[ancestor::body]" />
	</xsl:variable>
	<!-- p: number of characters up to the current node -->
	<xsl:variable name="p" select="string-length(normalize-space($preceding-strings))" />
	<!-- c: number of characters including current node -->
	<xsl:variable name="c" select="$p + string-length(.)" />

	<xsl:choose>
		<xsl:when test="$limit &lt;= $c">
			<xsl:value-of select="substring(., 1, ($limit - $p))" disable-output-escaping="yes" />
			<xsl:text>...</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="." />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


<xsl:template match="@*" mode="truncate">

	<xsl:attribute name="{name(.)}"><xsl:value-of select="." /></xsl:attribute>

</xsl:template>


<!--

Truncate

USAGE:

	<xsl:call-template name="truncate" />

	<xsl:call-template name="truncate">
		<xsl:with-param name="node" select="[xpath]" />
		<xsl:with-param name="length" select="250" />
	</xsl:call-template>

-->

<xsl:template name="truncate">

	<xsl:param name="node" select="." />
	<xsl:param name="length" select="250" />

	<xsl:choose>
		<xsl:when test="string-length(normalize-space($node)) &gt;= $length">
			<xsl:value-of select="substring($node, 0, $length)" disable-output-escaping="yes" />
			<xsl:text>...</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$node" disable-output-escaping="yes" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


<!--

Upper or lowercase in English

http://stackoverflow.com/questions/3053828/lowercase-conversion-in-xsl

To convert a string to lower case or uppercase you can use the XPath 1.0 function translate:

First define your alphabets for lower case and upper case letters. Note that the position of each pair of characters needs to be the same:

<xsl:variable name="en-lowercase-letters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
<xsl:variable name="en-uppercase-letters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

Then you can convert to upper case:
<xsl:value-of select="translate($toconvert,$en-lowercase-letters,$en-uppercase-letters)"/>

or to lower case
<xsl:value-of select="translate($toconvert,$en-uppercase-letters,$en-lowercase-letters)"/>

-->

<xsl:variable name="en-lowercase-letters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
<xsl:variable name="en-uppercase-letters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>


<!--

String replace

USAGE:

	<xsl:call-template name="string-replace">
		<xsl:with-param name="haystack" select="item" />
		<xsl:with-param name="search" select="'ab'" />
		<xsl:with-param name="replace" select="'zz'" />
	</xsl:call-template>

-->

<xsl:template name="string-replace">

	<xsl:param name="haystack" />
	<xsl:param name="search" />
	<xsl:param name="replace" select="''" />

	<xsl:choose>
		<xsl:when test="contains($haystack, $search)">
			<xsl:value-of select="substring-before($haystack, $search)" />
			<xsl:value-of select="$replace" />
			<xsl:call-template name="string-replace">
				<xsl:with-param name="haystack" select="substring-after($haystack, $search)" />
				<xsl:with-param name="search" select="$search" />
				<xsl:with-param name="replace" select="$replace" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$haystack" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


<!--

Title Case

<xsl:variable name="CatName">
  <xsl:call-template name="TitleCase">
    <xsl:with-param name="text" select="translate(normalize-space($ypcategoryname),
'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
  </xsl:call-template>
</xsl:variable>

-->

<xsl:template name="TitleCase">
  <xsl:param name="text" />
  <xsl:param name="lastletter" select="' '"/>

  <xsl:if test="$text">
    <xsl:variable name="thisletter" select="substring($text,1,1)"/>
    <xsl:choose>
      <xsl:when test="$lastletter=' '">
        <xsl:value-of select="translate($thisletter,'abcdefghijklmnopqrstuvwxyz',
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$thisletter"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="TitleCase">
      <xsl:with-param name="text" select="substring($text,2)"/>
      <xsl:with-param name="lastletter" select="$thisletter"/>
    </xsl:call-template>
  </xsl:if>

</xsl:template>


</xsl:stylesheet>
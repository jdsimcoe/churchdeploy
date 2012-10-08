<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!--

Description:
================================================

This utility consists of three templates:

* date-compare
* date-is-valid
* date-is-iso

The 1st checks is a date is earlier than another supplied date and returns:

*  1  if the date is later
*  0  if the date is the same
* -1  if the date is earlier

The 2nd checks if a date is a valid ISO date (e.g. 1970-01-01) and returns:

* 1  if true
* 0  if false

The 3rd checks if a date is valid (that is, a valid number for years, months and days) and returns:

* 1  if true
* 0  if false

Examples:
================================================

<xsl:call-template name="date-compare">
	<xsl:with-param name="first" select="'1970-01-01'" />
	<xsl:with-param name="second" select="'2000-01-01'" />
</xsl:call-template>

<xsl:call-template name="date-is-iso">
	<xsl:with-param name="date" select="'1970-01-01'" />
</xsl:call-template>

<xsl:call-template name="date-is-valid">
	<xsl:with-param name="year" select="1970" />
	<xsl:with-param name="month" select="01" />
	<xsl:with-param name="day" select="01" />
</xsl:call-template>

-->


<xsl:template name="date-compare">

	<xsl:param name="first" select="''" />
	<xsl:param name="second" select="''" />

	<xsl:variable name="date-is-iso-1">
		<xsl:call-template name="date-is-iso">
			<xsl:with-param name="date" select="$first" />
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="date-is-iso-2">
		<xsl:call-template name="date-is-iso">
			<xsl:with-param name="date" select="$second" />
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="y1" select="substring($first, 1, 4)" />
	<xsl:variable name="y2" select="substring($second, 1, 4)" />
	<xsl:variable name="m1" select="substring($first, 6, 2)" />
	<xsl:variable name="m2" select="substring($second, 6, 2)" />
	<xsl:variable name="d1" select="substring($first, 9, 2)" />
	<xsl:variable name="d2" select="substring($second, 9, 2)" />

	<xsl:if test="$date-is-iso-1 = 1 and $date-is-iso-2 = 1">
		<xsl:choose>
			<xsl:when test="$first = $second">
				<xsl:value-of select="0" />
			</xsl:when>
			<xsl:when test="
			 ($y1 &lt; $y2) or
			 ($y1 = $y2 and $m1 &lt; $m2) or
			 ($y1 = $y2 and $m1 = $m2 and $d1 &lt; $d2)">

				<xsl:value-of select="-1" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="1" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:if>

</xsl:template>


<xsl:template name="date-is-valid">

	<xsl:param name="year" select="''" />
	<xsl:param name="month" select="''" />
	<xsl:param name="day" select="''" />

	<xsl:variable name="year-is-integer" select="number($year) = $year and floor($year) = $year" />
	<xsl:variable name="month-is-integer" select="number($month) = $month and floor($month) = $month" />
	<xsl:variable name="day-is-integer" select="number($day) = $day and floor($day) = $day" />

	<xsl:choose>
		<xsl:when test="
		 not($year-is-integer) or not($month-is-integer) or not($day-is-integer) or
		 $year &lt; 1970 or $month &lt; 1 or $month &gt; 12 or
		 $day &lt; 1 or $day &gt; 31 or (
		   ($year mod 4 = 0 and $month = 2 and $day &gt; 29) or
		   ($year mod 4 != 0 and $month = 2 and $day &gt; 28) or
		   (($month = 4 or $month = 6 or $month = 9 or $month = 11) and $day &gt; 30)
		 )">
			<xsl:value-of select="0" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="1" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


<xsl:template name="date-is-iso">

	<xsl:param name="date" select="''" />

	<xsl:choose>
		<xsl:when test="
		 $date != '' and
		 string-length($date) = 10 and
		 substring($date, 5, 1) = '-' and
		 substring($date, 8, 1) = '-'">

			<xsl:variable name="date-is-valid">
				<xsl:call-template name="date-is-valid">
					<xsl:with-param name="year" select="substring($date, 1, 4)" />
					<xsl:with-param name="month" select="substring($date, 6, 2)" />
					<xsl:with-param name="day" select="substring($date, 9, 2)" />
				</xsl:call-template>
			</xsl:variable>

			<xsl:value-of select="$date-is-valid" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="0" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


</xsl:stylesheet>
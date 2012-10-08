<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times"
extension-element-prefixes="date">
<!--

	Description:

	This is a date formatting utility. The named template "format-date" takes 2 parameters:

	1. date - [required] takes an ISO date (2005-12-01T13:45:00)
	2. format - [optional] takes a format string.


	Date formats:

	%ds;	Day suffix, lower case: st, nd, rd, th.
	%DS;	Day suffix, upper case: ST, ND, RD, TH.

	%d;		Day of month, no leading zero.
	%0d;	Day of month, with leading zero.
	%_d;	Day of month, with leading space.
	%d-;	Day of week, shorthand: Mon, Tue, Wed.
	%d+;	Day of week, full length: Monday.
	%dy;	Day of year, no leading zero.
	%0dy;	Day of year, with leading zero.
	%_dy;	Day of year, with leading space.

	%wm;	Week of month, no leading zero.
	%0wm;	Week of month, with leading zero.
	%_wm;	Week of month, with leading space.

	%m;		Month of year, no leading zero.
	%0m;	Month of year, with leading zero.
	%m0;	Month of year, shorthand: Jan, Mar, Sep.
	%m+;	Month of year, full length: January.

	%y2;	Year in 2 digits.
	%y+;	Year in 4 digits.


	Time formats:

	#ts;	AM/PM time suffix in lower case.
	#TS;	AM/PM time suffix in upper case.

	#s;		Seconds, no leading zero.
	#0s;	Seconds, with leading zero.
	#_s;	Seconds, with leading space.

	#m;		Minutes, no leading zero.
	#0m;	Minutes, with leading zero.
	#_m;	Minutes, with leading space.

	#h;		12 Hours, no leading zero.
	#0h;	12 Hours, with leading zero.
	#_h;	12 Hours, with leading space.
	#H;		24 Hours, no leading zero.
	#0H;	24 Hours, with leading zero.
	#_H;	24 Hours, with leading space.

-->

	<date:days>
		<date:day id="1" shorthand="Sun">Sunday</date:day>
		<date:day id="2" shorthand="Mon">Monday</date:day>
		<date:day id="3" shorthand="Tue">Tuesday</date:day>
		<date:day id="4" shorthand="Wed">Wednesday</date:day>
		<date:day id="5" shorthand="Thu">Thursday</date:day>
		<date:day id="6" shorthand="Fri">Friday</date:day>
		<date:day id="7" shorthand="Sat">Saturday</date:day>
	</date:days>

	<date:months>
		<date:month shorthand="Jan">January</date:month>
		<date:month shorthand="Feb">February</date:month>
		<date:month shorthand="Mar">March</date:month>
		<date:month shorthand="Apr">April</date:month>
		<date:month shorthand="May">May</date:month>
		<date:month shorthand="Jun">June</date:month>
		<date:month shorthand="Jul">July</date:month>
		<date:month shorthand="Aug">August</date:month>
		<date:month shorthand="Sep">September</date:month>
		<date:month shorthand="Oct">October</date:month>
		<date:month shorthand="Nov">November</date:month>
		<date:month shorthand="Dec">December</date:month>
	</date:months>

	<xsl:template name="format-date">
		<xsl:param name="date" />
		<xsl:param name="format" select="'%d;%ds; %m+;, %y+;'" />

		<xsl:call-template name="date-controller">
			<xsl:with-param name="date" select="$date" />
			<xsl:with-param name="format" select="$format" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="date-controller">
		<xsl:param name="date" />
		<xsl:param name="format" />

	<!--
		Jump X characters:
	-->
		<xsl:variable name="skip">
			<xsl:choose>
			<!--
				Damn, end of line:
			-->
				<xsl:when test="$format = ''">0</xsl:when>

			<!--
				Date formats:
			-->
				<xsl:when test="starts-with($format, '%ds;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%DS;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%0dy;')">5</xsl:when>
				<xsl:when test="starts-with($format, '%_dy;')">5</xsl:when>
				<xsl:when test="starts-with($format, '%dy;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%d-;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%d+;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%0d;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%_d;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%d;')">3</xsl:when>

				<xsl:when test="starts-with($format, '%0wm;')">5</xsl:when>
				<xsl:when test="starts-with($format, '%_wm;')">5</xsl:when>
				<xsl:when test="starts-with($format, '%wm;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%0wy;')">5</xsl:when>
				<xsl:when test="starts-with($format, '%_wy;')">5</xsl:when>
				<xsl:when test="starts-with($format, '%wy;')">4</xsl:when>

				<xsl:when test="starts-with($format, '%m-;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%m+;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%0m;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%_m;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%m;')">3</xsl:when>

				<xsl:when test="starts-with($format, '%y2;')">4</xsl:when>
				<xsl:when test="starts-with($format, '%y+;')">4</xsl:when>

			<!--
				Time formats:
			-->
				<xsl:when test="starts-with($format, '#ts;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#TS;')">4</xsl:when>

				<xsl:when test="starts-with($format, '#0s;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#_s;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#s;')">3</xsl:when>

				<xsl:when test="starts-with($format, '#0m;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#_m;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#m;')">3</xsl:when>

				<xsl:when test="starts-with($format, '#0h;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#_h;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#h;')">3</xsl:when>
				<xsl:when test="starts-with($format, '#0H;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#_H;')">4</xsl:when>
				<xsl:when test="starts-with($format, '#H;')">3</xsl:when>

			<!--
				Just some filler text:
			-->
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

	<!--
		Get output:
	-->
		<xsl:variable name="out">
			<xsl:choose>
			<!--
				Damn, end of line:
			-->
				<xsl:when test="$format = ''">
					<!-- Nothing to do... -->
				</xsl:when>

			<!--
				Date formats:
			-->
				<xsl:when test="starts-with($format, '%ds;')">
					<xsl:call-template name="format-day-suffix">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="case" select="'lower'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%DS;')">
					<xsl:call-template name="format-day-suffix">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="case" select="'upper'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%0dy;')">
					<xsl:call-template name="format-day-year">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%_dy;')">
					<xsl:call-template name="format-day-year">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%dy;')">
					<xsl:call-template name="format-day-year">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%d-;')">
					<xsl:call-template name="format-day-shorthand">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%d+;')">
					<xsl:call-template name="format-day-name">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%0d;')">
					<xsl:call-template name="format-day-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%_d;')">
					<xsl:call-template name="format-day-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%d;')">
					<xsl:call-template name="format-day-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="''" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="starts-with($format, '%0wm;')">
					<xsl:call-template name="format-week-month">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%_wm;')">
					<xsl:call-template name="format-week-month">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%wm;')">
					<xsl:call-template name="format-week-month">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%0wy;')">
					<xsl:call-template name="format-week-year">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%_wy;')">
					<xsl:call-template name="format-week-year">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%wy;')">
					<xsl:call-template name="format-week-year">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="starts-with($format, '%m-;')">
					<xsl:call-template name="format-month-shorthand">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="length" select="3" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%m+;')">
					<xsl:call-template name="format-month-name">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%0m;')">
					<xsl:call-template name="format-month-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%_m;')">
					<xsl:call-template name="format-month-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%m;')">
					<xsl:call-template name="format-month-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="''" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="starts-with($format, '%y2;')">
					<xsl:call-template name="format-year-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="offset" select="3" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '%y+;')">
					<xsl:call-template name="format-year-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="offset" select="1" />
					</xsl:call-template>
				</xsl:when>

			<!--
				Time formats:
			-->
				<xsl:when test="starts-with($format, '#ts;')">
					<xsl:call-template name="format-time-suffix">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="case" select="'lower'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#TS;')">
					<xsl:call-template name="format-time-suffix">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="case" select="'upper'" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="starts-with($format, '#0s;')">
					<xsl:call-template name="format-second-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#_s;')">
					<xsl:call-template name="format-second-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#s;')">
					<xsl:call-template name="format-second-number">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="starts-with($format, '#0m;')">
					<xsl:call-template name="format-minute-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#_m;')">
					<xsl:call-template name="format-minute-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#m;')">
					<xsl:call-template name="format-minute-number">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="starts-with($format, '#0h;')">
					<xsl:call-template name="format-hour-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
						<xsl:with-param name="mode" select="12" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#_h;')">
					<xsl:call-template name="format-hour-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
						<xsl:with-param name="mode" select="12" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#h;')">
					<xsl:call-template name="format-hour-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="mode" select="12" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#0H;')">
					<xsl:call-template name="format-hour-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="'0'" />
						<xsl:with-param name="mode" select="24" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#_H;')">
					<xsl:call-template name="format-hour-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="prefix" select="' '" />
						<xsl:with-param name="mode" select="24" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="starts-with($format, '#H;')">
					<xsl:call-template name="format-hour-number">
						<xsl:with-param name="date" select="$date" />
						<xsl:with-param name="mode" select="24" />
					</xsl:call-template>
				</xsl:when>

				<!--
					Just some filler text:
				-->
				<xsl:otherwise>
					<xsl:value-of select="substring($format, 1, 1)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="$out" />

		<xsl:if test="$skip > 0">
			<xsl:call-template name="date-controller">
				<xsl:with-param name="date" select="$date" />
				<xsl:with-param name="format" select="substring($format, 1 + number($skip))" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="format-day-number">
		<xsl:param name="date" />
		<xsl:param name="prefix" select="''" />

		<xsl:variable name="day" select="number(substring($date, 9, 2))" />

		<xsl:value-of select="format-number($day, concat($prefix, '0'))" />
	</xsl:template>

	<xsl:template name="format-day-year">
		<xsl:param name="date" />
		<xsl:param name="prefix" select="'-'" />

		<xsl:variable name="day" select="date:day-in-year($date)" />

		<xsl:choose>
			<xsl:when test="string-length($day) = 2">
				<xsl:value-of select="format-number($day, concat($prefix, '00'))" />
			</xsl:when>
			<xsl:when test="string-length($day) = 1">
				<xsl:value-of select="format-number($day, concat($prefix, $prefix, '0'))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$day" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="format-day-suffix">
		<xsl:param name="date" />
		<xsl:param name="case" select="'lower'" />

		<xsl:variable name="day" select="substring($date, 9, 2)" />
		<xsl:variable name="day-suffix">
			<xsl:choose>
				<xsl:when test="(substring($day, 2) = 1) and not(substring($day, 1, 1) = 1)">st</xsl:when>
				<xsl:when test="(substring($day, 2) = 2) and not(substring($day, 1, 1) = 1)">nd</xsl:when>
				<xsl:when test="(substring($day, 2) = 3) and not(substring($day, 1, 1) = 1)">rd</xsl:when>
				<xsl:otherwise>th</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$case = 'upper'">
				<xsl:value-of select="translate($day-suffix, 'stndrh', 'STNDRH')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$day-suffix" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="format-day-name">
		<xsl:param name="date" />

		<xsl:value-of select="document('')/*/date:days/date:day[@id = date:day-in-week($date)]" />
	</xsl:template>

	<xsl:template name="format-day-shorthand">
		<xsl:param name="date" />

		<xsl:value-of select="document('')/*/date:days/date:day[@id = date:day-in-week($date)]/@shorthand" />
	</xsl:template>

	<xsl:template name="format-week-month">
		<xsl:param name="date" />
		<xsl:param name="prefix" select="''" />

		<xsl:variable name="week" select="date:week-in-month($date)" />

		<xsl:value-of select="format-number($week, concat($prefix, '0'))" />
	</xsl:template>

	<xsl:template name="format-week-year">
		<xsl:param name="date" />
		<xsl:param name="prefix" select="''" />

		<xsl:variable name="week" select="date:week-in-year($date)" />

		<xsl:value-of select="format-number($week, concat($prefix, '0'))" />
	</xsl:template>

	<xsl:template name="format-month-number">
		<xsl:param name="date" />
		<xsl:param name="prefix" select="''" />

		<xsl:variable name="month" select="number(substring($date, 6, 2))" />

		<xsl:value-of select="format-number($month, concat($prefix, '0'))" />
	</xsl:template>

	<xsl:template name="format-month-name">
		<xsl:param name="date" />

		<xsl:value-of select="document('')/*/date:months/date:month[date:month-in-year($date)]" />
	</xsl:template>

	<xsl:template name="format-month-shorthand">
		<xsl:param name="date" />

		<xsl:value-of select="document('')/*/date:months/date:month[date:month-in-year($date)]/@shorthand" />
	</xsl:template>

	<xsl:template name="format-year-number">
		<xsl:param name="date" />
		<xsl:param name="offset" select="3" />

		<xsl:variable name="year" select="substring($date, 1, 4)" />

		<xsl:value-of select="substring($year, $offset)" />
	</xsl:template>

	<xsl:template name="format-time-suffix">
		<xsl:param name="date" />
		<xsl:param name="case" select="'lower'" />

		<xsl:variable name="hour" select="number(substring-before(substring-after($date, 'T'), ':'))" />
		<xsl:variable name="suffix">
			<xsl:choose>
				<xsl:when test="$hour &lt; 12">am</xsl:when>
				<xsl:otherwise>pm</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$case = 'upper'">
				<xsl:value-of select="translate($suffix, 'apm', 'APM')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$suffix" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="format-second-number">
		<xsl:param name="date" />
		<xsl:param name="prefix" select="''" />

		<xsl:variable name="second-raw" select="number(substring-after(substring-after(substring-after($date, 'T'), ':'), ':'))" />
		<xsl:variable name="second">
			<xsl:choose>
				<xsl:when test="$second-raw">
					<xsl:value-of select="$second-raw" />
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="format-number($second, concat($prefix, '0'))" />
	</xsl:template>

	<xsl:template name="format-minute-number">
		<xsl:param name="date" />
		<xsl:param name="prefix" select="''" />

		<xsl:variable name="minute-raw">
			<xsl:choose>
				<xsl:when test="substring-before(substring-after(substring-after($date, 'T'), ':'), ':')">
					<xsl:value-of select="substring-before(substring-after(substring-after($date, 'T'), ':'), ':')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring-after(substring-after($date, 'T'), ':')" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="minute">
			<xsl:choose>
				<xsl:when test="number($minute-raw)">
					<xsl:value-of select="$minute-raw" />
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="format-number($minute, concat($prefix, '0'))" />
	</xsl:template>

	<xsl:template name="format-hour-number">
		<xsl:param name="date" />
		<xsl:param name="prefix" select="''" />
		<xsl:param name="mode" />

		<xsl:variable name="hour-raw" select="number(substring-before(substring-after($date, 'T'), ':'))" />
		<xsl:variable name="hour">
			<xsl:choose>
				<xsl:when test="$mode = 12">
                    <xsl:choose>
                        <!-- don't output noon as 0 -->
                        <xsl:when test="$hour-raw = 12 or $hour-raw = 00">12</xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$hour-raw mod 12" />
                        </xsl:otherwise>
                    </xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$hour-raw" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:value-of select="format-number(number($hour), concat($prefix, '0'))" />
	</xsl:template>
</xsl:stylesheet>
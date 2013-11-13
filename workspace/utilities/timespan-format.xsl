<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--

Drop me a note @kirkstrobeck if you use this, I'd like to see it in the wild :P


Example XSL generated from https://github.com/hananils/datetime

	<date timeline="1" type="range">
		<start iso="2012-11-17T13:00:00-08:00" time="13:00" weekday="6" offset="-0800">2012-11-17</start>
		<end iso="2012-07-29T08:00:00-07:00" time="08:00" weekday="7" offset="-0700">2012-07-29</end>
	</date>


Call using

	<xsl:call-template name="timespan-format">
		<xsl:with-param name="date" select="date" />
	</xsl:call-template>


Examples are ..

	- Saturday, Nov. 17 at 10am
	- Saturday, Nov. 17 from 1-2pm
	- Saturday, Nov. 17 from 10am-2:30pm
	- Saturday, Nov. 17th at 10am - Monday, the 19th at 11am
	- Saturday, Nov. 17 at 1pm - Sunday, Jul. 29 at 8am

-->

<xsl:template name="timespan-format">

	<xsl:param name="date" />

	<xsl:for-each select="$date">
		<xsl:choose>
			<xsl:when test="start and end">
				<xsl:variable name="start-month">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="start/@iso" />
						<xsl:with-param name="format" select="'%m;'" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="end-month">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="end/@iso" />
						<xsl:with-param name="format" select="'%m;'" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="start-day">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="start/@iso" />
						<xsl:with-param name="format" select="'%d;'" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="end-day">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="end/@iso" />
						<xsl:with-param name="format" select="'%d;'" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="start-ampm">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="start/@iso" />
						<xsl:with-param name="format" select="'#ts;'" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="end-ampm">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="end/@iso" />
						<xsl:with-param name="format" select="'#ts;'" />
					</xsl:call-template>
					<xsl:text>&#160;</xsl:text>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$start-day = $end-day">
						<xsl:call-template name="format-date">
							<xsl:with-param name="date" select="start/@iso" />
							<xsl:with-param name="format" select="'%d+;, %m-;. %d;%ds;'" />
						</xsl:call-template>
						<xsl:text> from </xsl:text>
						<xsl:call-template name="timespan-format-time">
							<xsl:with-param name="date" select="start/@iso" />
						</xsl:call-template>
						<xsl:if test="not($start-ampm = $end-ampm)">
							<xsl:value-of select="$start-ampm" />
						</xsl:if>
						<xsl:if test="end">
							<xsl:text>-</xsl:text>
							<xsl:call-template name="timespan-format-time">
								<xsl:with-param name="date" select="end/@iso" />
							</xsl:call-template>
						</xsl:if>
						<xsl:value-of select="$end-ampm" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="timespan-format-single-datetime">
							<xsl:with-param name="date" select="start" />
						</xsl:call-template>
						<xsl:text> - </xsl:text>
						<xsl:choose>
							<xsl:when test="$start-month = $end-month">
								<xsl:call-template name="timespan-format-single-datetime">
									<xsl:with-param name="date" select="end" />
									<xsl:with-param name="no-month" select="true()" />
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="timespan-format-single-datetime">
									<xsl:with-param name="date" select="end" />
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="timespan-format-single-datetime">
					<xsl:with-param name="date" select="start" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>

</xsl:template>


<xsl:template name="timespan-format-single-datetime">

	<xsl:param name="date" /> <!-- start or end -->
	<xsl:param name="no-month" select="false()" />

	<xsl:for-each select="$date">
		<xsl:choose>
			<xsl:when test="$no-month">
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="@iso" />
					<xsl:with-param name="format" select="'%d+;, the %d;%ds;'" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="@iso" />
					<xsl:with-param name="format" select="'%d+;, %m-;. %d;%ds;'" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> at </xsl:text>
		<xsl:call-template name="timespan-format-time">
			<xsl:with-param name="date" select="@iso" />
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="@iso" />
			<xsl:with-param name="format" select="'#ts;'" />
		</xsl:call-template>
	</xsl:for-each>

</xsl:template>


<xsl:template name="timespan-format-time">

	<xsl:param name="date" /> <!-- iso -->

	<xsl:variable name="minutes">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="$date" />
			<xsl:with-param name="format" select="'#0m;'" />
		</xsl:call-template>
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="$minutes = '00'">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="$date" />
				<xsl:with-param name="format" select="'#h;'" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="$date" />
				<xsl:with-param name="format" select="'#h;:#0m;'" />
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


</xsl:stylesheet>
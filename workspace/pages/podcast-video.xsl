<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:include href="../utilities/date-time-advanced.xsl"/>

<xsl:template match="/">

	<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
	  <channel>
      <title><xsl:value-of select="$podcast-video-title"/></title>
      <link><xsl:value-of select="$root" /></link>
      <itunes:summary><xsl:value-of select="$podcast-video-summary" disable-output-escaping="yes"/></itunes:summary>
      <itunes:subtitle><xsl:value-of select="$podcast-video-subtitle" disable-output-escaping="yes"/></itunes:subtitle>
      <itunes:author><xsl:value-of select="$podcast-video-author" disable-output-escaping="yes"/></itunes:author>
      <language>en-us</language>
      <copyright>
				<xsl:choose>
					<xsl:when test="$podcast-video-year &gt;= $this-year">
						<xsl:text>©</xsl:text>
						<xsl:value-of select="$this-year"/>
						<xsl:text>. </xsl:text>
						<xsl:value-of select="$website-name" />
						<xsl:text>. All rights reserved.</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>©</xsl:text>
						<xsl:value-of select="$podcast-video-year"/>
						<xsl:text>-</xsl:text>
						<xsl:value-of select="$this-year"/>
						<xsl:text>. </xsl:text>
						<xsl:value-of select="$website-name" />
						<xsl:text>. All rights reserved.</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</copyright>
      <itunes:owner>
        <itunes:name><xsl:value-of select="$website-name" /></itunes:name>
        <itunes:email><xsl:value-of select="$podcast-video-email"/></itunes:email>
      </itunes:owner>
      <itunes:image>
        <xsl:attribute name="href">
          <xsl:value-of select="$root" />
          <xsl:text>/workspace/themes/active/img/podcast-video.jpg</xsl:text>
        </xsl:attribute>
      </itunes:image>
      <!-- iTunes Browse Podcasts Category -->
      <itunes:category text="{$podcast-video-category}">
        <!-- iTunes Browse Podcasts Subcategory -->
        <itunes:category text="{$podcast-video-subcategory}"></itunes:category>
      </itunes:category>
      <itunes:keywords><xsl:value-of select="$podcast-video-keywords"/></itunes:keywords>
      <!-- Start Sermon Information -->
      <xsl:for-each select="data/podcast-video/entry">
	      <item>
          <title>
            <xsl:variable name="en-lowercase-letters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
            <xsl:variable name="en-uppercase-letters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
            <xsl:value-of select="title" />
            <xsl:text> (</xsl:text>
            <xsl:value-of select="translate(filename,$en-lowercase-letters,$en-uppercase-letters)"/>
            <xsl:text>) by </xsl:text>
            <xsl:value-of select="speaker/item/first-name" />
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="speaker/item/last-name" />
          </title>
          <itunes:author>
            <xsl:value-of select="speaker/item/first-name" />
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="speaker/item/last-name" />
          </itunes:author>
          <itunes:subtitle>
            <xsl:value-of select="book/item" />
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="chapter" />
          </itunes:subtitle>
          <itunes:summary>
            <xsl:value-of select="book/item" />
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="chapter" />
          </itunes:summary>
          <itunes:image>
            <xsl:attribute name="href">
              <xsl:value-of select="$root" />
              <xsl:text>/workspace/themes/active/img/podcast-video.jpg</xsl:text>
            </xsl:attribute>
          </itunes:image>
          <enclosure>
            <xsl:attribute name="url">
              <xsl:value-of select="$podcast-video-server"/>
              <xsl:value-of select="filename"/>
              <xsl:text>.mp4</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="length">
              <xsl:choose>
                <xsl:when test="video-filesize">
                  <xsl:value-of select="video-filesize" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>23456789</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="type">
                <xsl:text disable-output-escaping="yes">video/mp4</xsl:text>
            </xsl:attribute>
          </enclosure>
          <guid>
            <xsl:variable name="en-lowercase-letters">abcdefghijklmnopqrstuvwxyz</xsl:variable>
            <xsl:variable name="en-uppercase-letters">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
            <xsl:value-of select="$podcast-video-server"/>
            <xsl:value-of select="translate(filename,$en-uppercase-letters,$en-lowercase-letters)"/>
            <xsl:text>.mp4</xsl:text>
          </guid>
          <pubDate>
            <xsl:call-template name="format-date">
              <xsl:with-param name="date" select="date/date/start/@iso" />
              <xsl:with-param name="format" select="'%d-;, %d; %m+; %y+; #0h;:#0m;:#0s; -0700'" />
            </xsl:call-template>
          </pubDate>
          <itunes:duration>
            <xsl:choose>
              <xsl:when test="video-duration">
              	<xsl:value-of select="video-duration" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>00:60:00</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </itunes:duration>
	      </item>
      </xsl:for-each>

	  </channel>
	  </rss>

</xsl:template>

</xsl:stylesheet>

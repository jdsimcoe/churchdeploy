<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="page-home">

  <div class="horizon events-home">
    <div class="container">
<!--       <div class="center">
        <i class="glyphicon-calendar icon-medium"></i>
      </div> -->
      <h3>Upcoming Events</h3>
      <hr/>
      <div class="row">
        <xsl:apply-templates select="/data/events-6-latest/entry" mode="home" />
      </div>
    </div>
  </div>

</xsl:template>


<xsl:template name="page-home-tagline">

  <div class="center">
    <p class="lead large">We are a body of Christians striving to follow Jesus, serve one another, and study God's Word.</p>
    <hr/>
    <p class="lead">Our mission is to see disciples of Jesus made in the greater Portland area.</p>
  </div>

</xsl:template>


<xsl:template name="page-live">

  <xsl:choose>
    <xsl:when test="/data/status-all-entries/entry[name = 'ustream-status']/content = 'live'">
      <h2>Live Broadcast</h2>
    </xsl:when>
    <xsl:otherwise>
      <h2>Live Broadcast (Offline)</h2>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="/data/status-all-entries/entry[name = 'ustream-status']/content = 'live'">
      <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='broadcast-live']/content)" disable-output-escaping="yes" />
      <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='broadcast-offline']/content)" disable-output-escaping="yes" />
      <xsl:value-of select="normalize-space(/data/misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


</xsl:stylesheet>
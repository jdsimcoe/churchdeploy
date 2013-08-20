<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="page-home">

  <div class="events-home">
    <div class="container">
      <!-- <div class="center">
        <i class="glyphicon-calendar icon-medium"></i>
      </div> -->
      <h3>Upcoming Events</h3>
      <hr/>
      <div class="row">
        <xsl:apply-templates select="/data/events-6-latest/entry" mode="home" />
      </div>
    </div>
  </div>

  <div class="teachings-home">
    <div class="container">
<!--       <div class="center">
        <i class="glyphicon-book icon-medium"></i>
      </div> -->

      <xsl:apply-templates select="/data/featured-teachings/entry" mode="home" />

    </div>
  </div>

  <div class="announce">
    <div class="announce-1">
      <xsl:attribute name="style">
        <xsl:text>background:url('</xsl:text>
        <xsl:text>/workspace/themes/active/img/announce-1.jpg</xsl:text>
        <xsl:text>');</xsl:text>
      </xsl:attribute>
      <a href="/" class="btn btn-block btn-large">
        <h3>Meetings</h3>
        <p>
          Our weekly gathering are<br/>
          centered on time in the Scriptures.
        </p>
      </a>
    </div>
    <div class="announce-2">
      <xsl:attribute name="style">
        <xsl:text>background:url('</xsl:text>
        <xsl:text>/workspace/themes/active/img/announce-2.jpg</xsl:text>
        <xsl:text>');</xsl:text>
      </xsl:attribute>
      <a href="/" class="btn btn-block btn-large">
        <h3>I'm New Here</h3>
        <p>
          Get introduced to Athey Creek<br/>
          so you know what to expect when you visit.
        </p>
      </a>
    </div>
    <div class="announce-3">
      <xsl:attribute name="style">
        <xsl:text>background:url('</xsl:text>
        <xsl:text>/workspace/themes/active/img/announce-3.jpg</xsl:text>
        <xsl:text>');</xsl:text>
      </xsl:attribute>
      <a href="/" class="btn btn-block btn-large">
        <h3>Home Groups</h3>
        <p>
          Seeking Jesus through communion,<br/>
          prayer, meals, and fellowship.
        </p>
      </a>
    </div>
    <div class="announce-4">
      <xsl:attribute name="style">
        <xsl:text>background:url('</xsl:text>
        <xsl:text>/workspace/themes/active/img/announce-4.jpg</xsl:text>
        <xsl:text>');</xsl:text>
      </xsl:attribute>
      <a href="/" class="btn btn-block btn-large">
        <h3>Servant Ministry</h3>
        <p>
          Serving the body of Christ<br/>
          with our time, talent &amp; treasure.
        </p>
      </a>
    </div>
  </div>

  <xsl:call-template name="podcast"/>

</xsl:template>

<xsl:template name="podcast">
  <div class="podcast">
    <div class="container">
      <h3>Official Podcasts</h3>
      <hr/>
      <div class="row">
        <div class="col-lg-4">
          <a href="{$main-podcast-audio}" target="_blank">
            <img src="{$root}/workspace/themes/active/img/podcast-audio.jpg" width="100%" alt=""/>
            <div class="overlay">
              <span class="btn btn-large">VIEW ON iTUNES</span>
            </div>
          </a>
        </div>
        <div class="col-lg-4">
          <a href="{$main-podcast-video}" target="_blank">
            <img src="{$root}/workspace/themes/active/img/podcast-video.jpg" width="100%" alt=""/>
            <div class="overlay">
              <span class="btn btn-large">VIEW ON iTUNES</span>
            </div>
          </a>
        </div>
        <div class="col-lg-4">
          <a href="{$main-podcast-video-hd}" target="_blank">
            <img src="{$root}/workspace/themes/active/img/podcast-video-hd.jpg" width="100%" alt=""/>
            <div class="overlay">
              <span class="btn btn-large">VIEW ON iTUNES</span>
            </div>
          </a>
        </div>
      </div>
    </div>
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
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="page-home">

  <div class="events-home">
    <div class="container">
      <!-- <div class="center">
        <i class="glyphicon-calendar icon-medium"></i>
      </div> -->
      <h3>Upcoming Events</h3>
<!--       <hr/> -->
      <div class="row">
        <xsl:apply-templates select="/data/events-3-latest/entry" mode="home" />
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
    <div class="row">
      <div class="col-lg-6">
        <xsl:attribute name="style">
          <xsl:text>background:url('</xsl:text>
          <xsl:text>/workspace/themes/active/img/announce-1.jpg</xsl:text>
          <xsl:text>');</xsl:text>
        </xsl:attribute>
        <a href="/" class="btn btn-block btn-large">
          <h3>Bullitt</h3>
          <p>
            One of the best movies of all time;<br/>
            Steve McQueen is a beast!
          </p>
        </a>
      </div>
      <div class="col-lg-6">
        <xsl:attribute name="style">
          <xsl:text>background:url('</xsl:text>
          <xsl:text>/workspace/themes/active/img/announce-2.jpg</xsl:text>
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
  </div>

  <xsl:call-template name="home-groups"/>

  <xsl:call-template name="podcast"/>

</xsl:template>

<xsl:template name="home-groups">

  <div class="home-groups">
    <div class="content">
      <div class="container">
        <div class="center">
          <i class="glyphicon glyphicon-home icon-medium"></i>
        </div>
      </div>
      <h3>Home Groups</h3>
      <p class="lead">The goal of our Home Groups is to faciliate people coming together in community and sharing Christ's work—deepening each other in truth.</p>
      <p class="center">
        <a href="{$root}/home-groups" class="btn btn-large">View Athey Home Groups</a>
      </p>
    </div>
  </div>

</xsl:template>

<xsl:template name="podcast">
<!--   <div class="podcast">
    <div class="container">
      <h3>Official Podcasts</h3>
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
  </div> -->
  <div class="podcast">
    <div class="container">
      <h3>Official Podcasts</h3>
      <p class="lead">Podcasts are the easiest way to stay up-to-date with our teachings via audio or video from any of your devices:</p>
      <div class="row">
        <div class="col-lg-4">
          <a href="{$main-podcast-audio}" target="_blank" class="btn btn-large btn-bordered">Audio Podcast</a>
        </div>
        <div class="col-lg-4">
          <a href="{$main-podcast-video}" target="_blank" class="btn btn-large btn-bordered">Video Podcast</a>
        </div>
        <div class="col-lg-4">
          <a href="{$main-podcast-video-hd}" target="_blank" class="btn btn-large btn-bordered">Video Podcast (HD)</a>
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
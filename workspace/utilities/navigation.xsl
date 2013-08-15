<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="nav-links">

  <a href="#menu" id="menu-trigger" class="icon-bar-wrapper pull-right">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </a>

  <xsl:if test="/data/status-all-entries/entry[name = 'ustream-status']/content = 'live'">
    <a href="{$root}/live" class="btn btn-primary pull-right">
      <i class="glyphicon-facetime-video"></i>
      <xsl:text> LIVE</xsl:text>
    </a>
  </xsl:if>

</xsl:template>


<xsl:template name="navigation">

  <div id="secondary">
    <form action="get">
      <xsl:call-template name="form-search-action" />
      <input name="keywords" type="text" class="col-lg-12" placeholder="Search" autocomplete="off" onclick="this.select()">
      </input>
    </form>
    <div class="nav">
      <xsl:for-each select="/data/tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
        <xsl:call-template name="subnav-entry-mobile" />
      </xsl:for-each>
      <h3 class="allcaps">
        <span class="no-link">Extras</span>
        <hr/>
        <ul class="dropdown-menu">
          <li><a href="http://ebible.com/query?utf=8%E2%9C%93&#x26;query=John%203&#x26;translation=KJV&#x26;redirect_iframe={$root}/bible/">Bible</a></li>
          <li><a href="{$root}/meetings/">Meetings</a></li>
          <li><a href="{$root}/give/">Give</a></li>
          <li>
            <a href="{$root}/events/12962/tuesday-sunrise-worship/">
              <xsl:text>Worship: </xsl:text>
              <xsl:value-of select="/data/misc-all-entries/entry[name='sunrise-worship']/content" disable-output-escaping="yes" />
            </a>
          </li>
          <hr/>
        </ul>
      </h3>
      <xsl:if test="$cookie-username">
        <h3 class="allcaps">
          <span class="no-link">Admin</span>
          <hr/>
          <ul class="dropdown-menu">
            <li><a href="/symphony/" target="_blank">Symphony</a></li>
            <li><a href="?debug" target="_blank">Debug</a></li>
            <xsl:if test="not($pt1 = 'toolkit')">
              <li>
                <a>
                  <xsl:attribute name="href">
                    <xsl:choose>
                      <xsl:when test="$pt1">
                        <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/', $pt1, '/')" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/',/data/tags-all-entries/entry[tag/@handle = 'home']/@id , '/')" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:text> Edit Page</xsl:text>
                </a>
              </li>
            </xsl:if>
            <li><a href="{$root}/symphony/logout/">Logout</a></li>
          </ul>
        </h3>
      </xsl:if>
    </div>
  </div>

</xsl:template>


</xsl:stylesheet>
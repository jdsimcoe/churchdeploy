<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
	method="xml"
	omit-xml-declaration="yes"
	indent="no"
	/>

<xsl:template name="template-head">
	<link rel="stylesheet" href="{$workspace}/themes/active/css/common.2.3.2.css" />
	<xsl:comment><![CDATA[[if lte IE 7]> <link rel="stylesheet" href="{$workspace}/themes/active/css/font-awesome-ie7.css" /> <![endif]]]></xsl:comment>
	<link rel="canonical" href="{$current-url}" />
	<xsl:choose>
		<xsl:when test="number($pt1) and $pt1 = 20 and $pt3 or number($pt1) and $pt1 = 20 and $pt3">
			<link rel="shorturl" href="http://accf.co/{$pt3}" />
			<link rel="shortlink" href="http://accf.co/{$pt3}" />
		</xsl:when>
		<xsl:otherwise>
			<link rel="shorturl" href="http://accf.co/{$pt1}" />
			<link rel="shortlink" href="http://accf.co/{$pt1}" />
		</xsl:otherwise>
	</xsl:choose>
	<link rel="dns-prefetch" href="{$root}" />
	<!--
	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each>
	<meta http-equiv="x-dns-prefetch-control" content="on" />

	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each>
	-->
	<script src="{root}/workspace/themes/active/js/typekit-ck.js"></script>
  <script>
  	<xsl:comment>
    var _gaq=[['_setAccount','UA-32000708-1'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
  	</xsl:comment>
	</script>

</xsl:template>

<xsl:template name="template-header-outside-container">
	<div class="alerts">
		<xsl:call-template name="alerts" />
	</div>
	<div class="navbar main navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<div>
					<form class="navbar-search pull-left" action="get">
						<xsl:call-template name="form-search-action" />
						<a>
							<xsl:call-template name="url-search-home" />
							<i class="icon-search icon-large"></i>
						</a>
						<input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
					</form>
					<xsl:if test="$cookie-username">
						<div class="btn-group pull-right">
						  <button class="btn"><a href="/symphony/">Symphony</a></button>
						  <button class="btn dropdown-toggle" data-toggle="dropdown">
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu">
						    <li>
						    	<a href="?debug">Debug</a>
						    </li>
						    <li>
						    	<a href="{$root}/symphony/logout/">Logout</a>
						    </li>
						    <xsl:if test="not($pt1 = 'toolkit')">
								<li>
									<a>
										<xsl:attribute name="href">
											<xsl:choose>
												<xsl:when test="$pt1">
													<xsl:value-of select="concat($root, '/symphony/publish/tags/edit/', $pt1, '/')" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat($root, '/symphony/publish/tags/edit/',//tags-all-entries/entry[tag/@handle = 'home']/@id , '/')" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<xsl:text> Edit Page</xsl:text>
									</a>
								</li>
							</xsl:if>
						  </ul>
						</div>
					</xsl:if>
					<ul class="nav pull-right">
						<xsl:if test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
							<li>
								<a href="{$root}/24/give/">
									<xsl:attribute name="class">
										<xsl:text>modalLiveLink</xsl:text>
										<xsl:choose>
											<xsl:when test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
												<xsl:text> online</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text> offline</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<i class="icon-facetime-video icon-large"></i>
									<xsl:text>Live</xsl:text>
								</a>
							</li>
							<li class="divider-vertical"></li>
						</xsl:if>
						<li><a href="{$root}/13391/im-new-here/">New Here?</a></li>
						<li class="divider-vertical"></li>
						<li><a href="{$root}/24/give/" class="last">Give</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="navbar mobile navbar-inverse">
		<form class="navbar-search pull-left" action="get">
			<xsl:call-template name="form-search-action" />
			<a>
				<xsl:call-template name="url-search-home" />
				<i class="icon-search icon-large"></i>
			</a>
			<input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
		</form>
		<div class="navbar-inner">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li><a href="{$root}/13391/im-new-here/">New Here?</a></li>
						<li><a href="{$root}/24/give/">Give</a></li>
						<li class="divider-vertical"></li>
					</ul>
					<ul class="nav">
						<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
							<xsl:call-template name="subnav-entry" />
						</xsl:for-each>
					</ul>
				</div>

		</div>
	</div>

	<div class="header mast" id="overview">
		<div class="container">
			<div class="row">
				<div class="span12">
					<a href="{$root}" class="logo standard">
						<span><i class="anchor">a</i> Anchor Church</span>
					</a>
					<ul class="main nav nav-pills">
						<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
							<xsl:call-template name="subnav-entry" />
						</xsl:for-each>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<xsl:if test="not($pt1) or $pt1 = 43">
		<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='tagline']/content)" disable-output-escaping="yes" />
		<div class="feature">
			<div class="container main-container">
				<div class="row home">
					<div id="main-content" class="span12">
						<h3>Featured Content</h3>
						<div id="frontCarousel" class="carousel slide">
              <div class="carousel-inner">
                <div class="item active">
									<xsl:for-each select="//teachings-featured-filtered/entry">
										<xsl:call-template name="teaching-entry" />
									</xsl:for-each>
                </div>
	              <xsl:if test="not($pt1) or $pt1 = 43">
									<xsl:call-template name="component-featured">
										<xsl:with-param name="entries" select="//featured-random/entry" />
									</xsl:call-template>
								</xsl:if>
              </div>
              <a class="left carousel-control" href="#frontCarousel" data-slide="prev">‹</a>
              <a class="right carousel-control" href="#frontCarousel" data-slide="next">›</a>
            </div>
					</div>
				</div>
			</div>
		</div>
		<div class="events">
			<div class="container">
				<div class="row">
					<div class="span12">
						<xsl:call-template name="component-events">
							<xsl:with-param name="position" select="'column-home'" />
							<xsl:with-param name="entries" select="//events-3-latest/entry" />
						</xsl:call-template>
					</div>
				</div>
			</div>
		</div>

		<div class="container margin">
			<div class="row podcast">
				<div class="span2">
					<h3>Podcast</h3>
				</div>
				<div class="span7">
					<p>One of the best ways to connect to our Bible teachings is through podcasts. Our Audio Podcast streams all of our latest teachings to your device(s).</p>
				</div>
				<div class="span3">
					<a class="link link-big">
						<xsl:attribute name="href">
							<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='podcast-audio']/content)" disable-output-escaping="yes" />
						</xsl:attribute>
						<xsl:text>View in iTunes</xsl:text>
					</a>
				</div>
			</div>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="template-header-inside-container">

	<xsl:variable name="parent" select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id" />

	<xsl:if test="$pt1 and not($pt1 = //tags-all-entries/entry[tag/@handle = 'home']/@id)">
		<div class="subnavs">
			<xsl:for-each select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id">
				<xsl:call-template name="nav-tier" />
			</xsl:for-each>
			<xsl:call-template name="subnav-group">
				<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $pt1 and not(hide-from-header = 'Yes')]" />
			</xsl:call-template>
		</div>

		<div class="subnav-mobile">
			<xsl:for-each select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id">
				<xsl:call-template name="nav-tier-mobile" />
			</xsl:for-each>
			<xsl:call-template name="subnav-mobile">
				<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $pt1 and not(hide-from-header = 'Yes')]" />
			</xsl:call-template>
		</div>

	</xsl:if>

</xsl:template>


<xsl:template name="nav-tier">

	<xsl:variable name="node" select="." />

	<xsl:for-each select="//tags-all-entries/entry[@id = $node]/parent/item/@id">
		<xsl:call-template name="nav-tier" />
	</xsl:for-each>
	<xsl:call-template name="subnav-group">
		<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
	</xsl:call-template>

</xsl:template>

<xsl:template name="nav-tier-mobile">

	<xsl:variable name="node" select="." />

	<xsl:for-each select="//tags-all-entries/entry[@id = $node]/parent/item/@id">
		<xsl:call-template name="nav-tier-mobile" />
	</xsl:for-each>
	<xsl:call-template name="subnav-mobile">
		<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
	</xsl:call-template>

</xsl:template>


<xsl:template name="template-footer-inside-container">

	<xsl:if test="not($pt1) or $pt1 = 43">

		<div class="component-teachings">
			<div class="row">
				<div class="span12">
					<h3>Recent Teachings</h3>
            <div class="row">
              <xsl:for-each select="//teachings-6-latest/entry">
                <div>
                	<xsl:attribute name="class">
                		<xsl:text>span4 recent number</xsl:text>
                		<xsl:value-of select="position()" />
                	</xsl:attribute>
                  <a>
                      <xsl:call-template name="url-teachings" />

                      <h4>
                          <xsl:value-of select="title" disable-output-escaping="yes" />
                      </h4>

                    <div class="meta">
                        <p>
                            <xsl:call-template name="date-teaching">
                                <xsl:with-param name="date" select="date/date/start/@iso" />
                            </xsl:call-template>
                        </p>
                    </div>
                    <div class="description">
                        <xsl:call-template name="truncate">
                            <xsl:with-param name="node" select="description" />
                            <xsl:with-param name="length" select="110" />
                        </xsl:call-template>
                    </div>
                	</a>
                </div>
              </xsl:for-each>
            </div>
				</div>
			</div>

			<div class="component-series">
				<h3>Recent Series</h3>
				<div class="row">
				    <xsl:for-each select="//teachings-series-home-filtered/entry">
		            	<div class="span4 series">
							<a>
								<xsl:call-template name="url-teachings-series" />
								<xsl:call-template name="teaching-poster-or-default">
									<xsl:with-param name="poster" select="poster" />
								</xsl:call-template>
							</a>
						</div>
					</xsl:for-each>
				</div>
			</div>

		</div>
	</xsl:if>

	<div class="footer">
		<div class="footer-nav container">
			<div class="row">
				<div class="span2">
					<ul class="nav nav-list">
						<li class="nav-header first"><a href="/7761/meetings/">Meetings</a></li><br />
						<li class="nav-header"><a href="/21/teachings/">Teachings</a></li><br />
						<li class="nav-header"><a href="/20/events/">Events</a></li><br />
						<li class="nav-header"><a href="/22/ministries/">Ministries</a></li><br />
						<li class="nav-header"><a href="/74/home-groups/">Home Groups</a></li><br />
						<li class="nav-header"><a href="/18/about/">About</a></li>
					</ul>
				</div>
				<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='footer']/content)" disable-output-escaping="yes" />
				<div class="span4 twitter">
					<h4><a href="http://twitter.com/atheycreek/" target="_blank"><i class="icon-twitter"></i>&#160;&#160;Recently on Twitter</a></h4>
					<ul>
					<xsl:for-each select="//twitter-latest-entry/entry">
						<li>
							<xsl:attribute name="class">
								<xsl:text>entry</xsl:text>
								<xsl:if test="position() = 1">
									<xsl:text> first</xsl:text>
								</xsl:if>
								<xsl:if test="position() = last()">
									<xsl:text> last</xsl:text>
								</xsl:if>
							</xsl:attribute>
							<xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
							<xsl:text>&#160;&#160;</xsl:text>
							<strong>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%d;'" />
								</xsl:call-template>
								<xsl:text>&#160;</xsl:text>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%m-;'" />
								</xsl:call-template>
								<xsl:text>&#160;</xsl:text>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%y+;'" />
								</xsl:call-template>
							</strong>
						</li>
					</xsl:for-each>
					</ul>
				</div>
			</div>
		</div>
		<div class="baseline">
			<div class="container">
				<div class="row">
					<div class="span12 center">
						<div class="facebook">
							<a href="https://www.facebook.com/pages/Athey-Creek-Christian-Fellowship/138279749547289">Visit us on Facebook</a>
						</div>
						<div class="copyright">
							<xsl:text>© </xsl:text>
							<xsl:text>2011-</xsl:text>
							<xsl:value-of select="$this-year" />
							<xsl:text>. </xsl:text>
							<a href="{$root}"><xsl:value-of select="$website-name" /></a>
							<xsl:text>. All&#160;rights&#160;reserved. </xsl:text>
							<span class="dev">
							   <a href="{$root}/13563/our-website/">Built with Church Deploy</a>
							   <span class="divider">|</span>
							   <a href="{$root}/13667/api/">API</a>
							   <br />
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal hide fade in modalLive" id="modalLive">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="false">×</button>
	    <h3>
	    	<xsl:value-of select="$website-name" disable-output-escaping="yes" />
			<xsl:text> — Live</xsl:text>
	    </h3>
	  </div>
	  <div class="modal-body">
	    <div class="ustream-embed"></div>
	    <span class="url hidden">http://www.ustream.tv/embed/4325662/?autoplay=true</span>
	  </div>
	  <div class="modal-footer center">
	    <a href="#" class="link-small" data-dismiss="modal" aria-hidden="true">Close</a>
	  </div>
	</div>

</xsl:template>


<xsl:template name="template-column-right-top"></xsl:template>


<xsl:template name="template-footer-outside-container">

	<script type="text/javascript">
		<xsl:comment>
		(function (window) {
			'use strict';
			function downloadJSAtOnload() {
				var js = {
					"scripts":[
						"/workspace/themes/active/js/common-ck.2.3.2.js"
					]
				};
				var supportsJson = (!!window.JSON &amp;&amp; !!JSON.parse);

		        if(!supportsJson){
		          js.scripts.push("/workspace/js/json2.min.js");
		        }
				for (var key in js.scripts) {
					if (js.scripts[key]) {
						var element=document.createElement("script");
						element.src=js.scripts[key];
						document.body.appendChild(element);
					}
				}
			}
			if(window.addEventListener) {
				window.addEventListener("load",downloadJSAtOnload,false);
			} else if (window.attachEvent) {
				window.attachEvent("onload",downloadJSAtOnload);
			} else {
				window.onload=downloadJSAtOnload;
			}
		}(window));
		//</xsl:comment>
	</script>

</xsl:template>


</xsl:stylesheet>
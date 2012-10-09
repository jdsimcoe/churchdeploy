<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-teachings">

	<xsl:param name="component" select="'teachings'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">

		<xsl:choose>
			<xsl:when test="not(number($pt3)) and not(number($pt4)) and $pt4">
				<div class="title-wrapper">
					<div class="container">
						<div class="row">
							<div class="span12">
								<h2><xsl:value-of select="$pt4" /></h2>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="not(number($pt3)) and number($pt4) and $pt5">
				<div class="title-wrapper">
					<div class="container">
						<div class="row">
							<div class="span12">
								<h2>
									<xsl:text>Series: </xsl:text>
									<xsl:value-of select="$pt5" />
								</h2>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="$pt3 = 'tag'">
				<div class="title-wrapper">
					<div class="container">
						<div class="row">
							<div class="span12">
								<h2>
									<xsl:text>Tag: </xsl:text>
									<xsl:value-of select="//teachings-entry-by-tag-filtered/entry/tags/item[@id=$pt4]/tag/@handle" disable-output-escaping="yes" />
								</h2>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<div class="row">
				<xsl:choose>
	 				<xsl:when test="number($pt3)">
						<div class="span12">
							<xsl:for-each select="$entries">
								<div class="result">
									<xsl:attribute name="class">
										<xsl:if test="number($pt3)">
											<xsl:text>result individual</xsl:text>
										</xsl:if>
									</xsl:attribute>
									<xsl:call-template name="teaching-entry" />
								</div>
							</xsl:for-each>
						</div>
					</xsl:when>
					<xsl:when test="$pt3 = 'book' or $pt3 = 'tag' or $pt3 = 'year' or $pt3 = 'series'">
						<div class="span12 poster">
							<xsl:if test="$pt3 = 'series'">
								<img style="width: 100%; height: 169px">
									<xsl:attribute name="data-responsimage">
										<xsl:choose>
											<xsl:when test="//teachings-entries-by-series-filtered/entry/teachings/item/poster/filename != ''">
												<xsl:value-of select="//teachings-entries-by-series-filtered/entry/teachings/item/poster/filename" disable-output-escaping="yes" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
											</xsl:otherwise>
										</xsl:choose>

									</xsl:attribute>
								</img>
							</xsl:if>
						</div>
						<div class="span8 results">
							<h3>
								<xsl:choose>
									<xsl:when test="$pt3 = 'series'">
										<xsl:text disable-output-escaping="yes">Teachings</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$entries/../pagination/@total-entries" disable-output-escaping="yes" />
										<xsl:text disable-output-escaping="yes"> results</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</h3>
							<xsl:for-each select="$entries">
								<div class="result">
									<xsl:call-template name="teaching-entry" />
								</div>
							</xsl:for-each>
							<xsl:call-template name="teachings-pagination">
								<xsl:with-param name="entries" select="$entries" />
							</xsl:call-template>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="//teachings-featured-filtered/entry">
							<div class="latest">
								<div class="row">
									<div class="span8 offset2">
										<div class="search hidden-phone">
											<form method="get">
												<xsl:call-template name="form-search-action"/>
												<a>
													<xsl:call-template name="url-search-home" />
													<i class="icon-search icon-large"></i>
												</a>
												<input type="hidden" name="sections" value="teachings,teachings-tags,teachings-series" />
												<input class="keywords" name="keywords" onclick="this.select()" placeholder="Search" autocomplete="off" />
											</form>
<!-- 											<p>Type and hit enter. You can search all of our media by any keyword. Try <span onclick="$('.search input.keywords').val('Jesus');">Jesus</span> or <span onclick="$('.search input.keywords').val('resurrection');">resurrection</span>&#160;..</p> -->
										</div>
									</div>
								</div>
								<div class="span8">
									<iframe src="http://player.vimeo.com/video/{video/item/id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" frameborder="0" class="video" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen" style="width: 100%"></iframe>
									<xsl:call-template name="teaching-actions" />
								</div>
								<div class="span4">
									<h2>
										<a>
											<xsl:call-template name="url-teachings" />
											<xsl:value-of select="title" disable-output-escaping="yes" />
										</a>
									</h2>
									<div class="meta">
										<div class="verse">
											<xsl:value-of select="book/item" />
											<xsl:text> </xsl:text>
											<xsl:value-of select="chapter" />
										</div>
										<div class="teacher">
											<em>by </em>
											<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
											<xsl:text disable-output-escaping="yes"> </xsl:text>
											<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
										</div>
										<div class="date">
											<xsl:call-template name="date-teaching">
												<xsl:with-param name="date" select="date/date/start/@iso" />
											</xsl:call-template>
										</div>
									</div>
									<div class="description">
										<xsl:call-template name="truncate">
                        <xsl:with-param name="node" select="description" />
                        <xsl:with-param name="length" select="230" />
                    </xsl:call-template>
									</div>
								</div>
							</div>
						</xsl:for-each>
						<div class="span8">
							<xsl:variable name="items-per-row" select="2" />
							<div class="component-series">
								<h3>Recent Series</h3>
								<xsl:for-each select="//teachings-series-entries-filtered/entry[position() mod $items-per-row = 1 and position() &lt; 5]">
									<div class="row">
										<xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
											<div class="span4 series">
												<a>
													<xsl:call-template name="url-teachings-series" />
													<xsl:call-template name="teaching-poster-or-default">
														<xsl:with-param name="poster" select="poster" />
													</xsl:call-template>
												</a>
												<div class="info">
													<a>
														<xsl:call-template name="url-teachings-series" />
														<h4>
															<xsl:value-of select="title" disable-output-escaping="yes" />
															<span class="meta">
																<xsl:text> (</xsl:text>
																<xsl:value-of select="teachings/@items" />
																<xsl:text>&#160;teachings)</xsl:text>
															</span>
														</h4>
													</a>
												</div>
											</div>
										</xsl:for-each>
									</div>
								</xsl:for-each>
							</div>
							<h3>Recent Teachings</h3>
								<div class="row">
								    <xsl:for-each select="//teachings-4-latest/entry">
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
              	<h3>Podcast</h3>
              	<div class="row podcast">
              		<div class="span8">
										<p>One of the best ways to connect to our Bible teachings is through podcasts. Our Audio Podcast streams all of our latest teachings to your device(s).</p>
										<p class="center">
											<a class="link link-big inline">
												<xsl:attribute name="href">
													<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='podcast-audio']/content)" disable-output-escaping="yes" />
												</xsl:attribute>
												<xsl:text>View in iTunes</xsl:text>
											</a>
										</p>
									</div>
								</div>
								<h3>Radio</h3>
              	<div class="row podcast last">
              		<div class="span8">
										<p>Our “Day-by-Day” radio show with Pastor Brett Meador is syndicated on radio stations in the Portland area as well as Southern Oregon and Vanuatu.</p>
									</div>
								</div>
								<div class="row">
									<div class="span3">
										<h4>Portland</h4>
										<p>
											<em>Monday through Friday</em><br />
											KPDQ <a href="http://www.truetalk800.com" target="_blank">800 AM</a> at 8:30 am<br />
											KPDQ <a href="http://www.kpdq.com" target="_blank">93.9 FM</a> at 10:00 pm<br />
										</p>
									</div>
									<div class="span3">
										<h4>Southern Oregon</h4>
										<p>
											<em>Monday through Friday</em><br />
											KAPL <a href="http://www.kaplradio.org" target="_blank">1300 AM</a> at 1:30 pm<br />
											KAPL <a href="http://www.kaplradio.org" target="_blank">1300 AM</a> at 11:30 pm<br />
										</p>
									</div>
									<div class="span2">
										<h4>Vanuatu</h4>
										<p>
											<em>Everyday</em><br />
											NAMBAWAN 98 FM at 5:00 pm
										</p>
									</div>
								</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="$position = 'column-full-width' and not(number($pt3))">
						<div class="span4">
							<h3>Search</h3>
							<div class="widget filter">
								<h4>Books of the Bible</h4>
								<h5>Old Testament</h5>
								<div class="collection books">
									<xsl:for-each select="//books-of-the-bible/entry[ testament/@handle = 'old-testament' ]">
										<xsl:call-template name="bible-book">
											<xsl:with-param name="book" select="name" />
										</xsl:call-template>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
								<h5>New Testament</h5>
								<div class="collection books">
									<xsl:for-each select="//books-of-the-bible/entry[ testament/@handle = 'new-testament' ]">
										<xsl:call-template name="bible-book">
											<xsl:with-param name="book" select="name" />
										</xsl:call-template>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
							</div>
							<div class="widget filter">
								<h4>Year</h4>
								<div class="collection">
									<xsl:call-template name="years-counter" />
								</div>
							</div>
							<div class="widget filter">
								<h4>Tags</h4>
								<div class="inline-search">
									<form>
										<xsl:attribute name="action">
											<xsl:call-template name="url-search-home">
												<xsl:with-param name="url-only" select="true()" />
											</xsl:call-template>
										</xsl:attribute>
										<label for="keywords"><i class="icon-search"></i>&#160;</label>
										<input type="hidden" name="sections" value="teachings-tags" />
										<input name="keywords" class="keywords" placeholder="Search" autocomplete="off" onclick="this.select()" />
									</form>
								</div>
								<div class="collection">
									<xsl:for-each select="//teachings-tags-random-filtered/entry">
										<a href="{$root}/{//tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/tag/{@id}/">
											<xsl:value-of select="tag" disable-output-escaping="yes" />
										</a>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
							</div>
						</div>
					</xsl:when>
				</xsl:choose>
			</div>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="teaching-entry">

	<xsl:param name="entry" select="." />

	<xsl:for-each select="$entry">
		<xsl:if test="not($pt1) and video/item">
			<div class="row">
				<div class="span12">
					<a>
						<xsl:call-template name="url-teachings" />
							<img style="width: 940px; height: 529px">
								<xsl:attribute name="data-responsimage">
									<xsl:choose>
										<xsl:when test="string-length(poster/@path)">
											<xsl:value-of select="poster/filename" disable-output-escaping="yes" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
					</a>
				</div>
			</div>
			<div class="carousel-caption">
				<a>
					<xsl:call-template name="url-teachings" />
					<h3>Latest Teaching</h3>
					<h4>
						<xsl:value-of select="title" disable-output-escaping="yes" />
						<xsl:text> | </xsl:text>
						<span class="verse">
							<xsl:text> </xsl:text>
							<xsl:value-of select="book/item" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="chapter" />
						</span>
					</h4>
					<div class="description">
						<xsl:call-template name="truncate">
              <xsl:with-param name="node" select="description" />
              <xsl:with-param name="length" select="230" />
            </xsl:call-template>
            <span class="link link-small inline pull-right">View Teaching</span>
					</div>
				</a>
			</div>
		</xsl:if>
		<xsl:if test="number($pt3)">
			<h1>
				<xsl:value-of select="title" disable-output-escaping="yes" />
				<br />
				<span class="verse">
					<xsl:text> </xsl:text>
					<xsl:value-of select="book/item" />
					<xsl:text> </xsl:text>
					<xsl:value-of select="chapter" />
				</span>
			</h1>
			<xsl:if test="video/item">
				<iframe src="http://player.vimeo.com/video/{video/item/id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" frameborder="0" class="video" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen" style="width: 100%; height: 529px;"></iframe>
			</xsl:if>
			<div class="row">
				<div class="span8">
					<div class="meta">
						<p>
							<span class="badge">
								<xsl:value-of select="filename" />
							</span>
							<span class="date">
								<span class="divider">|</span>
								<xsl:call-template name="date-teaching">
									<xsl:with-param name="date" select="date/date/start/@iso" />
								</xsl:call-template>
							</span>
						</p>
					</div>
					<div class="description">
						<xsl:value-of select="description"  disable-output-escaping="yes" />
					</div>
					<xsl:if test="tags/item">
						<xsl:call-template name="teaching-tag-list">
							<xsl:with-param name="tags" select="tags/item" />
						</xsl:call-template>
					</xsl:if>
					<xsl:call-template name="teaching-actions" />
				</div>
				<div class="span4">
					<div class="teacher">
						<em>by </em>
						<strong>
							<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
							<xsl:text disable-output-escaping="yes"> </xsl:text>
							<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
						</strong>
					</div>
					<div class="avatar">
						<xsl:call-template name="speaker-avatar">
							<xsl:with-param name="photo" select="speaker/item/photo" />
							<xsl:with-param name="height" select="120" />
							<xsl:with-param name="width" select="120" />
						</xsl:call-template>
					</div>
					<div class="about">
						<xsl:value-of select="speaker/item/about" disable-output-escaping="yes" />
					</div>
				</div>
			</div>
		</xsl:if>

		<xsl:if test="not(number($pt3))">
			<xsl:choose>
				<xsl:when test="not($pt1)">
				</xsl:when>
				<xsl:otherwise>
					<h4>
						<a>
							<xsl:call-template name="url-teachings" />
							<xsl:value-of select="title" disable-output-escaping="yes" />
							<span class="verse">
								<xsl:value-of select="book/item" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="chapter" />
							</span>
						</a>
					</h4>
					<div class="meta">
						<p>
							<span class="badge">
								<xsl:value-of select="filename" />
							</span>
							<span class="teacher">
								<em>by </em>
								<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
								<xsl:text disable-output-escaping="yes"> </xsl:text>
								<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
							</span>
							<span class="verse">
								<i class="icon-book">u</i>
								<xsl:text> </xsl:text>
								<xsl:value-of select="book/item" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="chapter" />
							</span>
							<span class="divider">|</span>
							<span class="date">
								<xsl:call-template name="date-teaching">
									<xsl:with-param name="date" select="date/date/start/@iso" />
								</xsl:call-template>
							</span>
						</p>
					</div>
					<div class="description">
						<xsl:value-of select="description" disable-output-escaping="yes" />
					</div>
					<xsl:call-template name="teaching-tag-list">
						<xsl:with-param name="tags" select="tags/item" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:for-each>

</xsl:template>


<xsl:template name="teaching-actions">

	<xsl:param name="entry" select="." />

	<xsl:variable name="audio-url">
		<!-- <xsl:text>http://72.10.33.203/media/audio/teachings/</xsl:text> -->
		<xsl:text disable-output-escaping="yes">http://66.147.244.244/~atheycre/teachings/</xsl:text>
		<xsl:value-of select="translate(filename,$en-uppercase-letters,$en-lowercase-letters)"/>
		<xsl:text>.mp3</xsl:text>
	</xsl:variable>

	<div>
		<xsl:call-template name="class-rows" />

		<div class="button-wrapper">
			<a href="{$audio-url}" class="btn downloadPopover pull-right" rel="popover" data-content="Right-click on this link and use the 'Save As' or 'Download File As' dialog to download teachings." data-original-title="Downloads" target="_blank">
	        	<i class="icon-download"></i>
	        	<xsl:text>&#160;&#160;</xsl:text>
	        	<xsl:text>Download</xsl:text>
	        </a>

	        <button class="listen btn pull-right" data-toggle="collapse" data-target="#audio">
				<i class="icon-music"></i>
				<xsl:text>&#160;&#160;</xsl:text>
				<xsl:text>Listen</xsl:text>
			</button>
		</div>

		<div class="wrap collapse" id="audio">
			<xsl:if test="filename">
				<div class="action">
			        <div class="audiojs" classname="audiojs" id="audiojs_wrapper0">
			            <audio src="{$audio-url}" preload="none"></audio>
			            <div class="play-pause">
			                <p class="play">
			                   <i class="icon-play"></i>
			                </p>
			                <p class="pause">
			                   <i class="icon-pause"></i>
			                </p>
			                <p class="loading">
			                    <i class="icon-refresh"></i>
			                </p>
			                <p class="error">
			                    <i class="icon-exclamation-sign">!</i>
			                </p>
			            </div>
			            <div class="scrubber">
			                <div class="progress"></div>
			                <div class="loaded"></div>
			            </div>
			            <div class="time">
			                <em class="played">00:00</em>/<strong class="duration">00:00</strong>
			            </div>
			            <div class="error-message"></div>
			        </div>
			    </div>
			</xsl:if>

		</div>

	</div>

	<xsl:if test="number($pt3)">
		<p class="share">
			<label for="permalink">Paste link in email or IM</label>
			<input type="text" name="permalink" value="http://accf.co/{$pt3}" onclick="this.select()" />
		</p>
	</xsl:if>

</xsl:template>


<xsl:template name="teaching-tag-list">

	<xsl:param name="tags" />

	<div class="tags">
		<i class="icon-tags"></i>
		<xsl:text>&#160;&#160;</xsl:text>
		<xsl:for-each select="tags/item">
			<a>
				<xsl:call-template name="url-teachings-tags" />
				<xsl:value-of select="tag" disable-output-escaping="yes" />
			</a>
			<xsl:if test="position() &lt; last()">,</xsl:if>
			<xsl:text> </xsl:text>
		</xsl:for-each>
	</div>

</xsl:template>


<xsl:template name="date-teaching">

	<xsl:param name="date" />

	<xsl:call-template name="format-date">
		<xsl:with-param name="date" select="$date" />
		<xsl:with-param name="format" select="'%d+;, %m+; %d;%ds;, %y+;'" />
	</xsl:call-template>

</xsl:template>


<xsl:template name="bible-book">

	<xsl:param name="book" />

	<a href="{$root}/{//tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/book/{$book/@handle}/">
		<xsl:value-of select="$book" />
	</a>

</xsl:template>


<xsl:template name="years-counter">

	<xsl:param name="howMany">1997</xsl:param>

	<xsl:if test="$howMany &lt; $this-year + 1">
		<a href="{$root}/{$pt1}/{$pt2}/year/{$howMany}/"><xsl:value-of select="$howMany" /></a>
		<xsl:if test="$howMany &lt; $this-year">, </xsl:if>
		<xsl:call-template name="years-counter">
		<xsl:with-param name="howMany" select="$howMany + 1" />
		</xsl:call-template>
	</xsl:if>

</xsl:template>


<xsl:template name="teaching-poster-or-default">

	<xsl:param name="poster" />

	<img style="width: 100%; height: 169px">
		<xsl:attribute name="data-responsimage">
			<xsl:choose>
				<xsl:when test="string-length(poster/@path)">
					<xsl:value-of select="$poster/filename" disable-output-escaping="yes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</img>

</xsl:template>


<xsl:template name="teachings-pagination">

	<xsl:param name="entries" />

	<xsl:call-template name="cd-pagination">
		<xsl:with-param name="pagination" select="$entries/../pagination" />
		<xsl:with-param name="pagination-url">
			<xsl:value-of select="$root" /><xsl:text>/</xsl:text>
			<xsl:if test="$pt1">
				<xsl:value-of select="$pt1" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt2">
				<xsl:value-of select="$pt2" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt3">
				<xsl:value-of select="$pt3" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt4">
				<xsl:value-of select="$pt4" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt5">
				<xsl:value-of select="'$'" /><xsl:text>/</xsl:text>
			</xsl:if>
		</xsl:with-param>
	</xsl:call-template>

</xsl:template>

<xsl:template name="speaker-avatar">

	<xsl:param name="photo" />
	<xsl:param name="width" />
	<xsl:param name="height" />

	<img width="{$width}" height="{$height}" class="img-circle" data-responsimage-anchor="5">
		<xsl:attribute name="data-responsimage">
			<xsl:choose>
				<xsl:when test="string-length($photo)">
					<xsl:value-of select="$photo" disable-output-escaping="yes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">anonymous-4fef5a675fd64.jpg</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</img>

</xsl:template>


</xsl:stylesheet>
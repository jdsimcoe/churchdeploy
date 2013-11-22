<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../themes/active/xsl/alerts.xsl" />
<xsl:import href="../themes/active/xsl/blog.xsl" />
<xsl:import href="../themes/active/xsl/downloads.xsl" />
<xsl:import href="../themes/active/xsl/events.xsl" />
<xsl:import href="../themes/active/xsl/featured.xsl" />
<xsl:import href="../themes/active/xsl/images.xsl" />
<xsl:import href="../themes/active/xsl/locations.xsl" />
<xsl:import href="../themes/active/xsl/members-roles.xsl" />
<xsl:import href="../themes/active/xsl/spacer.xsl" />
<xsl:import href="../themes/active/xsl/teachings.xsl" />
<xsl:import href="../themes/active/xsl/text.xsl" />
<xsl:import href="../themes/active/xsl/verses.xsl" />
<xsl:import href="../themes/active/xsl/videos.xsl" />


<xsl:template name="component">
	<xsl:param name="xpath" />
	<xsl:if test="count($xpath/item)">
		<xsl:choose>
			<xsl:when test="name($xpath) = 'column-full-width'">
				<div class="column-full-width">
					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath" />
					</xsl:call-template>
				</div>
			</xsl:when>
			<xsl:when test="name($xpath) = 'column-center'">
				<div id="main-content" class="span8 column-center">
					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath" />
					</xsl:call-template>
				</div>
			</xsl:when>
			<xsl:when test="name($xpath) = 'column-right'">
				<div id="side-content" class="span4 column-right">
					<xsl:call-template name="template-column-right-top" />
					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath" />
					</xsl:call-template>
				</div>
			</xsl:when>
		</xsl:choose>
	</xsl:if>
</xsl:template>


<xsl:template name="component-populate">
	<xsl:param name="xpath" />
	<xsl:for-each select="$xpath/item/label/@handle">
		<xsl:if test=". = 'downloads'">
			<xsl:call-template name="component-downloads">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/downloads-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test=". = 'events'">
			<xsl:call-template name="component-events">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/events-entry-by-id-preview/entry" />
				<xsl:with-param name="single" select="true()" />
			</xsl:call-template>
			<xsl:choose>
				<!-- Single ID -->
				<xsl:when test="count(/data/events-entry-by-id/entry)">
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/events-entry-by-id/entry" />
						<xsl:with-param name="single" select="true()" />
					</xsl:call-template>
				</xsl:when>
				<!-- Related entried -->
				<xsl:when test="count(/data/events-entries-by-tag-related/entry) and $pt5 = 'related'">
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/events-entries-by-tag-related/entry" />
					</xsl:call-template>
				</xsl:when>
				<!-- Past entries -->
				<xsl:when test="count(/data/events-all-entries-past-filtered/entry) and $pt5 = 'past'">
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/events-all-entries-past-filtered/entry" />
					</xsl:call-template>
				</xsl:when>
				<!-- Current entries -->
				<xsl:when test="$pt1 = 'events'">
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/events-all-entries-filtered/entry" />
					</xsl:call-template>
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/events-recurring-entry-by-id/entry" />
						<xsl:with-param name="single" select="true()" />
					</xsl:call-template>
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/events-recurring-entry-by-id-preview/entry" />
						<xsl:with-param name="single" select="true()" />
					</xsl:call-template>
				</xsl:when>
				<!-- Tagged entries -->
				<xsl:otherwise>
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/events-entries-by-tag/entry" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test=". = 'events-recurring'">
			<xsl:call-template name="component-events">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/events-recurring-entry-by-id/entry" />
				<xsl:with-param name="single" select="true()" />
			</xsl:call-template>
			<xsl:call-template name="component-events">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/events-recurring-all-entries-filtered/entry [type/item/type/@handle = 'church-wide']" />
			</xsl:call-template>
			<xsl:call-template name="component-events">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/events-recurring-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test=". = 'images'">
			<xsl:call-template name="component-images">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/images-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test=". = 'locations'">
			<xsl:call-template name="component-locations">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/events-entry-by-id/entry/location/item" />
			</xsl:call-template>
			<xsl:call-template name="component-locations">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/locations-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test=". = 'members-roles'">
			<xsl:call-template name="component-members-roles">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/members-roles-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test=". = 'spacer'">
			<xsl:call-template name="component-spacer" />
		</xsl:if>
		<xsl:if test=". = 'teachings'">
			<xsl:choose>
				<xsl:when test="number($pt2)">
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/teachings-entry-by-id/entry" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$pt1 = 'teachings' and $pt2 = 'book'">
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/teachings-entry-by-book-filtered/entry" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$pt1 = 'series'">
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/teachings-series-entries-filtered/entry/teachings/item" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$pt1 = 'teachings' and $pt2 = 'series'">
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/teachings-entries-by-series-filtered/entry/teachings/item" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$pt1 = 'teachings' and $pt2 = 'tag'">
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/teachings-entry-by-tag-filtered/entry" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$pt1 = 'teachings' and $pt2 = 'year'">
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="/data/teachings-entries-by-year-filtered/entry" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$pt1 = 'teachings'">
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="." />
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test=". = 'text'">
			<xsl:call-template name="component-text">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/text-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test=". = 'featured'">
			<xsl:call-template name="component-featured">
				<xsl:with-param name="entries" select="/data/featured-random/entry" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test=". = 'verses'">
			<xsl:call-template name="component-verses">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/verses-entry-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test=". = 'videos'">
			<xsl:call-template name="component-videos">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="/data/videos-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
	</xsl:for-each>
</xsl:template>


<!--

URL helpers  //////////////////////////////////////////////////////////////////////////////

All URL helpers can now be replaced with "url-prefix"

-->


<xsl:template name="url-downloads">
	<xsl:param name="node" select="." />
	<xsl:choose>
		<xsl:when test="$node/link != ''">
			<xsl:attribute name="href">
				<xsl:value-of select="$node/link" />
			</xsl:attribute>
		</xsl:when>
		<xsl:otherwise>
			<xsl:attribute name="href">
				<xsl:value-of select="$workspace" />
				<xsl:value-of select="$node/file/@path" />
				<xsl:text>/</xsl:text>
				<xsl:value-of select="$node/file/filename" />
			</xsl:attribute>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template name="url-events">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:call-template name="url-prefix">
			<xsl:with-param name="handle" select="'events'" />
		</xsl:call-template>

		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>

		<xsl:value-of select="$node/name/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-events-recurring">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		    <xsl:call-template name="url-prefix">
      <xsl:with-param name="handle" select="'events'" />
    </xsl:call-template>
		<xsl:value-of select="$node/name/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>

<xsl:template name="url-events-recurring-home">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
    <xsl:call-template name="url-prefix">
      <xsl:with-param name="handle" select="'meetings'" />
    </xsl:call-template>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-events-home">
	<xsl:attribute name="href">
    <xsl:call-template name="url-prefix">
      <xsl:with-param name="handle" select="'events'" />
    </xsl:call-template>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-events-home-past">
	<xsl:attribute name="href">
    <xsl:call-template name="url-prefix">
      <xsl:with-param name="handle" select="'events'" />
    </xsl:call-template>
		<xsl:text>1/5/past/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-search-home">
	<xsl:param name="url-only" select="false()" />
	<xsl:variable name="url">
    <xsl:value-of select="$root"/>
		<xsl:text>/search/</xsl:text>
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="$url-only">
			<xsl:value-of select="$url" disable-output-escaping="yes" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:attribute name="href">
				<xsl:value-of select="$url" disable-output-escaping="yes" />
			</xsl:attribute>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template name="url-tags">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<!--
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/@id" />-->
		<xsl:text>/</xsl:text>
		<xsl:choose>
			<xsl:when test="string-length($node/slug)">
				<xsl:value-of select="$node/slug/@handle" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$node/tag/@handle" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-tags-by-text">
	<xsl:param name="node" select="." />
	<xsl:param name="tag" />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$tag" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="/data/tags-all-entries/entry[@id = $tag]/tag/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-teachings">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
    <xsl:call-template name="url-prefix">
      <xsl:with-param name="handle" select="'teachings'" />
    </xsl:call-template>
		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/title/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-teachings-series">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
    <xsl:call-template name="url-prefix">
      <xsl:with-param name="handle" select="'teachings'" />
    </xsl:call-template>
		<xsl:text>series/</xsl:text>
		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/title/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-teachings-tags">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
    <xsl:call-template name="url-prefix">
      <xsl:with-param name="handle" select="'teachings'" />
    </xsl:call-template>
		<xsl:text>tag/</xsl:text>
		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/tag/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="edit-entry">
	<xsl:param name="component" />
	<xsl:param name="link">
		<xsl:value-of select="$root" />
		<xsl:text>/symphony/publish/</xsl:text>
		<xsl:value-of select="$component" />
		<xsl:text>/edit/</xsl:text>
		<xsl:value-of select="@id" />
		<xsl:text>/</xsl:text>
	</xsl:param>
	<xsl:param name="class" />
	<xsl:if test="$cookie-username">
		<a href="{$link}" target="_blank">
			<xsl:attribute name="class">
				<xsl:text>edit </xsl:text>
				<xsl:if test="$class">
					<xsl:value-of select="$class" />
				</xsl:if>
			</xsl:attribute>
			<span class="icon">p</span>
		</a>
	</xsl:if>
</xsl:template>


<xsl:template name="form-search-action">
	<xsl:attribute name="action">
   <xsl:value-of select="$root" />
	 <xsl:text>/search/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-prefix">
	<xsl:param name="handle" />
	<xsl:value-of select="$root" />
	<!--
	<xsl:text>/</xsl:text>
	<xsl:value-of select="/data/tags-all-entries/entry[tag/@handle = $handle]/@id" />
	-->
	<xsl:text>/</xsl:text>
	<xsl:value-of select="$handle" />
	<xsl:text>/</xsl:text>
</xsl:template>


</xsl:stylesheet>

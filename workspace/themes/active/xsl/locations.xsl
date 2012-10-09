<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-locations">

	<xsl:param name="component" select="'locations'" />
	<xsl:param name="entries" />
	<xsl:param name="position" />

	<xsl:if test="count($entries)">
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<h3 class="header">
				<xsl:call-template name="pluralize">
					<xsl:with-param name="singular" select="'Location'"  />
					<xsl:with-param name="plural"   select="'Locations'" />
					<xsl:with-param name="xpath"    select="$entries"    />
				</xsl:call-template>
			</h3>
			<xsl:for-each select="$entries">
				<xsl:variable name="address">
					<xsl:call-template name="url-encode">
						<xsl:with-param name="str" select="concat(address, ' ', city, ' ', state, ' ', zip)" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="latlon">
					<xsl:value-of select="latitude" />
					<xsl:text>,</xsl:text>
					<xsl:value-of select="longitude" />
				</xsl:variable>
				<div class="wrapper">
					<xsl:call-template name="class-rows" />
					<xsl:if test="string-length(longitude) and string-length(latitude) or string-length(address)">
						<div class="map">
							<img>
								<xsl:attribute name="src">
									<xsl:text>http://maps.googleapis.com/maps/api/staticmap?center=</xsl:text>
									<xsl:choose>
										<xsl:when test="string-length(longitude) and string-length(latitude)">
										 	<xsl:value-of select="$latlon" />
										 	<xsl:text>&amp;zoom=14&amp;size=300x300&amp;markers=</xsl:text>
										 	<xsl:value-of select="$latlon" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$address" />
										 	<xsl:text>&amp;zoom=14&amp;size=300x300&amp;markers=</xsl:text>
										 	<xsl:value-of select="$address" />
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text>&amp;maptype=roadmap&amp;sensor=false&amp;scale=2</xsl:text>
								</xsl:attribute>
							</img>
							<div class="screen"></div>
							<address>
								<h4>
									<xsl:call-template name="location-name" />
								</h4>
								<xsl:value-of select="address" />
								<br />
								<xsl:value-of select="city" />
								<xsl:text>, </xsl:text>
								<xsl:value-of select="state" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="zip" />
							</address>
							<xsl:call-template name="edit-entry">
								<xsl:with-param name="component" select="$component"/>
							</xsl:call-template>
						</div>
						<a href="http://maps.google.com/maps?q={$address}" class="more" target="_blank">
							<xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
							<i class="icon-list-ul icon-large"></i>
							<xsl:text>&#160;&#160;</xsl:text>
							<xsl:text> View on Google Maps</xsl:text>
						</a>
					</xsl:if>
				</div>
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="location-name">

	<xsl:param name="node" select="."/>

	<xsl:choose>
		<xsl:when test="string-length(name-casual)">
			<xsl:value-of select="name-casual" disable-output-escaping="yes" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="name-formal" disable-output-escaping="yes" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


</xsl:stylesheet>
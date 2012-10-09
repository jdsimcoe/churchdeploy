<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-members-roles">

	<xsl:param name="component" select="'members-roles'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<xsl:if test="$position = 'column-full-width' and $pt2 = 'staff' or $position = 'column-right'">
				<h3 class="header">Our Staff</h3>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="$position = 'column-full-width'">
					<xsl:variable name="items-per-row" select="3" />
					<xsl:for-each select="$entries[position() mod $items-per-row = 1]">
						<div class="row">
				            <xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
				            	<xsl:variable name="name">
									<xsl:value-of select="member/item/first-name" disable-output-escaping="yes" />
									<xsl:text> </xsl:text>
									<xsl:value-of select="member/item/last-name" disable-output-escaping="yes" />
								</xsl:variable>
								<xsl:variable name="email">
									<xsl:call-template name="members-roles-email-anonymize" />
								</xsl:variable>
								<xsl:variable name="phone">
									<xsl:call-template name="members-roles-phone-number-anonymize" />
								</xsl:variable>
								<div>
									<xsl:choose>
										<xsl:when test="count($entries) = 1">
											<xsl:call-template name="class-rows">
												<xsl:with-param name="class" select="'span4 offset4'" />
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="count($entries) = 2">
											<xsl:call-template name="class-rows">
												<xsl:with-param name="class" select="'span6'" />
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="class-rows">
												<xsl:with-param name="class" select="'span4'" />
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>


									<xsl:call-template name="members-roles-avatar">
										<xsl:with-param name="filename" select="member/item/photo/filename" />
										<xsl:with-param name="height" select="180" />
										<xsl:with-param name="width" select="180" />
									</xsl:call-template>

									<h4>
										<xsl:value-of select="role/item/role" disable-output-escaping="yes" />
									</h4>
									<h3>
										<xsl:value-of select="$name" disable-output-escaping="yes" />
										<xsl:call-template name="edit-entry">
											<xsl:with-param name="component" select="$component"/>
										</xsl:call-template>
									</h3>
									<div class="content">
										<div class="contact-info">

											<span class="phone">
												<xsl:value-of select="$phone" />
											</span>

											<span class="email">

												<a title="Email {$name}">
													<xsl:attribute name="href">
														<xsl:text disable-output-escaping="yes">mailto:</xsl:text>
														<xsl:value-of select="$email" />
													</xsl:attribute>
													<xsl:value-of select="$email" />
												</a>
											</span>

										</div>
										<xsl:value-of select="member/item/about" disable-output-escaping="yes" />
									</div>
								</div>
							</xsl:for-each>
						</div>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<ul class="contacts nav nav-tabs nav-stacked">
						<xsl:for-each select="$entries">
							<xsl:variable name="name">
								<xsl:value-of select="member/item/first-name" disable-output-escaping="yes" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="member/item/last-name" disable-output-escaping="yes" />
							</xsl:variable>
							<xsl:variable name="email">
								<xsl:call-template name="members-roles-email-anonymize" />
							</xsl:variable>
							<xsl:variable name="phone">
								<xsl:call-template name="members-roles-phone-number-anonymize" />
							</xsl:variable>
							<li>
								<xsl:call-template name="class-rows" />
								<a title="Email {$name}" class="mailto">
									<xsl:attribute name="href">
										<xsl:text disable-output-escaping="yes">mailto:</xsl:text>
										<xsl:value-of select="$email" />
									</xsl:attribute>
									<div class="pull-left">
										<xsl:call-template name="members-roles-avatar">
											<xsl:with-param name="filename" select="member/item/photo/filename" />
											<xsl:with-param name="height" select="72" />
											<xsl:with-param name="width" select="72" />
										</xsl:call-template>
									</div>
									<div class="info">
										<h4>
											<xsl:value-of select="$name" disable-output-escaping="yes" />
										</h4>
										<div>
											<span class="email"><xsl:value-of select="$email" /></span><br />
											<span class="phone"><xsl:value-of select="$phone" /></span>
										</div>
									</div>
								</a>
								<xsl:call-template name="edit-entry">
									<xsl:with-param name="component" select="$component"/>
								</xsl:call-template>
							</li>
						</xsl:for-each>
						<a href="/103/staff/" class="more">
							<xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
							<i class="icon-list-ul icon-large"></i>
							<xsl:text>&#160;&#160;</xsl:text>
							<xsl:text>Meet our staff</xsl:text>
						</a>
					</ul>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="members-roles-avatar">

	<xsl:param name="filename" />
	<xsl:param name="width" />
	<xsl:param name="height" />

	<img width="{$width}" height="{$height}" class="img-circle" data-responsimage-anchor="5">
		<xsl:attribute name="data-responsimage">
			<xsl:choose>
				<xsl:when test="string-length($filename)">
					<xsl:value-of select="$filename" disable-output-escaping="yes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">anonymous-4fef5a675fd64.jpg</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</img>

</xsl:template>


<xsl:template name="members-roles-email-anonymize">

	<xsl:choose>
		<xsl:when test="member/item/anonymize = 'Yes' or not(string-length(member/item/email))">
			<xsl:text>&#140;</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="member/item/email" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


<xsl:template name="members-roles-phone-number-anonymize">

	<xsl:choose>
		<xsl:when test="member/item/anonymize = 'Yes' or not(string-length(member/item/phone-number))">
			<xsl:value-of select="//misc-all-entries/entry[name='default-phone-number']/content" disable-output-escaping="yes" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="member/item/phone-number" />
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


</xsl:stylesheet>
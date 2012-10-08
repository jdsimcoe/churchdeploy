<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="alerts">

	<xsl:if test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
        <div class="alert alertLive hidden">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <div class="container">
                <p>
                    Athey Creek is currently broadcasting live. <a class="modalLiveLink" href="#">Watch Live &#8594;</a><a class="mobileLink" href="http://www.ustream.tv/embed/4325662/?autoplay=true">Watch Live &#8594;</a>
                </p>
            </div>
        </div>
	</xsl:if>

     <xsl:if test="//alerts-global">

        <xsl:for-each select="//alerts-global/entry">
            <div>
                <xsl:attribute name="id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="type = 'warning'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-error</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>hidden</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="type = 'success'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-success</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>hidden</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="type = 'info'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-info</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>hidden</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>hidden</xsl:text>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:if test="can-be-closed = 'Yes'">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                </xsl:if>

                <div class="container">

                    <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
                    <xsl:if test="url">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="url" />
                            </xsl:attribute>
                            <xsl:attribute name="target">
                                <xsl:text>_blank</xsl:text>
                            </xsl:attribute>
                            <xsl:text>More Info &#8594;</xsl:text>
                        </a>
                    </xsl:if>

                </div>

            </div>
        </xsl:for-each>


    </xsl:if>

    <xsl:if test="//alerts-entries-by-tag">

        <xsl:for-each select="//alerts-entries-by-tag/entry">
            <div>
                <xsl:attribute name="id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="type = 'warning'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-error</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>hidden</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="type = 'success'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-success</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>hidden</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="type = 'info'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-info</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>hidden</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>hidden</xsl:text>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:if test="can-be-closed = 'Yes'">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                </xsl:if>

                <div class="container">

                    <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
                    <xsl:if test="url">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="url" />
                            </xsl:attribute>
                            <xsl:attribute name="target">
                                <xsl:text>_blank</xsl:text>
                            </xsl:attribute>
                            <xsl:text>More Info &#8594;</xsl:text>
                        </a>
                    </xsl:if>

                </div>

            </div>
        </xsl:for-each>


    </xsl:if>


</xsl:template>


</xsl:stylesheet>
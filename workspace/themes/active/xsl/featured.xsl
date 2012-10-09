<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-featured">

  <xsl:param name="component" select="'featured'" />
  <xsl:param name="entries" />

  <xsl:if test="count($entries)">

    <xsl:for-each select="$entries">
      <div class="item">
        <div class="row">
          <div class="span12">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="url" />
              </xsl:attribute>

              <img style="width:940px; height: 529px;" class="inline" data-responsimage-anchor="5">
                <xsl:attribute name="data-responsimage">
                  <xsl:value-of select="image" />
                </xsl:attribute>
              </img>
            </a>
          </div>
        </div>
      </div>
    </xsl:for-each>

  </xsl:if>

</xsl:template>


</xsl:stylesheet>
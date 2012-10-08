<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-featured">

  <xsl:param name="component" select="'featured'" />
  <xsl:param name="entries" />

  <xsl:if test="count($entries)">
    <div class="row featured">

      <xsl:for-each select="$entries">
          <div class="span4">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="url" />
              </xsl:attribute>

              <img style="width: 100%; height: 169px;" class="inline" data-responsimage-anchor="5">
                <xsl:attribute name="data-responsimage">
                  <xsl:value-of select="image" />
                </xsl:attribute>
              </img>
            </a>
          </div>
      </xsl:for-each>

    </div>
  </xsl:if>

</xsl:template>


</xsl:stylesheet>
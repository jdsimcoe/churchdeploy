<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="twitter">

  <div class="twitter">
  	<div class="center">
      <i class="icon-twitter icon-medium"></i>
    </div>
    <h3>On Twitter</h3>
    <xsl:for-each select="/data/twitter-search/statuses/item[position() &lt; 2]">
      <p class="lead">
      	<em>
	        <xsl:value-of select="text" disable-output-escaping="yes" />
	        <xsl:text>&#160;&#160;</xsl:text>
        </em>
      </p>
      <h4>
        <strong>
          <xsl:value-of select="substring(created-at,9,2)"/>
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="substring(created-at,5,4)"/>
          <xsl:value-of select="substring-after(created-at,'+0000 ')" />
        </strong>
      </h4>
    </xsl:for-each>


    <hr/>

    <div class="row">
  		<div class="col-lg-3">
  			<a href="http://twitter.com/atheycreek/" target="_blank" class="btn btn-block btn-large">View all Tweets</a>
  		</div>
  	</div>


  </div>

</xsl:template>


<xsl:template name="footer">

	<footer class="footer">
    <div class="container">
      <div class="row">
				<div class="location">
					<h4>Our Location</h4>
					<address>
						27520 SW 95th Ave.<br />
						Wilsonville, Oregon 97070<br />
						<abbr title="Phone">P:</abbr> (971) 327-2120
					</address>
				</div>
				<div class="hours">
					<h4>Office Hours</h4>
					<p>
						9:00 AM to 5:00 PM — Tue., Thr., Fri.<br />
						9:00 AM to 12:00 PM — Wed.<br />
						Closed Monday
					</p>
				</div>
      </div>
    </div>
  </footer>

</xsl:template>


<xsl:template name="baseline">

	<div class="baseline">
    <p>
      <xsl:text>© 1996—</xsl:text>
      <xsl:value-of select="$this-year" />
      <xsl:text>. </xsl:text>
      <a href="{$root}"><xsl:value-of select="$website-name" /></a>
      <xsl:text>. All&#160;rights&#160;reserved. Some photos courtesy of </xsl:text>
      <a href="http://fiftyfootshadows.net" target="_blank">John Carey</a>
      <xsl:text>.</xsl:text>
    </p>
  </div>

</xsl:template>


</xsl:stylesheet>
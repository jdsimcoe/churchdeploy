<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
    <style type="text/css" media="screen">
        body {
            background: #9fc9d4;
        }
        .logo {
            height: 300px;
            width: 300px;
            margin: 100px auto;
        }
        h1 {
            font-family: "proxima-nova", sans-serif;
            color: #fff;
            font-size: 36px;
            font-weight: 300;
            line-height: 1.4;
            text-align: center;
            text-transform: uppercase;
            width: 70%
            text-shadow: 0 1px 2px rgba(0,0,0,0.25);
        }
        h1 span {
            font-weight: bold;
        }
    </style>
    <div class="logo">
        <img src="http://atheycreek.com/workspace/uploads/images/leaderboards/logo-big-4fbe1f82408e2.png" height="300px" width="300px" />
    </div>
	<h1><span><xsl:value-of select="$page-title" /></span> is currently under contruction. Check back soon.</h1>
</xsl:template>

</xsl:stylesheet>
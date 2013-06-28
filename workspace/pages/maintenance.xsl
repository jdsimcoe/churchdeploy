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
            background: #bfdae0;
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
						padding: 0 20px;
            text-align: center;
            text-transform: uppercase;
            text-shadow: 0 1px 2px #94bcc6;
        }
        h1 span {
            font-weight: bold;
        }
    </style>
    <div class="logo">
        <img src="http://atheycreek.com/workspace/themes/active/img/apple-touch-icon.png" height="300px" width="300px" />
    </div>
	<h1><span>AtheyCreek.com</span> is currently under contruction.<br/>Please check back soon.</h1>
</xsl:template>

</xsl:stylesheet>
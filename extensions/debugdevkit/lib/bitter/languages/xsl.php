<?php
/*----------------------------------------------------------------------------*/
	
	require_once BITTER_LANGUAGE_PATH . '/xml.php';
	
/*------------------------------------------------------------------------------
	Main
------------------------------------------------------------------------------*/
	
	Bitter::rule(
		Bitter::id('xsl-xpath'),
		Bitter::tag('xpath'),
		Bitter::capture('\{.*?\}|\$[a-z][a-z0-9_\-]*')
	);
	
	Bitter::rule(
		Bitter::id('xml-attribute-value-single'),
		Bitter::tag('value'),
		Bitter::capture("'.*?'$"),
		
		Bitter::id('xml-entity'),
		Bitter::id('xsl-xpath')
	);
	
	Bitter::rule(
		Bitter::id('xml-attribute-value-double'),
		Bitter::tag('value'),
		Bitter::capture('".*?"$'),
		
		Bitter::id('xml-entity'),
		Bitter::id('xsl-xpath')
	);
	
	Bitter::rule(
		Bitter::id('xsl-include'),
		Bitter::tag('context-markup xml xsl'),
		Bitter::capture('.+', 's'),
		
		Bitter::id('xml-text'),
		Bitter::id('xml-entity'),
		Bitter::id('xml-doctype'),
		Bitter::id('xml-comment'),
		Bitter::id('xml-cdata'),
		Bitter::id('xml-declaration'),
		Bitter::id('xml-tag-close'),
		Bitter::id('xml-tag-open')
	);
	
	Bitter::rule(
		Bitter::id('xsl'),
		
		Bitter::id('xsl-include')
	);
	
/*----------------------------------------------------------------------------*/
?>
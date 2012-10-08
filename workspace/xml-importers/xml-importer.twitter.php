<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterTwitter extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'Twitter',
				'author'		=> array(
					'name'			=> 'Kirk Strobeck',
					'website'		=> 'http://72.10.33.203',
					'email'			=> 'kirk@strobeck.com'
				),
				'description'	=> '',
				'file'			=> __FILE__,
				'created'		=> '2012-05-16T07:11:59+00:00',
				'updated'		=> '2012-05-16T17:53:39+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'yes',
				'fields'			=> array (
  0 => 
  array (
    'field' => '194',
    'xpath' => 'pubDate/text()',
    'php' => 'date_format(date_create($value), \'c\')',
  ),
  1 => 
  array (
    'field' => '195',
    'xpath' => 'guid/text()',
    'php' => 'substr( $value, strpos($value, \'statuses/\') + 9 )',
  ),
  2 => 
  array (
    'field' => '196',
    'xpath' => 'author/text()',
    'php' => 'substr( $value, 0, strpos($value, \'@\') )',
  ),
  3 => 
  array (
    'field' => '197',
    'xpath' => 'author/text()',
    'php' => 'substr( $value, strpos($value, \'(\') + 1, -1 )',
  ),
  4 => 
  array (
    'field' => '198',
    'xpath' => 'description/text()',
    'php' => '',
  ),
),
				'included-elements'	=> '//item',
				'namespaces'		=> array (
  0 => 
  array (
    'name' => 'google',
    'uri' => 'http://base.google.com/ns/1.0',
  ),
  1 => 
  array (
    'name' => 'openSearch',
    'uri' => 'http://a9.com/-/spec/opensearch/1.1/',
  ),
  2 => 
  array (
    'name' => 'media',
    'uri' => 'http://search.yahoo.com/mrss/',
  ),
  3 => 
  array (
    'name' => 'twitter',
    'uri' => 'http://api.twitter.com/',
  ),
),
				'source'			=> 'http://search.twitter.com/search.rss?q=from%3Aatheycreek',
				'section'			=> '24',
				'unique-field'		=> '195'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

?>

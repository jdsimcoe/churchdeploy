<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterVimeo extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'Vimeo',
				'author'		=> array(
					'name'			=> 'Kirk Strobeck',
					'website'		=> 'http://72.10.33.203',
					'email'			=> 'kirk@strobeck.com'
				),
				'description'	=> '',
				'file'			=> __FILE__,
				'created'		=> '2012-05-14T02:11:13+00:00',
				'updated'		=> '2012-05-16T01:35:44+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'yes',
				'fields'			=> array (
  0 => 
  array (
    'field' => '183',
    'xpath' => 'title/text()',
    'php' => '',
  ),
  1 => 
  array (
    'field' => '184',
    'xpath' => 'description/text()',
    'php' => '',
  ),
  2 => 
  array (
    'field' => '185',
    'xpath' => 'pubDate/text()',
    'php' => 'date_format(date_create($value), \'c\')',
  ),
  3 => 
  array (
    'field' => '186',
    'xpath' => 'link/text()',
    'php' => '',
  ),
  4 => 
  array (
    'field' => '187',
    'xpath' => 'media:content/media:player/@url',
    'php' => '',
  ),
  5 => 
  array (
    'field' => '188',
    'xpath' => 'media:content/media:thumbnail/@url',
    'php' => '',
  ),
  6 => 
  array (
    'field' => '190',
    'xpath' => 'link/text()',
    'php' => 'array_pop(explode(\'/\', $value))',
  ),
),
				'included-elements'	=> '//item',
				'namespaces'		=> array (
  0 => 
  array (
    'name' => 'atom',
    'uri' => 'http://www.w3.org/2005/Atom',
  ),
  1 => 
  array (
    'name' => 'dc',
    'uri' => 'http://purl.org/dc/elements/1.1/',
  ),
  2 => 
  array (
    'name' => 'media',
    'uri' => 'http://search.yahoo.com/mrss/',
  ),
),
				'source'			=> 'http://vimeo.com/atheycreek/videos/rss',
				'section'			=> '22',
				'unique-field'		=> '190'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

?>

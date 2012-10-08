<?php

	require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

	class XMLImporterUstream extends XMLImporter {
		public function about() {
			return array(
				'name'			=> 'UStream',
				'author'		=> array(
					'name'			=> 'Kirk Strobeck',
					'website'		=> 'http://72.10.33.203',
					'email'			=> 'kirk@strobeck.com'
				),
				'description'	=> 'Ustream',
				'file'			=> __FILE__,
				'created'		=> '2011-12-29T02:19:14+00:00',
				'updated'		=> '2012-05-16T21:28:31+00:00'
			);
		}

		public function options() {
			return array(
				'can-update'		=> 'yes',
				'fields'			=> array (
  0 => 
  array (
    'field' => '199',
    'xpath' => '.',
    'php' => '"ustream-status"',
  ),
  1 => 
  array (
    'field' => '200',
    'xpath' => 'status/node()',
    'php' => 'str_replace(array(\'<![CDATA[\',\']]>\'), \'\', $value)',
  ),
),
				'included-elements'	=> '/xml/results',
				'namespaces'		=> NULL,
				'source'			=> 'http://api.ustream.tv/xml/channel/atheycreek/getInfo/?key=4E23272206B10532FEC6335E3D79977E',
				'section'			=> '25',
				'unique-field'		=> '199'
			);
		}

		public function allowEditorToParse() {
			return true;
		}
	}

?>

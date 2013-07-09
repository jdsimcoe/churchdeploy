<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcexml_apibibliacom extends DynamicXMLDatasource {

		public $dsParamROOTELEMENT = 'xml-apibibliacom';
		public $dsParamURL = 'http://api.biblia.com/v1/bible/content/kjv.xml?key=75a4b16582635a69f1194f670abfa9f0&passage={$ds-verses-entry-by-tag.passage}{$ds-verses-entry-by-id.passage}';
		public $dsParamXPATH = '/response/text';
		public $dsParamCACHE = '999999';
		public $dsParamTIMEOUT = '6';
		

		

		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-verses-entry-by-tag.passage', '$ds-verses-entry-by-id.passage');
		}

		public function about() {
			return array(
				'name' => 'XML: api.biblia.com',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-08T23:53:35+00:00'
			);
		}

		public function getSource() {
			return 'dynamic_xml';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}

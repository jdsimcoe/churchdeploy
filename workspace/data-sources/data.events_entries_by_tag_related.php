<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_entries_by_tag_related extends Datasource{

		public $dsParamROOTELEMENT = 'events-entries-by-tag-related';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '{$pt4:5}';
		public $dsParamSTARTPAGE = '{$pt3:1}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt6';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'35' => 'later than {$today}, {$today}',
				'137' => '{$pt6}',
				'169' => '(if all of ((if value of ({$pt2}) is (events)), (if value of ({$pt5}) is (related))) is (yes))',
				'213' => 'no',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'name: raw',
				'date',
				'description',
				'tags: tag'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: Entries by tag (related)',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://atheycreek',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-10-16T21:39:27+00:00'
			);
		}

		public function getSource(){
			return '6';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
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

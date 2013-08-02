<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_entries_past_by_tag_related extends SectionDatasource {

		public $dsParamROOTELEMENT = 'events-entries-past-by-tag-related';
		public $dsParamConditionalizer = '(if all of ((if value of ({$pt1}) is (events)), (if value of ({$pt4}) is (related)), (if value of ({$pt6}) is (past))) is (yes))';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '{$pt3:5}';
		public $dsParamSTARTPAGE = '{$pt2:1}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt6';
		public $dsParamSORT = 'date';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'35' => 'earlier than {$today}',
				'137' => '{$pt5}',
				'213' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'date'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Events: Entries (past) by tag (related)',
				'author' => array(
					'name' => 'Brian Zerangue',
					'website' => 'http://churchdeploy.site',
					'email' => 'brian.zerangue@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-28T05:57:15+00:00'
			);
		}

		public function getSource() {
			return '6';
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

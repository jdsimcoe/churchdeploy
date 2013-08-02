<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcemembers_roles_entries_by_tag_api extends SectionDatasource {

		public $dsParamROOTELEMENT = 'members-roles-entries-by-tag-api';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt1:43';
		public $dsParamSORT = 'order';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamCACHE = '0';
		

		public $dsParamFILTERS = array(
				'152' => '{$ds-tags-filtered.system-id:43}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'member: first-name',
				'member: last-name',
				'member: photo'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-tags-filtered.system-id');
		}

		public function about() {
			return array(
				'name' => 'Members/Roles: Entries by tag (api)',
				'author' => array(
					'name' => 'Brian Zerangue',
					'website' => 'http://churchdeploy.site',
					'email' => 'brian.zerangue@gmail.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-24T10:45:01+00:00'
			);
		}

		public function getSource() {
			return '18';
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

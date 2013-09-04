<?php

	require_once(TOOLKIT . '/class.devkit.php');

	class Content_ProfileDevKit extends DevKit {
		protected $_view = '';
		protected $_records = array();
		protected $_dbstats = array();

		public function __construct(){
			parent::__construct();

			$this->_title = __('Profile');
			$this->_query_string = parent::__buildQueryString(array('symphony-page', 'profile'));

			if (!empty($this->_query_string)) {
				$this->_query_string = '&amp;' . General::sanitize($this->_query_string);
			}
		}

		public function build() {
			$this->_view = (strlen(trim($_GET['profile'])) == 0 ? 'general' : $_GET['profile']);

			// Build statistics
			$this->_dbstats = Symphony::Database()->getStatistics();
			$this->_records = array(
				'general'			=> Symphony::Profiler()->retrieveGroup('General'),
				'data-sources'		=> Symphony::Profiler()->retrieveGroup('Datasource'),
				'events'			=> Symphony::Profiler()->retrieveGroup('Event'),
				'delegates'			=> Symphony::Profiler()->retrieveGroup('Delegate'),
				'slow-queries'		=> array()
			);

			if (is_array($this->_dbstats['slow-queries']) && !empty($this->_dbstats['slow-queries'])) {
				foreach ($this->_dbstats['slow-queries'] as $q) {
					$this->_records['slow-queries'][] = array($q['time'], $q['query'], null, null, false);
				}
			}

			return parent::build();
		}

		protected function buildJump(XMLElement $wrapper) {
			$list = new XMLElement('ul');

			if (is_array($this->_records['general']) && !empty($this->_records['general'])) {
				$list->appendChild($this->buildJumpItem(
					__('General Details'),
					'?profile=general' . $this->_query_string,
					($this->_view == 'general')
				));
			}

			if (is_array($this->_records['data-sources']) && !empty($this->_records['data-sources'])) {
				$list->appendChild($this->buildJumpItem(
					__('Datasource Execution'),
					'?profile=data-sources' . $this->_query_string,
					($this->_view == 'data-sources')
				));
			}

			if (is_array($this->_records['events']) && !empty($this->_records['events'])) {
				$list->appendChild($this->buildJumpItem(
					__('Event Execution'),
					'?profile=events' . $this->_query_string,
					($this->_view == 'events')
				));
			}

			if (is_array($this->_records['delegates']) && !empty($this->_records['delegates'])) {
				$list->appendChild($this->buildJumpItem(
					__('Delegate Execution'),
					'?profile=delegates' . $this->_query_string,
					($this->_view == 'delegates')
				));
			}

			$list->appendChild($this->buildJumpItem(
				__('Full Page Render Statistics'),
				'?profile=render-statistics' . $this->_query_string,
				($this->_view == 'render-statistics')
			));

			$list->appendChild($this->buildJumpItem(
				__('Memory Usage'),
				'?profile=memory-usage' . $this->_query_string,
				($this->_view == 'memory-usage')
			));

			if(is_object(Symphony::Database())){
				$list->appendChild($this->buildJumpItem(
					__('Database Queries'),
					'?profile=database-queries' . $this->_query_string,
					($this->_view == 'database-queries')
				));
			}

			if (is_array($this->_records['slow-queries']) && !empty($this->_records['slow-queries'])) {
				$list->appendChild($this->buildJumpItem(
					__('Slow Query Details'),
					'?profile=slow-queries' . $this->_query_string,
					($this->_view == 'slow-queries')
				));
			}

			$wrapper->appendChild($list);
		}

		public function buildContent(XMLElement $wrapper) {
			$this->addStylesheetToHead(URL . '/extensions/profiledevkit/assets/devkit.css', 'screen', 9126343);
			$this->addStylesheetToHead(URL . '/workspace/assets/css/devkit_css_override.css', 'screen', 11);

			$table = new XMLElement('table');
			$table->setAttribute('id', $this->_view);

			if ($this->_view == 'render-statistics') {
				$xml_generation = Symphony::Profiler()->retrieveByMessage('XML Generation');
				$xsl_transformation = Symphony::Profiler()->retrieveByMessage('XSLT Transformation');

				$event_total = 0;
				foreach ($this->_records['events'] as $data) $event_total += $data[1];

				$ds_total = 0;
				foreach ($this->_records['data-sources'] as $data) $ds_total += $data[1];

				$this->_records = array(
					array(__('Total Database Queries'), $this->_dbstats['queries'], NULL, NULL, false),
					array(__('Slow Queries (> 0.09s)'), (string)count($this->_dbstats['slow-queries']), NULL, NULL, false),
					array(__('Total Time Spent on Queries'), $this->_dbstats['total-query-time']),
					array(__('Time Triggering All Events'), $event_total),
					array(__('Time Running All Data Sources'), $ds_total),
					array(__('XML Generation'), $xml_generation[1]),
					array(__('XSLT Transformation'), $xsl_transformation[1]),
					array(__('Output Creation Time'), Symphony::Profiler()->retrieveTotalRunningTime()),
					array(__('Total Memory Usage'), General::formatFilesize(Symphony::Profiler()->retrieveTotalMemoryUsage()), NULL, NULL, false),
				);

				foreach ($this->_records as $data) {

					if(!isset($data[4]) || $data[4] !== false){
						$data[1] = number_format($data[1], 4) . ' s';
					}

					$row = new XMLElement('tr');
					$row->appendChild(new XMLElement('th', $data[0]));
					$row->appendChild(new XMLElement('td', $data[1]));
					$table->appendChild($row);
				}
			}

			else if($this->_view == 'memory-usage'){
				$items = Symphony::Profiler()->retrieve();

				$base = $items[0][5];
				$total = 0;
				$last = 0;

				foreach($items as $index => $item){
					// Build row display name
					if(in_array($item[3], array('Datasource','Event'))) {
						$display_value = $item[3] . ': ' . $item[0];
					}
					else if($item[3] == 'Delegate') {
						$display_value = str_replace('|', ': ', $item[0]);
					}
					else {
						$display_value = $item[0];
					}

					$row = new XMLElement('tr');
					$row->appendChild(new XMLElement('th', $display_value));
					$row->appendChild(new XMLElement('td', General::formatFilesize(max(0, (($item[5]-$base) - $last)))));
					$table->appendChild($row);

					$last = $item[5]-$base;
				}
			}

			else if($this->_view == 'database-queries'){
				$debug = Symphony::Database()->debug();

				if(count($debug) > 0){
					$i = 1;
					foreach($debug as $query){
						$row = new XMLElement('tr');
						$row->appendChild(new XMLElement('th', $i));
						$row->appendChild(new XMLElement('td', number_format($query['time'], 4)));
						$row->appendChild(new XMLElement('td', $query['query']));
						$table->appendChild($row);
						$i++;
					}
				}
			}

			else if ($this->_view == 'delegates') {
				$delegates = array();
				$debug = Symphony::Database()->debug();

				// Build an array of delegate => extensions
				foreach ($this->_records['delegates'] as $data) {
					$parts = explode('|', $data[0]);
					$data[0] = $parts[1];
					$delegates[$parts[0]][] = $data;
				}

				foreach($delegates as $delegate => $extensions) {
					$tt = $tq = 0;
					$te = array();
					$row = new XMLElement('tr');
					$row->appendChild(new XMLElement('th', $delegate));
					$table->appendChild($row);

					foreach($extensions as $extension) {
						$execution_time = number_format($extension[1], 4);
						$extension_row = new XMLElement('tr');

						// Poor man's grouping.
						$extension_row->appendChild(new XMLElement('td', '&nbsp;'));
						$extension_row->appendChild(new XMLElement('th', $extension[0]));
						$extension_row->appendChild(new XMLElement('td', $execution_time . ' s from ' . $extension[4] . ' ' . ($extension[4] == 1 ? 'query' : 'queries')));

						$table->appendChild($extension_row);
						$tt += $execution_time;
						$tq += (is_array($extension[4])) ? count($extension[4]) : $extension[4];
						if(!in_array($extension[0], $te)) $te[] = $extension[0];
					}

					$row->appendChild(new XMLElement('td', number_format($tt, 4) . ' s from ' . count($te) . ' extensions and ' . $tq . ' ' . ($tq == 1 ? 'query' : 'queries')));
				}
			}

			else if ($this->_records = $this->_records[$this->_view]) {
				$ds_total = 0;

				foreach ($this->_records as $data) {
					$row = new XMLElement('tr');
					$row->appendChild(new XMLElement('th', $data[0]));

					if ($this->_view == 'general') {
						$row->appendChild(new XMLElement('td', number_format($data[1], 4) . ' s'));

					}
					elseif ($this->_view == 'slow-queries') {

						if(!isset($data[4]) || $data[4] !== false){
							$data[1] = number_format($data[1], 4) . ' s';
						}

						$row->appendChild(new XMLElement('td', $data[1]));

					}
					else {
						$row->appendChild(new XMLElement('td', number_format($data[1], 4) . ' s from ' . $data[4] . ' ' . ($data[4] == 1 ? 'query' : 'queries')));
					}

					$ds_total += $data[1];
					$table->appendChild($row);
				}
			}

			$wrapper->appendChild($table);
		}
	}

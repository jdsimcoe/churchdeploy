<?php

	require_once(TOOLKIT . '/class.devkit.php');
	
	class Content_ProfileDevKit extends DevKit {
		protected $_view = '';
		protected $_xsl = '';
		protected $_profiler = null;
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
			$this->_xsl = @file_get_contents($this->_pagedata['filelocation']);
			
			// Build statistics:
			$this->_profiler = Frontend::instance()->Profiler;
			$this->_dbstats = Symphony::Database()->getStatistics();
			$this->_records = array(
				'general'			=> $this->_profiler->retrieveGroup('General'),
				'data-sources'		=> $this->_profiler->retrieveGroup('Datasource'),
				'events'			=> $this->_profiler->retrieveGroup('Event'),
				'slow-queries'		=> array()
			);
			
			if (is_array($this->_dbstats['slow-queries']) && !empty($this->_dbstats['slow-queries'])) {
				foreach ($this->_dbstats['slow-queries'] as $q) {
					$this->_records['slow-queries'][] = array($q['time'], $q['query'], null, null, false);
				}
			}
			
			return parent::build();
		}
		
		protected function buildJump($wrapper) {
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
		
		public function buildContent($wrapper) {
			$this->addStylesheetToHead(URL . '/extensions/profiledevkit/assets/devkit.css', 'screen', 9126343);
			
			$table = new XMLElement('table');
			$table->setAttribute('id', $this->_view);
			
			if ($this->_view == 'render-statistics') {
				$xml_generation = $this->_profiler->retrieveByMessage('XML Generation');
				$xsl_transformation = $this->_profiler->retrieveByMessage('XSLT Transformation');
				
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
					array(__('XML Generation Function'), $xml_generation[1]),
					array(__('XSLT Generation'), $xsl_transformation[1]),
					array(__('Output Creation Time'), $this->_profiler->retrieveTotalRunningTime()),
					array(__('Total Memory Usage'), General::formatFilesize($this->_profiler->retrieveTotalMemoryUsage()), NULL, NULL, false),
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
			
			elseif($this->_view == 'memory-usage'){
				$items = $this->_profiler->retrieve();
			
				$base = $items[0][5];
				$total = 0;
				$last = 0;
			
				foreach($items as $index => $item){

					$row = new XMLElement('tr');
					$row->appendChild(new XMLElement('th', ((in_array($item[3], array('Datasource','Event'))) ? $item[3] . ': ' : '') . $item[0]));
					$row->appendChild(new XMLElement('td', General::formatFilesize(max(0, (($item[5]-$base) - $last)))));
					$table->appendChild($row);
					
					$last = $item[5]-$base;
				}
			}
			
			elseif($this->_view == 'database-queries'){
				
				$debug = Symphony::Database()->debug();

				if(count($debug['query']) > 0){
					$i = 1;
					foreach($debug['query'] as $query){
						$row = new XMLElement('tr');
						$row->appendChild(new XMLElement('th', $i));
						$row->appendChild(new XMLElement('td', number_format($query['time'], 4)));
						$row->appendChild(new XMLElement('td', $query['query']));
						$table->appendChild($row);
						$i++;
					}
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
	
?>
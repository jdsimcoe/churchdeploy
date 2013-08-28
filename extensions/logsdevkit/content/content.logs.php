<?php

	require_once(TOOLKIT . '/class.devkit.php');

	class Content_LogsDevKit extends DevKit {
		protected $_view = '';
		protected $_xsl = '';
		protected $_path = '';
		protected $_files = array();

		public function __construct(){
			parent::__construct();

			$this->_title = __('Logs');
			$this->_query_string = parent::__buildQueryString(array('logs'));

			if (!empty($this->_query_string)) {
				$this->_query_string = '&amp;' . General::sanitize($this->_query_string);
			}
		}

		public function build() {
			$this->_view = (strlen(trim($_GET['logs'])) == 0 ? 'main' : $_GET['logs']);
			$this->_xsl = @file_get_contents($this->_pagedata['filelocation']);
			$this->_path = MANIFEST . '/logs/';

			// Find log files:
			if (is_readable($this->_path) and is_dir($this->_path)) {
				$files = scandir($this->_path);

				foreach ($files as $file) if ($file == 'main' || preg_match('/^main.[0-9]{10}.gz$/', $file)) {
					$this->_files[$file] = filemtime($this->_path . $file);
				}

				asort($this->_files);
				$this->_files = array_reverse($this->_files, true);
			}

			return parent::build();
		}

		protected function buildJump($wrapper) {
			$list = new XMLElement('ul');

			foreach ($this->_files as $file => $timestamp) {
				if ($file == 'main') {
					$list->appendChild($this->buildJumpItem(
						__('Current Log'),
						'?logs=main' . $this->_query_string,
						($this->_view == 'main')
					));

				} else {
					$list->appendChild($this->buildJumpItem(
						DateTimeObj::get(__SYM_DATETIME_FORMAT__, $timestamp),
						"?logs={$file}" . $this->_query_string,
						($this->_view == $file)
					));
				}
			}

			$wrapper->appendChild($list);
		}

		protected function buildContent($wrapper) {
			$this->addStylesheetToHead(URL . '/extensions/logsdevkit/assets/devkit.logs.css', 'screen');
			$this->addStylesheetToHead(URL . '/workspace/assets/css/devkit-override.css', 'screen');

			if (array_key_exists($this->_view, $this->_files)) {
				$table = new XMLElement('table');

				foreach ($this->__parseLog($this->_path . $this->_view) as $item) {
					// Flag notices:
					$item->message = preg_replace(
						'%^NOTICE: .*%',
						'<span class="notice">\\0</span>',
						$item->message
					);

					// Hilight files:
					$item->message = preg_replace(
						'%((/\S+)( on )(line [0-9]+))%',
						'<span class="file">\\2</span>\\3<span class="line">\\4</span>',
						$item->message
					);

					$row = new XMLElement('tr');

					$cell = new XMLElement('th');
					$cell->setValue($item->timestamp);
					$row->appendChild($cell);

					$cell = new XMLElement('td');
					$cell->setValue($item->message);
					$row->appendChild($cell);

					$table->appendChild($row);
				}

				$wrapper->appendChild($table);
			}
		}

		protected function __parseLog($file) {
			$items = array(); $last = null;

			if (is_readable($file)) {
				header('content-type: text/plain');

				if (preg_match('/.gz$/', $file)) {
					$handle = gzopen($file, "r");
					$data = gzread($handle, Symphony::Configuration()->get('maxsize', 'log'));
					gzclose($handle);
				}
				else {
					$data = file_get_contents($file);
				}

				$lines = explode(PHP_EOL, $data);

				// Skip log info:
				while (count($lines)) {
					$line = trim(array_shift($lines));

					if ($line == '--------------------------------------------') break;
				}

				// Create items:
				foreach ($lines as $line) {
					preg_match('/^(.*?) > (.*)/', trim($line), $matches);

					// New entry:
					if (count($matches) == 3) {
						$message = htmlentities($matches[2]);

						$items[] = (object)array(
							'timestamp'	=> DateTimeObj::get(__SYM_DATETIME_FORMAT__, strtotime($matches[1])),
							'message'	=> $message
						);
					}
				}

				// Reverse order:
				$items = array_reverse($items);
			}

			return $items;
		}
	}

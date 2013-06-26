<?php

	if (!defined('BITTER_LANGUAGE_PATH')) {
		define('BITTER_LANGUAGE_PATH', EXTENSIONS . '/debugdevkit/lib/bitter/languages');
	}

	if (!defined('BITTER_FORMAT_PATH')) {
		define('BITTER_FORMAT_PATH', EXTENSIONS . '/debugdevkit/lib/bitter/formats');
	}

	if (!defined('BITTER_CACHE_PATH')) {
		define('BITTER_CACHE_PATH', CACHE);
	}

	require_once(TOOLKIT . '/class.devkit.php');
	require_once(EXTENSIONS . '/debugdevkit/lib/bitter/bitter.php');

	// Create cache folder:
	if (!is_dir(BITTER_CACHE_PATH) && General::realiseDirectory(BITTER_CACHE_PATH) === false){
		throw new Exception(__('Failed to create cache folder. Please check "%s" is writable.', array(BITTER_CACHE_PATH)));
	}

	elseif(!is_writable(BITTER_CACHE_PATH)){
		throw new Exception(__('Cache folder is not writable. Please check permissions on "%s".', array(BITTER_CACHE_PATH)));
	}

	class Content_DebugDevKit_Debug extends DevKit {
		protected $_view = '';
		protected $_full_utility_list = '';

		public function __construct(){
			parent::__construct();

			$this->_title = __('Debug');
			$this->_query_string = parent::__buildQueryString(array('symphony-page', 'debug'));

			if (!empty($this->_query_string)) {
				$this->_query_string = '&amp;' . General::sanitize($this->_query_string);
			}
		}

		public function build() {
			$this->_view = (strlen(trim($_GET['debug'])) == 0 ? 'xml' : $_GET['debug']);

			return parent::build();
		}

		protected function buildJump(XMLElement $wrapper) {
			$list = new XMLElement('ul');

			$list->appendChild($this->buildJumpItem(
				__('Params'),
				'?debug=params' . $this->_query_string,
				($this->_view == 'params')
			));

			$list->appendChild($this->buildJumpItem(
				__('XML'),
				'?debug=xml' . $this->_query_string,
				($this->_view == 'xml')
			));

			$filename = $this->__relativePath($this->_pagedata['filelocation']);

			$item = $this->buildJumpItem(
				basename($filename),
				"?debug={$filename}" . $this->_query_string,
				($this->_view == $filename)
			);

			$utilities = $this->__buildUtilityList($this->__findUtilitiesInFile($this->_pagedata['filelocation']), 1, $this->_view);

			if (is_object($utilities)) {
				$item->appendChild($utilities);
			}

			$list->appendChild($item);

			$list->appendChild($this->buildJumpItem(
				__('Result'),
				'?debug=result' . $this->_query_string,
				($this->_view == 'result')
			));

			$wrapper->appendChild($list);
		}

		public function buildContent(XMLElement $wrapper) {
			$this->addStylesheetToHead(URL . '/extensions/debugdevkit/assets/devkit.css', 'screen', 10);
			$this->addScriptToHead(SYMPHONY_URL . '/assets/js/jquery.js', 20);
			$this->addScriptToHead(URL . '/extensions/debugdevkit/assets/jquery.scrollto.js', 30);
			$this->addScriptToHead(URL . '/extensions/debugdevkit/assets/devkit.js', 40);

			if ($this->_view == 'params') {
				$wrapper->appendChild($this->__buildParams($this->_param));

			} else if ($this->_view == 'xml') {
				$this->appendSource($wrapper, $this->_xml, 'xml');

			} else if ($this->_view == 'result') {
				$this->appendSource($wrapper, $this->_output, 'xml');

			} else if ($this->_view == 'raw') {
				header('Content-Type: application/xml');
				echo $this->_xml;
				die();

			} else {
				if ($_GET['debug'] == $this->__relativePath($this->_pagedata['filelocation'])) {
					$this->appendSource($wrapper, @file_get_contents($this->_pagedata['filelocation']), 'xsl');

				}
				else if (is_array($this->_full_utility_list) && !empty($this->_full_utility_list)) {
					foreach ($this->_full_utility_list as $u) {
						if ($_GET['debug'] != $this->__relativePath($u)) continue;

						$this->appendSource($wrapper, @file_get_contents($u), 'xsl');
						break;
					}
				}
			}
		}

		protected function appendSource(XMLElement $wrapper, $source, $language = 'xml') {
			$bitter = new Bitter();
			$bitter->loadFormat('symphony');
			$bitter->loadLanguage($language);

			$inner = new XMLElement(
				'div', $bitter->process($source)
			);
			$inner->setAttribute('id', 'source');
			$wrapper->appendChild($inner);

			if($this->_view == 'xml') {
				$viewRaw = Widget::Anchor('','?debug=raw');
				$viewRaw->setAttribute('id', 'type');
				$viewRaw->appendChild(new XMLElement('span',__('Plain XML')));
				$wrapper->appendChild($viewRaw);
			}
		}

		protected function __buildParams($params) {
			if (!is_array($params) || empty($params)) return;
			$params = General::array_map_recursive(array('General', 'sanitize'), $params);

			$wrapper = new XMLElement('div');
			$wrapper->setAttribute('id', 'params');
			$table = new XMLElement('table');

			foreach ($params as $key => $value) {
				$value = is_array($value) ? implode(', ', $value) : $value;

				$row = new XMLElement('tr');
				$row->appendChild(new XMLElement('th', "\${$key}"));
				$row->appendChild(new XMLElement('td', "'{$value}'"));
				$table->appendChild($row);
			}

			$wrapper->appendChild($table);

			return $wrapper;
		}

		protected function __buildUtilityList($utilities, $level=1, $view = null) {
			if (!is_array($utilities) || empty($utilities)) return;

			$list = new XMLElement('ul');

			foreach ($utilities as $u) {
				$filename = $this->__relativePath($u);
				$item = $this->buildJumpItem(
					basename($filename),
					"?debug={$filename}" . $this->_query_string,
					($view == "{$filename}"),
					"?debug-edit={$u}" . $this->_query_string
				);

				$child_utilities = $this->__findUtilitiesInFile($u);

				if (is_array($child_utilities) && !empty($child_utilities)) {
					$item->appendChild($this->__buildUtilityList($child_utilities, $level + 1, $view));
				}

				$list->appendChild($item);
			}

			return $list;
		}

		protected function __findUtilitiesInFile($filename) {
			if(file_exists($filename) && is_readable($filename)) {
				$xsl = file_get_contents($filename);
			}

			if ($xsl == '') return;

			$utilities = array();

			try {
				$xsl = @new SimpleXMLElement($xsl);
			}
			catch(Exception $e) { // simply abort recursion in this branch if XSL file contains invalid XML
				return $utilities;
			}

			$matches = $xsl->xpath("*[local-name()='import' or local-name()='include']");

			foreach($matches AS $match) {
				$attributes = $match->attributes();
				if($attributes["href"] != basename($filename) && file_exists(realpath(dirname($filename) . "/" . $attributes["href"])))
					$utilities[] = realpath(dirname($filename) . "/" . $attributes["href"]);
			}

			if (!is_array($this->_full_utility_list)) {
				$this->_full_utility_list = array();
			}

			if (is_array($utilities) && !empty($utilities)) {
				$this->_full_utility_list = array_merge($utilities, $this->_full_utility_list);
			}

			return $utilities;
		}

		private function __relativePath($filename) {
			// remove path to DOCROOT from absolute path. the realpath mess is necessary to cope with Windows paths (realpath always returns C:\Programs\... instead of /Programs/...)
			return str_replace('\\','/',str_replace(realpath(DOCROOT),'',realpath($filename)));
		}
	}


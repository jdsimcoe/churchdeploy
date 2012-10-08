<?php
	
	Class extension_cachelite extends Extension
	{
		protected $_cacheLite = null;
		protected $_lifetime = null;
		protected $_url = null;
		protected $_get = null;
		private $_sections = array();
		private $_entries = array();
		
		function __construct($args) {
			require_once('lib/class.cachelite.php');
			$this->_lifetime = $this->_get_lifetime();
			$this->_cacheLite = new Cache_Lite(array(
				'cacheDir' => CACHE . '/',
				'lifeTime' => $this->_lifetime
			));
			$this->_get = $_GET;
			ksort($this->_get);
			$this->_url = serialize($this->_get);
		}
		
		/*-------------------------------------------------------------------------
		Extension definition
		-------------------------------------------------------------------------*/
		public function about()
		{
			return array('name' => 'CacheLite',
						 'version' => '1.1.3',
						 'release-date' => '2011-04-05',
						 'author' => array('name' => 'Max Wheeler',
											 'website' => 'http://makenosound.com/',
											 'email' => 'max@makenosound.com'),
 						 'description' => 'Allows for simple frontend caching using the CacheLite library.'
				 		);
		}
		
		public function uninstall()
		{
			# Remove preferences
			Symphony::Configuration()->remove('cachelite');
			Administration::instance()->saveConfig();
			
			# Remove file
			if(file_exists(MANIFEST . '/cachelite-excluded-pages')) unlink(MANIFEST . '/cachelite-excluded-pages');
			
			# Remove extension table
			Symphony::Database()->query("DROP TABLE `tbl_cachelite_references`");
		}
		
		public function install() {
			# Create extension table
			Symphony::Database()->query("
				CREATE TABLE `tbl_cachelite_references` (
				  `page` varchar(255) NOT NULL default '',
				  `sections` varchar(255) default NULL,
				  `entries` varchar(255) default NULL,
				  PRIMARY KEY  (`page`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8
			");
			
			if(!file_exists(MANIFEST . '/cachelite-excluded-pages')) touch(MANIFEST . '/cachelite-excluded-pages');
			
			# Base configuration
			Symphony::Configuration()->set('lifetime', '86400', 'cachelite');
			Symphony::Configuration()->set('show-comments', 'no', 'cachelite');
			Symphony::Configuration()->set('backend-delegates', 'no', 'cachelite');
			Administration::instance()->saveConfig();
			return true;
		}

		public function getSubscribedDelegates() {
			return array(
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'FrontendPageResolved',
					'callback'	=> 'intercept_page'
				),
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'FrontendOutputPreGenerate',
					'callback'	=> 'parse_page_data'
				),
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'FrontendOutputPostGenerate',
					'callback'	=> 'write_page_cache'
				),
				array(
					'page' => '/system/preferences/',
					'delegate' => 'AddCustomPreferenceFieldsets',
					'callback' => 'append_preferences'
				),
				array(
					'page' => '/system/preferences/',
					'delegate' => 'Save',
					'callback' => 'save_preferences'
				),
				array(
					'page'		=> '/publish/new/',
					'delegate'	=> 'EntryPostCreate',
					'callback'	=> 'entry_create'
				),				
				array(
					'page'		=> '/publish/edit/',
					'delegate'	=> 'EntryPreEdit',
					'callback'	=> 'entry_edit'
				),
				array(
					'page'		=> '/publish/',
					'delegate'	=> 'Delete',
					'callback'	=> 'entry_delete'
				),
				array(
					'page' => '/blueprints/events/new/',
					'delegate' => 'AppendEventFilter',
					'callback' => 'addFilterToEventEditor'
				),						
				array(
					'page' => '/blueprints/events/edit/',
					'delegate' => 'AppendEventFilter',
					'callback' => 'addFilterToEventEditor'
				),
				array(
					'page' => '/blueprints/events/new/',
					'delegate' => 'AppendEventFilterDocumentation',
					'callback' => 'add_filter_documentation_to_event'
				),					
				array(
					'page' => '/blueprints/events/edit/',
					'delegate' => 'AppendEventFilterDocumentation',
					'callback' => 'add_filter_documentation_to_event'
				),
				array(
					'page' => '/frontend/',
					'delegate' => 'EventPreSaveFilter',
					'callback' => 'processEventData'
				),
				array(
					'page' => '/frontend/',
					'delegate' => 'EventPostSaveFilter',
					'callback' => 'processPostSaveData'
				),
			);
		}

		/*-------------------------------------------------------------------------
			Preferences
		-------------------------------------------------------------------------*/

		public function append_preferences($context) {
			
			# Add new fieldset
			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');
			$group->appendChild(new XMLElement('legend', 'CacheLite'));

			# Add Site Reference field
			$label = Widget::Label(__('Cache Period'));
			$label->appendChild(Widget::Input('settings[cachelite][lifetime]', General::Sanitize($this->_get_lifetime())));
			$group->appendChild($label);
			$group->appendChild(new XMLElement('p', __('Length of cache period in seconds.'), array('class' => 'help')));
			
			$label = Widget::Label(__('Excluded URLs'));
			$label->appendChild(Widget::Textarea('cachelite[excluded-pages]', 10, 50, $this->_get_excluded_pages()));
			$group->appendChild($label);
			$group->appendChild(new XMLElement('p', __('Add a line for each URL you want to be excluded from the cache. Add a <code>*</code> to the end of the URL for wildcard matches.'), array('class' => 'help')));
			
			$label = Widget::Label();
			$label->setAttribute('for', 'cachelite-show-comments');
			$hidden = Widget::Input('settings[cachelite][show-comments]', 'no', 'hidden');
			$input = Widget::Input('settings[cachelite][show-comments]', 'yes', 'checkbox');
			$input->setAttribute('id', 'cachelite-show-comments');
			if(Symphony::Configuration()->get('show-comments', 'cachelite') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue(__('%s Show comments in page source?', array($hidden->generate() . $input->generate())));
			$group->appendChild($label);
			
			$label = Widget::Label();
			$label->setAttribute('for', 'cachelite-backend-delegates');
			$hidden = Widget::Input('settings[cachelite][backend-delegates]', 'no', 'hidden');
			$input = Widget::Input('settings[cachelite][backend-delegates]', 'yes', 'checkbox');
			$input->setAttribute('id', 'cachelite-backend-delegates');
			if(Symphony::Configuration()->get('backend-delegates', 'cachelite') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue( __('%s Expire cache when entries are created/updated through the backend?', array($hidden->generate() . $input->generate())));
			$group->appendChild($label);
			$context['wrapper']->appendChild($group);
		}
		
		public function save_preferences($context) {
			$this->_save_excluded_pages(stripslashes($_POST['cachelite']['excluded-pages']));
		}
		
		/*-------------------------------------------------------------------------
			Events
		-------------------------------------------------------------------------*/
		
		public function addFilterToEventEditor($context) {
			// adds filters to Filters select box on Event editor page
			$context['options'][] = array('cachelite-entry', @in_array('cachelite-entry', $context['selected']) , 'CacheLite: ' . __('Expire cache for pages showing this entry'));
			$context['options'][] = array('cachelite-section', @in_array('cachelite-section', $context['selected']) , 'CacheLite: ' . __('Expire cache for pages showing content from this section'));
			$context['options'][] = array('cachelite-url', @in_array('cachelite-url', $context['selected']) , 'CacheLite: ' . __('Expire cache for the passed URL'));
		}
		
		public function processEventData($context) {
			// flush the cache based on entry IDs
			if(in_array('cachelite-entry', $context['event']->eParamFILTERS) && isset($_POST['cachelite']['flush-entry'])) {
				if (is_array($_POST['id'])) {
					foreach($_POST['id'] as $id) {
						$this->clear_pages_by_reference($id, 'entry');
					}
				} elseif (isset($_POST['id'])) {
					$this->clear_pages_by_reference($_POST['id'], 'entry');
				}
			}
			
			// flush cache based on the Section ID of the section this Event accesses
			if(in_array('cachelite-section', $context['event']->eParamFILTERS) && isset($_POST['cachelite']['flush-section'])) {
				$this->clear_pages_by_reference($context['event']->getSource(), 'section');
			}
		}
		
		public function processPostSaveData($context) {
			# flush the cache based on explicit value
			if(in_array('cachelite-url', $context['event']->eParamFILTERS)) {
				$flush = (empty($_POST['cachelite']['flush-url'])) ? $this->_url : General::sanitize($_POST['cachelite']['flush-url']);
				$this->_cacheLite->remove($flush, 'default', true);
			}
		}
		
		public function add_filter_documentation_to_event($context)
		{
			if (in_array('cachelite-entry', $context['selected']) || in_array('cachelite-section', $context['selected'])) $context['documentation'][] = new XMLElement('h3', __('CacheLite: Expiring the cache'));
			if (in_array('cachelite-entry', $context['selected']))
			{
				$context['documentation'][] = new XMLElement('h4', __('Expire cache for pages showing this entry'));
				$context['documentation'][] = new XMLElement('p', __('When editing existing entries (one or many, supports the <em>Allow Multiple</em> option) any pages showing this entry will be flushed. Add the following in your form to trigger this filter:'));
				$code = '<input type="hidden" name="cachelite[flush-entry]" value="yes"/>';
				$context['documentation'][] = contentBlueprintsEvents::processDocumentationCode($code);
			}
			if (in_array('cachelite-section', $context['selected']))
			{
				$context['documentation'][] = new XMLElement('h4', __('Expire cache for pages showing content from this section'));
				$context['documentation'][] = new XMLElement('p', __('This will flush the cache of pages using any entries from this event&#8217;s section. Since you may want to only run it when creating new entries, this will only run if you pass a specific field in your HTML:'));
				$code = '<input type="hidden" name="cachelite[flush-section]" value="yes"/>';
				$context['documentation'][] = contentBlueprintsEvents::processDocumentationCode($code);
			}
			if (in_array('cachelite-url', $context['selected']))
			{
				$context['documentation'][] = new XMLElement('h4', __('Expire cache for the passed URL'));
				$context['documentation'][] = new XMLElement('p', __('This will expire the cache of the URL at the value you pass it. For example'));
				$code = '<input type="hidden" name="cachelite[flush-url]" value="/article/123/"/>';
				$context['documentation'][] = contentBlueprintsEvents::processDocumentationCode($code);
				$context['documentation'][] = new XMLElement('p', __('Will flush the cache for <code>http://domain.tld/article/123/</code>. If no value is passed it will flush the cache of the current page (i.e., the value of <code>action=""</code> in you form):'));
				$code = '<input type="hidden" name="cachelite[flush-url]"/>';
				$context['documentation'][] = contentBlueprintsEvents::processDocumentationCode($code);
			}
			return;
		}
		
		/*-------------------------------------------------------------------------
			Caching
		-------------------------------------------------------------------------*/
		
		public function intercept_page($context) {
			if($this->_in_excluded_pages() OR ! empty($_POST)) return;
			$logged_in = isset(Frontend::instance()->Author);
			
			if ($logged_in && array_key_exists('flush', $this->_get) && $this->_get['flush'] == 'site')
			{
				$this->_cacheLite->clean();
			}
			else if ($logged_in && array_key_exists('flush', $this->_get))
			{
				unset($this->_get['flush']);
				$url = serialize($this->_get);
				$this->_cacheLite->remove($url, 'default', true);
			}
			else if (!$logged_in && $output = $this->_cacheLite->get($this->_url))
			{
				# Add comment
				if ($this->_get_comment_pref() == 'yes') $output .= "<!-- Cache served: ". $this->_cacheLite->_fileName	." -->";
				
				if(!isset($context['page_data']['type']) || !is_array($context['page_data']['type']) || empty($context['page_data']['type'])) {
					header('Content-Type: text/html; charset=utf-8');
				} else if(@in_array('XML', $context['page_data']['type']) || @in_array('xml', $context['page_data']['type'])) {
					header('Content-Type: text/xml; charset=utf-8');
				} else { 
					foreach($context['page_data']['type'] as $type) {
						$content_type = Symphony::Configuration()->get(strtolower($type), 'content-type-mappings');
					
						if(!is_null($content_type)){	
							header("Content-Type: $content_type;");
						}
					
						if($type{0} == '.') {  
							$FileName = $page_data['handle'];
  						header("Content-Disposition: attachment; filename={$FileName}{$type}");
						}
					}
				}
				
				if(@in_array('404', $context['page_data']['type'])) {
					header('HTTP/1.0 404 Not Found');
				} else if(@in_array('403', $context['page_data']['type'])) {
					header('HTTP/1.0 403 Forbidden');
				}
				
				# Add some cache specific headers
				$modified = $this->_cacheLite->lastModified();
				$modified_gmt = gmdate('r', $modified);
				
				$etag = md5($modified . $this->_url);
				header(sprintf('ETag: "%s"', $etag));
				
				# Set proper cache headers
				if(isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) || isset($_SERVER['HTTP_IF_NONE_MATCH'])){
					if($_SERVER['HTTP_IF_MODIFIED_SINCE'] == $modified_gmt || str_replace('"', NULL, stripslashes($_SERVER['HTTP_IF_NONE_MATCH'])) == $etag){
						header('HTTP/1.1 304 Not Modified');
						exit();
					}
				}
				
				header('Last-Modified: ' . $modified_gmt);
				header('Cache-Control: public');
				header("Expires: " . gmdate("D, d M Y H:i:s", $modified + $this->_lifetime) . " GMT");
				header(sprintf('Content-Length: %d', strlen($output)));
				print $output;
				exit();
			}
		}
		
		public function write_page_cache(&$output) {
			if($this->_in_excluded_pages()) return;
			$logged_in = isset(Frontend::instance()->Author);
			
			if( ! $logged_in)
			{
				$render = $output['output'];
				
				// rebuild entry/section reference list for this page
				$this->_delete_page_references($this->_url);
				$this->_save_page_references($this->_url, $this->_sections, $this->_entries);
				
				if (!$this->_cacheLite->get($this->_url)) {
					$this->_cacheLite->save($render);
				}
				
				# Add comment
				if ($this->_get_comment_pref() == 'yes') $render .= "<!-- Cache generated: ". $this->_cacheLite->_fileName	." -->";
				
				header("Expires: " . gmdate("D, d M Y H:i:s", $this->_lifetime) . " GMT");
				header("Cache-Control: max-age=" . $this->_lifetime . ", must-revalidate");
				header("Last-Modified: " . gmdate('D, d M Y H:i:s', time()) . ' GMT');
				header(sprintf('Content-Length: %d', strlen($render)));
				
				print $render;
				exit();
			}
		}
		
		# Parse any Event or Section elements from the page XML
		public function parse_page_data($context) {
			$xml = DomDocument::loadXML($context['xml']);
			$xpath = new DOMXPath($xml);
			
			$sections_xpath = $xpath->query('//section[@id and @handle]');
			$sections = array();
			foreach($sections_xpath as $section) {
				$sections[] = $section->getAttribute('id');
			}
			
			$entries_xpath = $xpath->query('//entry[@id]');
			$entries = array();
			foreach($entries_xpath as $entry) {
				$entries[] = $entry->getAttribute('id');
			}
			
			$this->_sections = array_unique($sections);
			$this->_entries = array_unique($entries);
			
		}
		
		public function entry_create($context) {
			if (Symphony::Configuration()->get('backend-delegates', 'cachelite') == 'no') return;
			// flush by Section ID
			if (isset($context['section'])) {
				$this->clear_pages_by_reference($context['section']->get('id'), 'section');
			}
		}
		
		public function entry_edit($context) {
			if (Symphony::Configuration()->get('backend-delegates', 'cachelite') == 'no') return;
			// flush by Entry ID
			if (isset($context['entry'])) {
				$this->clear_pages_by_reference($context['entry']->get('id'), 'entry');
			}
		}
		
		public function entry_delete($context) {
			if (Symphony::Configuration()->get('backend-delegates', 'cachelite') == 'no') return;
			// flush by Entry ID
			$this->clear_pages_by_reference($context['entry_id'], 'entry');
		}
		
		public function clear_pages_by_reference($id, $type) {
			// get a list of pages matching this entry/section ID
			$pages = $this->_get_pages_by_content($id, $type);
			// flush the cache for each
			foreach($pages as $page) {
				$url = $page['page'];
				$this->_cacheLite->remove($url, 'default', true);
				$this->_delete_page_references($url);
			}

		}
		
		/*-------------------------------------------------------------------------
			Helpers
		-------------------------------------------------------------------------*/

		private function _get_lifetime() {
			$default_lifetime = 86400;
			$val = Symphony::Configuration()->get('lifetime', 'cachelite');
			return (isset($val)) ? $val : $default_lifetime;
		}
		
		private function _get_comment_pref() {
			return Symphony::Configuration()->get('show-comments', 'cachelite');
		}
		
		private function _get_excluded_pages() {
			return @file_get_contents(MANIFEST . '/cachelite-excluded-pages');
		}
		
		private function _save_excluded_pages($string){
			return @file_put_contents(MANIFEST . '/cachelite-excluded-pages', $string);
		}
		
		private function _in_excluded_pages() {
			$segments = explode('/', $this->_get['symphony-page']);
			$domain = explode('/', DOMAIN);
			foreach($segments as $key => $segment) {
				if(in_array($segment, $domain) || empty($segment)) unset($segments[$key]);
			}
			$path = "/" . implode("/", $segments);
			
			$rules = file(MANIFEST . '/cachelite-excluded-pages', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
			$rules = array_map('trim', $rules);
			if(count($rules) > 0) {
				foreach($rules as $r) {
					$r = str_replace('http://', NULL, $r);
					$r = str_replace(DOMAIN . '/', NULL, $r);
					$r = "/" . trim($r, "/"); # Make sure we're matching `/url/blah` not `url/blah					
					if($r == '*') {
						return true;
					}
					elseif(substr($r, -1) == '*' && strncasecmp($path, $r, strlen($r) - 1) == 0) {
						return true;
					}
					elseif(strcasecmp($r, $path) == 0) {
						return true;
					}
				}
			}
			return false;
		}
		
		/*-------------------------------------------------------------------------
			Database Helpers
		-------------------------------------------------------------------------*/
		
		private function _get_pages_by_content($id, $type) {
			return Symphony::Database()->fetch(
				sprintf(
					"SELECT page FROM tbl_cachelite_references WHERE %s LIKE '%%|%s|%%'",
					(($type=='entry') ? 'entries' : 'sections'),
					$id
				)
			);
		}
		
		private function _delete_page_references($url) {
			Symphony::Database()->query(
				sprintf(
					"DELETE FROM tbl_cachelite_references WHERE page='%s'",
					$url
				)
			);
		}
		
		protected function _save_page_references($url, $sections, $entries) {
			Symphony::Database()->query(
				sprintf(
					"INSERT INTO tbl_cachelite_references (page, sections, entries) VALUES ('%s','%s','%s')",
					$url,
					'|' . implode('|', $sections) . '|',
					'|' . implode('|', $entries) . '|'
				)
			);
		}
	}
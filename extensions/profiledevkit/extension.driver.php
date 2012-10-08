<?php
	
	class Extension_ProfileDevKit extends Extension {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/
		
		public static $active = false;
		
		public function about() {
			return array(
				'name'			=> 'Profile Devkit',
				'version'		=> '1.0.4',
				'release-date'	=> '2010-03-19',
				'author'		=> array(
					'name'			=> 'Rowan Lewis',
					'website'		=> 'http://rowanlewis.com/',
					'email'			=> 'me@rowanlewis.com'
				)
			);
		}
		
		public function getSubscribedDelegates() {
			return array(
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'FrontendDevKitResolve',
					'callback'	=> 'frontendDevKitResolve'
				),
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'ManipulateDevKitNavigation',
					'callback'	=> 'manipulateDevKitNavigation'
				)
			);
		}
		
		public function frontendDevKitResolve($context) {
			if (isset($_GET['profile'])) {
				require_once(EXTENSIONS . '/profiledevkit/content/content.profile.php');
				
				$context['devkit'] = new Content_ProfileDevkit();
				self::$active = true;
			}
		}
		
		public function manipulateDevKitNavigation($context) {
			$xml = $context['xml'];
			$item = $xml->createElement('item');
			$item->setAttribute('name', __('Profile'));
			$item->setAttribute('handle', 'profile');
			$item->setAttribute('active', (self::$active ? 'yes' : 'no'));
			
			$xml->documentElement->appendChild($item);
		}
	}
	
?>
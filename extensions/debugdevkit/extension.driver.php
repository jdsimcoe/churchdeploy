<?php

	class Extension_DebugDevKit extends Extension {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/

		public static $active = false;

		public function about() {
			return array(
				'name'			=> 'Debug DevKit',
				'version'		=> '1.2.1',
				'release-date'	=> '2011-07-03',
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
			if (false or isset($_GET['debug'])) {
				require_once(EXTENSIONS . '/debugdevkit/content/content.debug.php');

				$context['devkit'] = new Content_DebugDevKit_Debug();
				self::$active = true;
			}
		}

		public function manipulateDevKitNavigation($context) {
			$xml = $context['xml'];
			$item = $xml->createElement('item');
			$item->setAttribute('name', __('Debug'));
			$item->setAttribute('handle', 'debug');
			$item->setAttribute('active', (self::$active ? 'yes' : 'no'));

			$parent = $xml->documentElement;

			if ($parent->hasChildNodes()) {
				$parent->insertBefore($item, $parent->firstChild);
			}

			else {
				$xml->documentElement->appendChild($item);
			}
		}
	}

?>
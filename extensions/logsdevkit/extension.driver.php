<?php

	class Extension_LogsDevKit extends Extension {

		public static $active = false;

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
			if (isset($_GET['logs'])) {
				require_once(EXTENSIONS . '/logsdevkit/content/content.logs.php');

				$context['devkit'] = new Content_LogsDevKit();
				self::$active = true;
			}
		}

		public function manipulateDevKitNavigation($context) {
			$xml = $context['xml'];
			$item = $xml->createElement('item');
			$item->setAttribute('name', __('Logs'));
			$item->setAttribute('handle', 'logs');
			$item->setAttribute('active', (self::$active ? 'yes' : 'no'));

			$xml->documentElement->appendChild($item);
		}
	}

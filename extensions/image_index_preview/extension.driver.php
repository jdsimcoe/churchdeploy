<?php

	Class extension_image_index_preview extends Extension {

		public function getSubscribedDelegates() {
			return array(
				array(
					'page'     => '/backend/',
					'delegate' => 'InitaliseAdminPageHead',
					'callback' => 'InitaliseAdminPageHead'
				),
			);
		}

 		public function InitaliseAdminPageHead($context) {
			$callback = Administration::instance()->getPageCallback();

			// Append styles for publish area
			if(in_array($callback['context']['page'], array('index', 'new', 'edit'))) {

				Administration::instance()->Page->addScriptToHead(URL . '/extensions/image_index_preview/assets/image_index_preview.publish.js', null, false);
			}
		}

	}

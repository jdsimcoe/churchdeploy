<?php

class extension_markdown_editor extends Extension {

	public function getSubscribedDelegates() {
		return array(
			array(
				'page' => '/backend/',
				'delegate' => 'InitaliseAdminPageHead',
				'callback' => 'initaliseAdminPageHead'
			)
		);
	}

	public function initaliseAdminPageHead($context) {
		$page_callback = Administration::instance()->getPageCallback();
		$page_callback = $page_callback['context'];

		if(isset($page_callback['section_handle']) && ($page_callback['page'] == 'edit' || $page_callback['page'] == 'new')){
			Administration::instance()->Page->addStylesheetToHead(URL . '/extensions/markdown_editor/assets/markdown_editor.publish.css', 'screen', 1981);
			Administration::instance()->Page->addScriptToHead(URL . '/extensions/markdown_editor/assets/symphony.markdown_editor.js', 1983);
			Administration::instance()->Page->addScriptToHead(URL . '/extensions/markdown_editor/assets/markdown_editor.publish.js', 1984);
		}
	}
}

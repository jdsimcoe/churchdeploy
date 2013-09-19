<?php

class extension_resave_entries extends Extension
{
	public function getSubscribedDelegates()
	{
		return array(
			array(
				'page' => '/system/preferences/',
				'delegate' => 'AddCustomPreferenceFieldsets',
				'callback' => 'AddCustomPreferenceFieldsets',
			),
			array(
				'page' => '/backend/',
				'delegate' => 'InitaliseAdminPageHead',
				'callback' => 'InitaliseAdminPageHead'
			)
		);
	}
	
	public function InitaliseAdminPageHead($context)
	{
		Administration::instance()->Page->addScriptToHead(
			URL . '/extensions/resave_entries/assets/resave_entries.publish.js',
			time()
		);
	}

	public function AddCustomPreferenceFieldsets($context)
	{
		require_once TOOLKIT. '/class.entrymanager.php';

		if (isset($_REQUEST['action']['resave']))
		{
			$id = $_REQUEST['resave']['section'];
			$rate = $_REQUEST['resave']['rate'];
			$page = $_REQUEST['resave']['page'];
			$total = $_REQUEST['resave']['total'];
			$callback = $_REQUEST['resave']['callback'];
			
			if ($total && $page > $total)
				die(self::send(array('status' => 'success')));
			
			$limit = $start = null;
			if ($rate)
			{
				$limit = $rate;
				$start = ($page -1) * $rate;
			}
			
			if ($callback)
			{
				if (!function_exists($callback))
					require_once EXTENSIONS. '/resave_entries/callback.php';
				
				if (!function_exists($callback))
					die('Callback does not exist :('); // that's handling errors properly ;)
			}
			
			require_once TOOLKIT. '/class.entrymanager.php';

			$entries = EntryManager::fetch($entry_id = null, $id, $limit, $start);
			$fields  = FieldManager::fetch($field_id = null, $id);
			$section = SectionManager::fetch($id);

			if (!empty($entries)) $entries[0]->checkPostData(array());

			foreach ($entries as $e)
			{
				ExtensionManager::notifyMembers('EntryPreRender', '/publish/edit/', array('section' => $section, 'entry' => &$e, 'fields' => $fields));
				ExtensionManager::notifyMembers('EntryPreEdit', '/publish/edit/', array('section' => $section, 'entry' => &$e, 'fields' => $fields));

				if ($callback) $callback(array('section' => $section, 'entry' => &$e, 'fields' => $fields));

				$e->commit();
				ExtensionManager::notifyMembers('EntryPostEdit', '/publish/edit/', array('section' => $section, 'entry' => $e, 'fields' => $fields));
			}

			if ($rate && !$total)
				$total = ceil(EntryManager::fetchCount($id) / $rate);

			if (!$rate) Administration::instance()->Page->pageAlert(__('Entries resaved succesfully.'), Alert::SUCCESS);
			else die(self::send(array('status' => 'processing', 'total' => $total)));
		}

		$group = new XMLElement('fieldset');
		$group->setAttribute('class', 'settings resave-entries');
		$group->appendChild(new XMLElement('legend', __('Resave entries'))); 

		$span = new XMLElement('span', NULL, array('class' => 'frame'));
		$sections = SectionManager::fetch();

		$options = array();
		foreach ($sections as $s)
		{
			$options[] = array(
				$s->get('id'), false, $s->get('name')
			);
		}

		$label = Widget::Label(__('Section'));
		$select = Widget::Select('resave[section]', $options);
		$label->appendChild($select);
		$group->appendChild($label);


		$g = new XMLElement('div', null, array('class' => 'group'));
		$group->appendChild($g);

		$label = Widget::Label(__('Entries to update per page'));
		$label->appendChild(Widget::Input('resave[per-page]', '50'));
		$g->appendChild($label);

		$label = Widget::Label(__('PHP callback'));
		$label->appendChild(Widget::Input('resave[callback]', ''));
		$g->appendChild($label);

		$span->appendChild(new XMLElement('button', __('Resave Entries'), array_merge(array('name' => 'action[resave]', 'type' => 'submit'))));

		$group->appendChild($span);
		$context['wrapper']->appendChild($group);
	}

	public static function send($data)
	{
		header('content-type: application/json');
		return json_encode($data);
	}
}

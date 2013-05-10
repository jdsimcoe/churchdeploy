<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventsend_messsage extends Event{

		const ROOTELEMENT = 'send-messsage';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Send Messsage',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://eota',
					'email' => 'jonathan@simko.io'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2013-05-09T15:31:16+00:00',
				'trigger-condition' => 'action[send-messsage]'
			);
		}

		public static function getSource(){
			return '29';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;send-messsage result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/send-messsage></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;send-messsage result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/send-messsage></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="15728640" />
  &lt;label>Name
    &lt;input name="fields[name]" type="text" />
  &lt;/label>
  &lt;label>Email
    &lt;input name="fields[email]" type="text" />
  &lt;/label>
  &lt;label>Message
    &lt;textarea name="fields[message]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;input name="action[send-messsage]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://eota/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['send-messsage'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}

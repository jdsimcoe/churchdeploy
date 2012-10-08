<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventmembers_create extends Event{

		const ROOTELEMENT = 'members-create';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Members: Create',
				'author' => array(
					'name' => 'Admin Admin',
					'website' => 'http://churchdeploy',
					'email' => 'noreply@churchdeploy.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2011-11-02T08:40:24+00:00',
				'trigger-condition' => 'action[members-create]'
			);
		}

		public static function getSource(){
			return '1';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;members-create result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/members-create></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;members-create result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/members-create></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>First name
    &lt;input name="fields[first-name]" type="text" />
  &lt;/label>
  &lt;label>Middle name
    &lt;input name="fields[middle-name]" type="text" />
  &lt;/label>
  &lt;label>Last name
    &lt;input name="fields[last-name]" type="text" />
  &lt;/label>
  &lt;label>Email
    &lt;input name="fields[email]" type="text" />
  &lt;/label>
  &lt;fieldset>
    &lt;label>Password
      &lt;input name="fields[password][password]" type="password" />
    &lt;/label>
    &lt;label>Password Confirm
      &lt;input name="fields[password][confirm]" type="password" />
    &lt;/label>
  &lt;/fieldset>
  &lt;label>Activation
    &lt;input name="fields[activation]" type="text" />
  &lt;/label>
  &lt;label>Role
    &lt;select name="fields[role]">
      &lt;option value="1">Public&lt;/option>
      &lt;option value="2">Member&lt;/option>
      &lt;option value="3">Not yet activated&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Date created
    &lt;input name="fields[date-created]" type="text" />
  &lt;/label>
  &lt;label>Birthday
    &lt;input name="fields[birthday][start][]" type="text" />
  &lt;/label>
  &lt;label>Gender
    &lt;select name="fields[gender]">
      &lt;option value="Male">Male&lt;/option>
      &lt;option value="Female">Female&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;input name="action[members-create]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://churchdeploy/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['members-create'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}

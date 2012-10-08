<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventimages_create extends Event{

		const ROOTELEMENT = 'images-create';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Images: Create',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://72.10.33.203',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-05-25T01:13:23+00:00',
				'trigger-condition' => 'action[images-create]'
			);
		}

		public static function getSource(){
			return '8';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;images-create result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/images-create></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;images-create result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/images-create></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>ID
    &lt;input name="fields[id]" type="text" />
  &lt;/label>
  &lt;label>Image
    &lt;input name="fields[image]" type="file" />
  &lt;/label>
  &lt;label>Caption
    &lt;!-- Modify just current language value -->
    &lt;input name="fields[caption][value-{$url-language}]" type="text" /> 
    
    &lt;!-- Modify all values -->
    &lt;input name="fields[caption][value-en]" type="text" />
  &lt;/label>
  &lt;label>Position
    &lt;select name="fields[position]">
      &lt;option value="Top left">Top left&lt;/option>
      &lt;option value="Top center">Top center&lt;/option>
      &lt;option value="Top right">Top right&lt;/option>
      &lt;option value="Middle left">Middle left&lt;/option>
      &lt;option value="Middle center">Middle center&lt;/option>
      &lt;option value="Middle right">Middle right&lt;/option>
      &lt;option value="Bottom left">Bottom left&lt;/option>
      &lt;option value="Bottom center">Bottom center&lt;/option>
      &lt;option value="Bottom right">Bottom right&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Height
    &lt;input name="fields[height]" type="text" />
  &lt;/label>
  &lt;select name="fields[tags]">
    &lt;option value="...">...&lt;/option>
  &lt;/select>
  &lt;label>Hide
    &lt;input name="fields[hide]" type="checkbox" />
  &lt;/label>
  &lt;!--> --&lt;/!-->
  &lt;input name="action[images-create]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://72.10.33.203/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['images-create'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}

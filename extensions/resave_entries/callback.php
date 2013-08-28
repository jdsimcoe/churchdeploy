<?php

// this file is empty by default.
// feel free to add as many callbacks as you need while resaving your entries.


// thanks to Ali Minium for the following example callback

// use the name of the method on the callback input field into preferences
/*
function callbackMethod($data) {
    // 25 is the id of the textarea you wanna update after having changed the formatter
    callbackMethod($data, 25);
    // if you have many text areas you can call the method with as many id
    //   from different sections as far as it's the same transforming method
    //callbackMethod($data, 48);
    //callbackMethod($data, 60);
}

function callbackMethod($data, $field_id) {
    // retrieve field's data
    $fieldData = $data['entry']->getData($field_id);

    // works only if the field exists into the section to update
    if (!is_null($fieldData)) {
        // textareas fields are saved on database using 2 different fields
        // - 'value' which is equivalent to : unformatted
        // - 'value_formatted' which is equivalent to : formatted

        // recovering the field's value
        $unformatted = $fieldData['value'];

        if (!is_null($unformatted)) {
            // call the transforming method
            $formatted = transfomMethod($unformatted);
            // updates the formatted value of the field's data
            $data['entry']->setData($field_id, array('value_formatted' => $formatted));
        }
    }

}

*/

function toMarkdown($data){
    execMarkdown($data, 88);
}

function execMarkdown($data, $field_id){

    // retrieve field's data
    $fieldData = $data['entry']->getData($field_id);

    // works only if the field exists into the section to update
    if (!is_null($fieldData)) {

        // recovering the field's value
        $unformatted = $fieldData['value'];

        if (!is_null($unformatted)) {

            // call the transforming method
            $formatted = markdownProcess($unformatted);

            // taken from fieldTextarea->__applyFormatting()
            include_once(TOOLKIT. '/class.general.php');
            include_once(TOOLKIT. '/class.xsltprocess.php');
            $errors = NULL;
            if(!General::validateXML($formatted, $errors, false, new XsltProcess)){
                $formatted = html_entity_decode($formatted, ENT_QUOTES, 'UTF-8');
                $formatted = preg_replace('/&(?!(#[0-9]+|#x[0-9a-f]+|amp|lt|gt);)/i', '&amp;', trim($formatted));
            }

            // updates the formatted value of the field's data
            $data['entry']->setData($field_id, array(
                'value' => $unformatted,
                'value_formatted' => $formatted,
            ));
        }
    }
}

function markdownProcess($text, $markdown_extra=false){

    require_once(EXTENSIONS. '/markdown/lib/php-markdown-extra-1.2.4/markdown.php');

    if($markdown_extra) $parser = new MarkdownExtra_Parser();
    else $parser = new Markdown_Parser();

    $result = stripslashes($parser->transform($text));
    return $result;
}

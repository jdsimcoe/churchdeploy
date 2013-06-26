;(function($){

// Private properties
var defaults = {};

$.MarkdownEditor = function(element, options){
	var editor = this,
		$textarea = $(element),
		$field;

	var MarkDown = {
		'function-bold': {
			search: /([^\n]+)([\n\s]*)/g,
			replace: "**$1**$2"
		},
		'function-italic': {
			search: /([^\n]+)([\n\s]*)/g,
			replace: "_$1_$2"
		},
		'function-code': {
			search: /([^\n]+)([\n\s]*)/g,
			replace: "`$1`$2"
		},
		'function-hr': {
			append: "\n***\n"
		},
		'function-ul': {
			search: /(.+)([\n]?)/g,
			replace: "* $1$2"
		},
		'function-ol': {
			search: /(.+)([\n]?)/g,
			replace: "1. $1$2"
		},
		'function-blockquote': {
			search: /(.+)([\n]?)/g,
			replace: "> $1$2"
		},
		'function-h1': {
			search: /(.+)([\n]?)/g,
			replace: "# $1$2"
		},
		'function-h2': {
			search: /(.+)([\n]?)/g,
			replace: "## $1$2"
		},
		'function-h3': {
			search: /(.+)([\n]?)/g,
			replace: "### $1$2"
		},
		'function-h4': {
			search: /(.+)([\n]?)/g,
			replace: "#### $1$2"
		},
		'function-h5': {
			search: /(.+)([\n]?)/g,
			replace: "##### $1$2"
		},
		'function-h6': {
			search: /(.+)([\n]?)/g,
			replace: "###### $1$2"
		},
		'function-link': {
			exec: function(txt, selText, $field) {
				var results = null;
				editor.Dialog.init({
					title: 'Insert Link',
					fields: [
					{
						id: 'text',
						name: 'Link Text',
						type: 'text',
						defaultValue: selText
					},
					{
						id: 'href',
						name: 'URL',
						type: 'text'
					}
					],
					OK: function(res) {
						var rep = '';
						if (res['text'] && res['href']) {
							rep = '[' + res['text'] + '](' +
							res['href'] + ')';
						}
						editor.FunctionBar.replaceFieldSelection(rep);
					}
				});
			}
		},
		'function-image': {
			exec: function(txt, selText, $field) {
				var results = null;
				editor.Dialog.init({
					title: 'Insert Image',
					fields: [
					{
						id: 'url',
						name: 'Image URL',
						type: 'text'
					},
					{
						id: 'alt',
						name: 'Alt Text',
						type: 'text',
						defaultValue: selText
					}
					],
					OK: function(res) {
						var rep = '';
						if (res['url'] && res['alt']) {
							rep = '![' + res['alt'] + ']' +
							'(' + res['url'] + ')';
						}
						editor.FunctionBar.replaceFieldSelection(rep);
					}
				});
			}
		}
	};

	if (!$textarea.is('textarea')) debug('You can only call this plugin on textareas!');

	$field = $textarea.closest('div');
	editor.settings = {};

	editor.init = function() {
		editor.settings = $.extend(true, {}, $.MarkdownEditor.defaults, options);

		editor.FunctionBar.init();
	};

	editor.FunctionBar = {
		init: function() {
			debug('Initializing function bar');

			$field.append('\
				<div class="markdowneditor-function-bar">\
					<div class="markdowneditor-function-buttons">\
						<a href="#" class="function-h1" title="Header 1">h1</a>\
						<a href="#" class="function-h2" title="Header 2">h2</a>\
						<a href="#" class="function-h3" title="Header 3">h3</a>\
						<a href="#" class="function-h4" title="Header 4">h4</a>\
						<a href="#" class="function-h5" title="Header 5">h5</a>\
						<a href="#" class="function-h6" title="Header 6">h6</a>\
						<span class="function-divider">&nbsp;</span>\
						<a href="#" class="function-ul" title="Unordered List">&#9642;&nbsp;&mdash;</br>&#9642;&nbsp;&mdash;</br>&#9642;&nbsp;&mdash;</a>\
						<a href="#" class="function-ol" title="Ordered List">1&nbsp;&mdash;</br>2&nbsp;&mdash;</a>\
						<a href="#" class="function-blockquote" title="Blockquote">&nbsp;</br>&ldquo;</a>\
						<a href="#" class="function-hr" title="Horizontal Rule">&hellip;<br/>&mdash;</a>\
						<span class="function-divider">&nbsp;</span>\
						<a href="#" class="function-bold" title="Bold">B</a>\
						<a href="#" class="function-italic" title="Italic">i</a>\
						<a href="#" class="function-code" title="Code">&lt;&gt;</a>\
						<span class="function-divider">&nbsp;</span>\
						<a href="#" class="function-link" title="Link">&infin;</a>\
						<a href="#" class="function-image" title="Image">&#9635;</a>\
					</div>\
				</div>\
			');

			// Move textarea out of its label to prvent nested labels
			$field.append($textarea);

			$field.addClass('markdowneditor').on('click.markdownEditor', '.markdowneditor-function-buttons a', function(event){
				event.preventDefault();
				var def = MarkDown[$(this).attr('class')];
				if (typeof def == 'object') {
					editor.FunctionBar.executeAction(def);
				}
			});
		},

		executeAction: function(definitionObject) {
			// get the selected text from the textarea
			var txt = $textarea.val(),
				selPos = editor.FunctionBar.getFieldSelectionPosition(),
				selText = editor.FunctionBar.getFieldSelection(),
				repText = selText,
				reselect = true,
				cursor = null;

			// execute a replacement function if one exists
			if (definitionObject.exec && typeof definitionObject.exec == 'function') {
				debug('Execute replacement function');
				definitionObject.exec(txt, selText, $textarea);
				return;
			}

			// execute a search/replace if they exist
			var searchExp = /([^\n]+)/gi;
			if (definitionObject.search && typeof definitionObject.search == 'object') {
				debug('Replacing search Regex');
				searchExp = null;
				searchExp = new RegExp(definitionObject.search);
				debug(searchExp);
			}
			debug('repText is ' + '"' + repText + '"');
			// replace text
			if (definitionObject.replace && typeof definitionObject.replace == 'string') {
				debug('Running replacement - using ' + definitionObject.replace);
				var rt = definitionObject.replace;
				repText = repText.replace(searchExp, rt);
				// remove backreferences
				repText = repText.replace(/\$[\d]/g, '');

				if (repText === '') {
					debug('Search string is empty');

					// find position of $1 - this is where we will place the cursor
					cursor = rt.indexOf('$1');

					// we have an empty string, so just remove backreferences
					repText = rt.replace(/\$[\d]/g, '');

					// if the position of $1 doesn't exist, stick the cursor in
					// the middle
					if (cursor == -1) {
						cursor = Math.floor(rt.length / 2);
					}
				}
			}

			// append if necessary
			if (definitionObject.append && typeof definitionObject.append == 'string') {
				if (repText == selText) {
					reselect = false;
				}
				repText += definitionObject.append;
			}

			if (repText) {
				editor.FunctionBar.replaceFieldSelection(repText, reselect, cursor);
			}

		},

		getFieldSelectionPosition: function() {
			var start = 0, end = 0,
				el = $textarea.get(0);

			if (typeof el.selectionStart == "number" && typeof el.selectionEnd == "number") {
				start = el.selectionStart;
				end = el.selectionEnd;
			} else {
				var range = document.selection.createRange();
				var stored_range = range.duplicate();
				stored_range.moveToElementText(el);
				stored_range.setEndPoint('EndToEnd', range);
				start = stored_range.text.length - range.text.length;
				end = start + range.text.length;

				// so, uh, we're close, but we need to search for line breaks and
				// adjust the start/end points accordingly since IE counts them as
				// 2 characters in TextRange.
				var s = start;
				var lb = 0;
				var i;
				debug('IE: start position is currently ' + s);
				for (i = 0; i < s; i++) {
					if (el.value.charAt(i).match(/\r/)) {
						++lb;
					}
				}

				if (lb) {
					debug('IE start: compensating for ' + lb + ' line breaks');
					start = start - lb;
					lb = 0;
				}

				var e = end;
				for (i = 0; i < e; i++) {
					if (el.value.charAt(i).match(/\r/)) {
						++lb;
					}
				}

				if (lb) {
					debug('IE end: compensating for ' + lb + ' line breaks');
					end = end - lb;
				}
			}

			return {
				start: start,
				end: end
			};
		},

		getFieldSelection: function() {
			var selStr = '', selPos;

			selPos = editor.FunctionBar.getFieldSelectionPosition();
			selStr = $textarea.val().substring(selPos.start, selPos.end);
			debug('Selected: ' + selStr + ' (' + selPos.start + ', ' + selPos.end + ')');
			return selStr;
		},

		replaceFieldSelection: function(replaceText, reselect, cursorOffset) {
			var selPos = editor.FunctionBar.getFieldSelectionPosition(),
				el = $textarea.get(0),
				fullStr = $textarea.val(),
				selectNew = true;
			if (reselect === false) {
				selectNew = false;
			}

			var scrollTop = null;
			if ($textarea.scrollTop()) {
				scrollTop = $textarea.scrollTop();
			}

			$textarea.val(fullStr.substring(0, selPos.start) + replaceText + fullStr.substring(selPos.end));
			$textarea.focus();

			if (selectNew) {
				if (el.setSelectionRange) {
					if (cursorOffset) {
						el.setSelectionRange(selPos.start + cursorOffset, selPos.start + cursorOffset);
					} else {
						el.setSelectionRange(selPos.start, selPos.start + replaceText.length);
					}
				} else if (el.createTextRange) {
					var range = el.createTextRange();
					range.collapse(true);
					if (cursorOffset) {
						range.moveEnd(selPos.start + cursorOffset);
						range.moveStart(selPos.start + cursorOffset);
					} else {
						range.moveEnd('character', selPos.start + replaceText.length);
						range.moveStart('character', selPos.start);
					}
					range.select();
				}
			}

			if (scrollTop) {
				$textarea.scrollTop(scrollTop);
			}
		}
	};

	editor.Dialog = {
		markupCreated: false,

		attachEvents: function(evtOK) {
			$field.on('click.markdownEditor', '.markdowneditor-dialog-actions > *', function(event) {
				event.preventDefault();
				var $button = $(this);
				if ($button.is('.markdowneditor-dialog-ok')) {
					editor.Dialog.eventOK(event, evtOK);
				} else if ($button.is('.markdowneditor-dialog-cancel')) {
					editor.Dialog.eventCancel();
				};
			});
		},

		createFieldMarkup: function(fieldArray) {
			var fieldMarkup = '<div class="two columns">';
			for (var i = 0; i < fieldArray.length; i++) {
				if (typeof fieldArray[i] == 'object') {
					fieldMarkup += '<div class="column">';
					switch (fieldArray[i].type) {
						case 'text':
							fieldMarkup += editor.Dialog.createFieldText(fieldArray[i]);
							break;
						default:
							break;
					}
					fieldMarkup += '</div>';
				}
			}
			fieldMarkup += '</div>';
			return fieldMarkup;
		},

		createFieldText: function(fieldAttributes) {
			var html = '';

			if (fieldAttributes.name) {
				html += '<label';
				if (fieldAttributes.id) {
					html += ' for="' + fieldAttributes.id + '"';
				}
				html += '>' + fieldAttributes.name;
			}

			html += '<input type="text"';

			if (fieldAttributes.id) {
				html += ' data-name="' + fieldAttributes.id + '"';
			}
			if (fieldAttributes.defaultValue) {
				html += ' value="' + fieldAttributes.defaultValue + '"';
			}

			html += '/></label>';

			return html;
		},

		createMarkup: function(title, body) {
			editor.Dialog.markupCreated = true;
			return '<div class="markdowneditor-dialog">' +
				'<div class="markdowneditor-dialog-body">' + body + '</div>' +
				'<div class="markdowneditor-dialog-actions">' +
					'<a href="#" class="markdowneditor-dialog-cancel">Cancel</a>' +
					'<button type="button" class="markdowneditor-dialog-ok">' + title + '</button>' +
				'</div>' +
				'</div>';
		},

		eventCancel: function(e) {
			debug('Cancelled dialog.');
			editor.Dialog.hide();
		},

		eventOK: function(e, evtOK) {
			var results = [];
			// get the results from each field and build them into the object
			$field.find('.markdowneditor-dialog-body input').each(function() {
				results[$(this).data('name')] = $(this).val();
			});

			// pass them to evtOK if it exists (which it should)
			if (evtOK && typeof evtOK == 'function') {
				evtOK(results);
			}
			editor.Dialog.hide();
		},

		init: function(options) {
			var title = '',
				body = '';

			// bail out if necessary
			if (!options || typeof options != 'object') {
				debug('Editor Dialog: Cannot init; invalid init object');
				return;
			}

			if (options.body && typeof options.body == 'string') {
				body = '<p>' + options.body + '</p>';
			}

			// alright, build out fields
			if (options.fields && typeof options.fields == 'object') {
				body += editor.Dialog.createFieldMarkup(options.fields);
			}

			if (options.title && typeof options.title == 'string') {
				title = options.title;
			}

			if (editor.Dialog.markupCreated) {
				$field.find('.markdowneditor-dialog').remove();
			}
			var $dialog = $(editor.Dialog.createMarkup(title, body)).hide();
			$field.find('.markdowneditor-function-bar').append($dialog);
			if (options.OK && typeof options.OK == 'function') {
				editor.Dialog.attachEvents(options.OK);
			}
			editor.Dialog.show();
		},

		show: function() {
			if (!editor.Dialog.markupCreated) {
				debug('Dialog: No markup to show. Please use init first.');
			} else {
				debug('Showing dialog');
				$field.find('.markdowneditor-dialog').slideDown(200);
			}
		},

		hide: function() {
			$field.find('.markdowneditor-dialog').slideUp(200);
		}
	}; 

	editor.init();
};

$.fn.markdownEditor = function(options){
	if (!this.length) {return this;}

	return this.each(function(){
		if (!$.data(this, 'markdownEditor')) {
			$.data(this, 'markdownEditor', new $.MarkdownEditor(this, options));
		}
	});
};

$.MarkdownEditor.defaults = defaults;

// Private methods
function debug($obj) {
	if (window.console && window.console.log) {
		window.console.log($obj);
	}
};

})(jQuery);

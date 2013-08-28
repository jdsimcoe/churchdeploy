(function($) {

	$(document).ready(function(){

		// Symphony's tags does not support textarea, so we have to clone its functionality here :(.
		$('fieldset.conditionalizer ul.tags')
			.off('click.tags')
			.on('click.tags', 'li', function(event){
				var item = $(this),
					object = item.parent(),
					input = object.prev().find('textarea.code'),
					value = input.val(),
					tag = item.attr('class') || item.text();

					var start = input[0].selectionStart,
						end = input[0].selectionEnd,
						position = 0;

					// Insert tag
					if(start > 0) {
						input.val(value.substring(0, start) + tag + value.substring(end, value.length));
						position = start + tag.length;
					}

					// Append tag
					else {
						input.val(value + tag);
						position = value.length + tag.length;
					}

					// Reset cursor position
					input[0].selectionStart = position;
					input[0].selectionEnd = position;
			});


	});

})(jQuery.noConflict());

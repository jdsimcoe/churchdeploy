/*-----------------------------------------------------------------------------
	Text Box Interface
-----------------------------------------------------------------------------*/

	jQuery(document).ready(function() {
		jQuery('div.field-textbox').each(function() {
			var self = jQuery(this);
			var input = self.find('input, textarea');

			if (input.attr('length') < 1) return;

			var optional = self.find('i');
			var message = optional.text();

			var update = function() {
				var length = input.val().length;
				var limit = input.attr('length');
				var remaining = limit - length;

				optional
					.text(message.replace('$1', remaining).replace('$2', limit))
					.removeClass('limit-reached');

				if (remaining < 0) {
					optional.addClass('limit-reached');
				}
			};

			input.bind('blur change focus keypress keyup', update);
			update();
		});
	});

/*---------------------------------------------------------------------------*/
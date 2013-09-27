Symphony.Language.add({
	'Looks like the request cannot be completed. Lowering entries per page might be a good idea :)': false,
	'Processing...': false, 'Done': false,
	'Processing {$page} of {$total}': false
});

jQuery(function($){

	var _ = Symphony.Language.get;
	var fieldset = $('.resave-entries'),
		logger = $('<span />');

	if (!fieldset.length) return;


	fieldset.append(logger).find('button').click(function(e){
		e.preventDefault();

		var rate = fieldset.find("input[name *= 'per-page']").val(),
			self = $(this),
			section = fieldset.find('select').val(),
			cb = fieldset.find("input[name *= 'callback']").val(),
			page = 1, total = 0;
			
		rate = parseInt(rate);
		if (isNaN(rate)) return; // -.-

		self.attr('disabled', 'disabled');
		logger.text(_('Processing...'));

		var doAjax = function(){
			var data = {resave: {rate: rate, section: section, page: page, total: total, callback: cb}, 'action[resave]': 'doIt!'};

			$.ajax({
				url: window.location.href,
				data: data,
				dataType: "json",
				success: function(res){
					if (res.status == 'success')
					{
						self.attr('disabled', null);
						return logger.text(_('Done') + '!');
					}

					total = parseInt(res.total);
					logger.text(_('Processing {$page} of {$total}', {page: page, total: total}));
					page++;

					if (res.status == 'processing' && total > 0)
						doAjax();
				},

				error: function(){
					self.attr('disabled', null);
					logger.text(_(
						'Looks like the request cannot be completed. Lowering entries per page might be a good idea :)'
					));
				}
			});
		};

		doAjax();
	});
});

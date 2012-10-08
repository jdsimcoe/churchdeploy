/*-----------------------------------------------------------------------------
	Text Box Interface
-----------------------------------------------------------------------------*/
	
jQuery(document).ready(function() {
	jQuery('.field-multilingual').each(function() {
		var self = jQuery(this);
		var field = new MultilingualField(jQuery(this));	

		var input = self.find('input, textarea');
		
		if (input.attr('length') < 1) return;

		var optional = self.find('i');
		var message = optional.text();

		jQuery(input).each(function() {
			var $input = jQuery(this);
			
			var update = function() {
				var length = $input.val().length;
				var limit = $input.attr('length');
				var remaining = limit - length;
				
				optional
					.text(message.replace('$1', remaining).replace('$2', limit))
					.removeClass('invalid');
				
				if (remaining < 0) {
					optional.addClass('invalid');
				}
			};
			
			$input.bind('blur', update);
			$input.bind('change', update);
			$input.bind('focus', update);
			$input.bind('keypress', update);
			$input.bind('keyup', update);
			
			update();
		});
	});
});

function MultilingualField(field) {
	this.field = field;
	
	this.init();
}

MultilingualField.prototype.init = function() {
	var self = this,
		activeTab = this.field.find('ul.tabs li.active');

	// Fallback to first tab if no tab is set as active by default
	if (activeTab.length == 0) {
		activeTab = this.field.find('ul.tabs li:eq(0)');
	}

	// bind tab events
	this.field.find('ul.tabs li').bind('click', function(e) {
		e.preventDefault();
		self.setActiveTab(jQuery(this).attr('class').split(' ')[0]);
	});
	
	// Show the active tab
	this.setActiveTab(activeTab.attr('class').split(' ')[0]);
	
	// Set unique id for tynymce support
	this.field.find('textarea.tinymce').each(function () {
		this.id = this.name;
	});
}

MultilingualField.prototype.setActiveTab = function(tab_name) {
	var self = this;
	
	// hide all tab panels
	jQuery('.field-multilingual').find('.tab-panel').hide();
	
	// find the desired tab and activate the tab and its panel
	jQuery('.field-multilingual ul.tabs li').each(function() {
		var tab = jQuery(this);

		if (tab.hasClass(tab_name)) {
			tab.addClass('active');
			
			var panel = tab.parent().parent().find('.tab-' + tab_name);
			panel.show();

			// Resize hidden tinyMCE to fit to the correct size 
			if (panel.find('textarea.tinymce').length > 0) {
				var input = panel.find('textarea.tinymce');
				panel.find('table.mceLayout').width('100%');
				panel.find('table.mceLayout').height(input.attr('rows')+'em');
				panel.find('table.mceLayout iframe').height(input.attr('rows')+'em');
			}
		} else {
			tab.removeClass('active');
		}
	});
}

/*---------------------------------------------------------------------------*/
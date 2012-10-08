jQuery(document).ready(function() {
	
	// get the cacheabledatasource context from the DOM
	var datasource = Symphony.Context.get('cacheabledatasource');
	
	// build HTML label
	var label = '<label>';
	label += 'Update cached result every ';
	label += '<input name="fields[cache]" value="'+datasource.cache+'" size="6" />';
	label += ' seconds';
	label += '</label>';
	
	// append label to a new fieldset
	var fieldset = '<fieldset class="settings cacheabledatasource"><legend>Caching</legend>'+label+'</fieldset>';
	
	jQuery('select[name="fields[source]"]').live('change', function() {
		// remove the cache fieldset
		jQuery('fieldset.cacheabledatasource').remove();
		// if the source is a number (a Section), append cache fieldset
		if(!isNaN(jQuery(this).val())) {
			jQuery('div.actions').before(fieldset);
		}
	})
	.change();
	
});
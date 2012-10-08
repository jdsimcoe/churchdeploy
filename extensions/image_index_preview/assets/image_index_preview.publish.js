
(function($) {
	
	/**
	 * This plugin adds image preview to the publish pages.
	 *
	 * @author: Nils Hörrmann, post@nilshoerrmann.de
	 * @source: http://github.com/nilshoerrmann/image_index_preview
	 */
	$(document).ready(function() {
		$('table td[class*="upload"], fieldset div[class*="upload"]').addClass('upload').find('a').each(function() {
			var link = $(this),
				href = link.attr('href'),
                size = (Symphony.Context.get('env')['page'] == 'index' ? '40/40' : '0/150')
				file = href.replace(Symphony.Context.get('root') + '/workspace/', '');

			// Append preview
			if(file) {
				if(file.match(/\.(?:bmp|gif|jpe?g|png)$/i)) {
					
					// Remove file name
					link.text('');
					
					// Add image
					$('<img />', {
						src: Symphony.Context.get('root') + '/image/2/' + size + '/5/' + file
					}).prependTo(link);
				}
			}
		});
	});
		
})(jQuery.noConflict());

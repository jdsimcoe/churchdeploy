jQuery(document).ready(function($) {

	 /**
		* This plugin adds image preview to the publish pages.
		*
		* @author: Symphony Community
		* @source: https://github.com/symphonists/image_index_preview
		*/

	 var root, page, link, path, file, size;

	 var defaultSize = 140;

	 root = Symphony.Context.get('root');
	 page = Symphony.Context.get('env')['page'];

	 function getDimensions(src) {
			img = document.createElement('img');
			img.src = src;

			img.onload = function() {
				 return { width: this.width, height: this.height };
			};

			var ratio;
			var w = img.onload().width;
			var h = img.onload().height;

			if (h > w) {
				 ratio = w / h;
				 size = parseInt(defaultSize * ratio) + '/' + 0;
			} else {
				 ratio = h / w;
				 size = 0 + '/' + parseInt(defaultSize * ratio);
			}

			return { s: size, r: ratio, h: h, w: w };
	 }

	 $('table td[class*="upload"] a, fieldset div[class*="upload"] a', '#contents').each(function() {

			link = $(this);

			if (page == 'index') {

				 path = link.data('path');
				 filename = link.text();
				 file = path.replace(root, '').replace('/workspace/','') + '/' + filename;
				 attr = getDimensions(path + '/' + filename);

			} else {

				 path = link.attr('href');
				 file = path.replace(root, '').replace('/workspace/','');

				 attr = getDimensions(path);
			}

			if (path) {

				 if (file.match(/\.(?:bmp|gif|jpe?g|png)$/i)) {

						// remove file name

						link.text('');

						// add preview

						$('<img />', {

							 src: root + '/image/1/' + attr.s + '/' + file

						}).prependTo(link);
				 }
			}
	 });
});

site.message = function(params) {
	var params	= typeof(params) == 'object' ? params : {};
	var id		= params.id || new Date().getTime();
	var content	= params.content || '';
	var width	= params.width ? params.width + '%' : 'auto';
	var height	= params.height ? params.height + '%' : 'auto';

	jQuery("<div/>", {
		"id": id,
		"class": "front_popup",
		html: "<div class=\"product content_only\" onmousedown=\"jQuery('#" + id + "').draggable('destroy')\">\
			<i class=\"fancybox-item fancybox-close\" onmousedown=\"jQuery('#" + id + "').draggable('destroy')\"></i>" + content + "</div>"
	}).appendTo("body").parent().append("<div class='overlay'></div>");

	var popup = jQuery('#' + id);
	popup.css({'width':width, 'height':height});

	var leftPosition = (window.document.documentElement.offsetWidth - popup.width()) / 2;
	var windowHeight = window.innerHeight || window.document.documentElement.offsetHeight;
	var topPosition = jQuery(window.document.documentElement).scrollTop() || jQuery(window.document).scrollTop();
	topPosition = topPosition + (windowHeight - popup.height()) / 2;
	popup.css({'left':leftPosition  + 'px', 'top':topPosition + 'px'});

	jQuery('div.body .fancybox-close', popup).add(('.overlay')).click(function() {
		site.message.close(popup, jQuery('.overlay'))
	});
	jQuery(popup).on('click', '.fancybox-close', function() {
		site.message.close(popup, jQuery('.overlay'))
	});
	var close;
	if (close = jQuery('.close', popup)) {
		close.click(function() {popup.remove();});
	}
};

site.message.close = function(popup, overlay) {
	overlay.remove();
	popup.remove();
}
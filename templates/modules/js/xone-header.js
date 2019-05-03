/*---------------------------------------------- 
		F I X E D   H E A D E R   
------------------------------------------------*/
var headeroverlay = false;
var headerheight = jQuery('header').outerHeight();
jQuery( document ).ready(function() {
	
	/* BUGFIX for revolutionslider when header shrinks */
	if (jQuery('.header-overlay').length < 1) {
		jQuery('body').append('<div id="pseudo-header"></div>');
		jQuery('#pseudo-header').css({ 'height':headerheight+'px', 'position':'absolute', 'top':0, 'left':0, 'opacity':0 });
		if (jQuery('.fixed-header').length > 0) {
			jQuery('.page-body').css({ 'margin-top':headerheight+'px'});
		}
	} else {
		headeroverlay = true;
	}
	sizeDownHeader();
});

jQuery( window ).scroll(function() {
	sizeDownHeader();
});

jQuery( window ).resize(function() {
	headerheight = jQuery('header').height();
	if (jQuery('.header-overlay').length < 1 && jQuery( window ).width() < 1023) {
		jQuery('#pseudo-header').css({ 'height':headerheight+'px', 'position':'absolute', 'top':0, 'left':0, 'opacity':0 });
		if (jQuery('.fixed-header').length > 0) {
			jQuery('.page-body').css({ 'margin-top':headerheight+'px'});
		}
	}
	sizeDownHeader();
});

function sizeDownHeader() {

	var scrolltop = 150;
	if (headeroverlay) {
		scrolltop = 500;
		if (jQuery(document).scrollTop() > jQuery(window).height()-headerheight && jQuery('.fixed-header').length > 0 ) {
			jQuery('#overlay-logo').fadeOut(0);
			jQuery('header').removeClass("header-overlay");
			if (jQuery('.header-show').length < 1) {
				jQuery('header').css({'top':'-'+headerheight+'px'});
				jQuery('header').animate({'top':'0px'}, 600, 'easeInOutQuart'); };
				jQuery('header').addClass("header-show");
		} else if (jQuery('.fixed-header').length > 0) {

			if (jQuery('.header-show').length > 0) {
				jQuery('header').animate({'top':'-'+headerheight+'px'}, 200, function() {
				jQuery('header').addClass("header-overlay");
				jQuery('header').animate({'top':'0px'}, 600, 'easeInOutQuart');
				jQuery('#overlay-logo').fadeIn(0);
			}); }
				jQuery('header').removeClass("header-show");
		}
	}


}
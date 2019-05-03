
jQuery(window).load(function($) {
	/*----------------------------------------------
	 H I D E   P A G E   L O A D E R
	 ------------------------------------------------*/
	jQuery("#page-loader .page-loader-inner").delay(1000).fadeOut(500, function(){
		jQuery("#page-loader").fadeOut(500);
	});

	flexInit('body');


	if( jQuery().isotope ) {

		/*---------------------------------------------- 
		 C A L L   I S O T O P E
		 ------------------------------------------------*/
		jQuery('.masonry').each(function(){
			var $container = jQuery(this);

			$container.imagesLoaded( function(){
				$container.isotope({
					columnWidth: '.masonry-item',
					percentPosition: true,
					itemSelector : '.masonry-item',
					transformsEnabled: true			// Important for videos
				});
			});
		});


		/*---------------------------------------------- 
		 I S O T O P E : Filter
		 ------------------------------------------------*/
		jQuery('.filter li a').click(function(){

			var parentul = jQuery(this).parents('ul.filter').data('related-grid');
			jQuery(this).parents('ul.filter').find('li a').removeClass('active');
			jQuery(this).addClass('active');

			var selector = jQuery(this).attr('data-option-value');
			jQuery('#'+parentul).isotope({ filter: selector }, function(){ });

			return(false);
		});


		/*----------------------------------------------
		 I S O T O P E : reorganize
		 ------------------------------------------------*/
		function reorganizeIsotope() {
			jQuery('.masonry.portfolio-entries').each(function(){
				$container = jQuery(this);
				var maxitemwidth = $container.data('maxitemwidth');
				if (!maxitemwidth) { maxitemwidth = 370; }
				var containerwidth = $container.width();
				var containerwidth = (containerwidth / 110) * 100;
				var itemrightmargin = parseInt($container.children('div').css('marginRight'));
				var rows = Math.ceil(containerwidth/maxitemwidth);
				var marginperrow = (rows-1)*itemrightmargin;
				var newitemmargin = marginperrow / rows;
				var itemwidth = Math.floor((containerwidth/rows)-newitemmargin+1);
				$container.css({ 'width': '110%' });
				$container.children('div').css({ 'width': itemwidth+'px' });
				if ($container.children('div').hasClass('isotope-item')) { $container.isotope( 'reLayout' ); }
			});
		}
		reorganizeIsotope();

		jQuery(window).resize(function() {
			reorganizeIsotope();
		});


	} /* END if isotope */



	/*---------------------------------------------- 
	 D R O P   D O W N   N A  V I
	 ------------------------------------------------*/
	var timer = [];
	var timerout= [];
	jQuery("header nav li").each(function(index) {
		if (jQuery(this).find("ul").length > 0) {
			var element = jQuery(this);
			//show subnav on hover
			jQuery(this).mouseenter(function() {
				if(timer[index]) {
					clearTimeout(timer[index]);
					timer[index] = null;
				}
				timer[index] = setTimeout(function() {
					jQuery(element).children('ul').fadeIn(200);
				}, 150)
			});
			//hide submenus on exit
			jQuery(this).mouseleave(function() {
				if(timer[index]) {
					clearTimeout(timer[index]);
					timer[index] = null;
				}
				timer[index] = setTimeout(function() {
					jQuery(element).children('ul').fadeOut(200);
				}, 150)
			});
		}
	});

	jQuery('header nav').on("click", "li", function() {
		if (jQuery(window).width() < 1025) {
			if (jQuery(this).find("ul").length > 0) {
				if (jQuery(this).find("ul").css('display') !== 'block') {
					jQuery(this).children("ul").fadeIn(200);
					return false;
				}
			}
		}
	});


	/*----------------------------------------------
	 R E S P ON S I V E   N A V
	 ------------------------------------------------*/
	jQuery('<a class="open-responsive-nav" href=""><span></span></a>').appendTo(".header-inner .menu");
	jQuery("body #page-content").prepend('<div id="menu-responsive"><div id="menu-responsive-inner">' +
		'<a href="" class="close-responsive-nav"><span></span></a><nav id="responsive-nav"><ul></ul></nav></div></div>');
	jQuery("nav#responsive-nav > ul").html(jQuery("nav#main-nav > ul").html());

	jQuery('header').on("click", ".open-responsive-nav", function() {
		var topPos = jQuery('header').height();
		var fullheight = jQuery("#page-content").height()-topPos;
		jQuery("#menu-responsive").css({'height':fullheight+'px','top':topPos+'px'});
		if (jQuery('#menu-responsive').css('right') == 0 || jQuery('#menu-responsive').css('right') == '0px') {
			hideResponsiveNav();
		} else {
			jQuery('#menu-responsive').animate({'right': '0'}, 800, 'easeInOutQuart');
			jQuery('html, body').animate({scrollTop: 0}, 1000, 'easeInOutQuart');
		}
		return false;
	});

	jQuery('#page-content').on("click", "#menu-responsive", function() {
		hideResponsiveNav();
	});

	function hideResponsiveNav(){
		var right = jQuery('#menu-responsive').width()+10;
		jQuery('#menu-responsive').animate({'right': '-'+right+'px'}, 800, 'easeInOutQuart');
	}



	/*---------------------------------------------- 
	 T A B S
	 ------------------------------------------------*/
	jQuery(".tabs").each(function(i) {
		jQuery(this).find('.tab-content').removeClass('active');
		var rel = jQuery(this).find('.active').attr('href');
		jQuery(this).find('.'+rel).addClass('active');
	});

	jQuery(".tab-nav").on("click", "a", function() {
		var parentdiv = jQuery(this).parent('li').parent('ul').parent('div');
		var rel = jQuery(this).attr('href');
		jQuery(parentdiv).find(".tab-nav a").removeClass("active");
		jQuery(this).addClass("active");
		jQuery(parentdiv).find(".tab-container .tab-content").hide().removeClass('active');
		jQuery(parentdiv).find(".tab-container ."+rel).fadeIn(500).addClass('active');
		return(false);
	});

	/*---------------------------------------------- 
	 T O G G L E  &  A C C O R D I O N
	 ------------------------------------------------*/
	jQuery(".toggle-item").each(function(i) {
		jQuery(this).find('.toggle-active').siblings('.toggle-inner').slideDown(300);
	});

	jQuery(".toggle-item").on("click", ".toggle-title", function() {

		var parentdiv = jQuery(this).parent('div').parent('div');
		var active = jQuery(this).parent('div').find('.toggle-inner').css('display');

		if (jQuery(parentdiv).attr('class') == 'accordion') {
			if (active !== 'none' ) {
				jQuery(parentdiv).find('.toggle-item .toggle-inner').slideUp(300);
				jQuery(this).toggleClass('toggle-active');
			} else {
				jQuery(parentdiv).find('.toggle-item .toggle-inner').slideUp(300);
				jQuery(parentdiv).find('.toggle-item .toggle-title').removeClass('toggle-active');

				jQuery(this).toggleClass('toggle-active');
				jQuery(this).siblings('.toggle-inner').slideDown(300);
			}
		} else {
			jQuery(this).toggleClass('toggle-active');
			jQuery(this).siblings('.toggle-inner').slideToggle(300);
		}

		return(false);
	});



	/*---------------------------------------------- 
	 O V E R L A Y I N F O   C E N T E R
	 ------------------------------------------------*/
	jQuery('.overlayinfo').each(function(){
		var infoHeight = parseInt(jQuery(this).height() / 2);
		jQuery(this).css({'marginTop': '-'+infoHeight+'px'});
	});

	/*---------------------------------------------- 
	 F I T   V I D E O S
	 ------------------------------------------------*/
	if(jQuery().fitVids) {
		jQuery("body").fitVids();
	}

	/*---------------------------------------------- 
	 P A R A L L A X
	 ------------------------------------------------*/
	if(jQuery().parallax) {
		jQuery('.parallax-section').parallax();
	}


	/*---------------------------------------------- 
	 V I D E O   B G
	 ------------------------------------------------*/
	if(jQuery().bgVideo) {
		setTimeout(function() {
			jQuery('.videobg-section').bgVideo();
		}, 1000);
	}

	smoothShow();

});


jQuery(window).scroll(function() {
	smoothShow();
});



// SMOOTH SHOW FUNCION FOR ELEMENTS THAT TAKE ACTION WHEN VISIBLE (counter & animations & skills)
function smoothShow() {
	/*---------------------------------------------- 
	 C O U N T E R
	 ------------------------------------------------*/
	jQuery('.counter-value').each(function() {
		if (jQuery(window).width() > 700) {
			var visible = jQuery(this).visible(false);
			if (jQuery(this).hasClass( "anim" )) {}
			else if (visible) {
				jQuery(this).addClass("anim");
				var from = parseInt(jQuery(this).attr('data-from'));
				var to = parseInt(jQuery(this).attr('data-to'));
				var speed = parseInt(jQuery(this).attr('data-speed'));
				jQuery(this).count(from, to, speed);
			}
		} else {
			var to = parseInt(jQuery(this).attr('data-to'));
			jQuery(this).html(to);
		}
	});

	/*---------------------------------------------- 
	 G E N E R A L   A N I M A T I O N S
	 ------------------------------------------------*/
	jQuery('.sr-animation').each(function() {
		if (jQuery(window).width() > 700) {
			var visible = jQuery(this).visible(true);
			var delay = jQuery(this).attr("data-delay");
			if (!delay) { delay = 0; }
			if (jQuery(this).hasClass( "animated" )) {}
			else if (visible) {
				jQuery(this).delay(delay).queue(function(){jQuery(this).addClass('animated')});
			}
		} else {
			jQuery(this).addClass('animated');
		}
	});

	/*---------------------------------------------- 
	 S K I L L   A N I M A T I O N
	 ------------------------------------------------*/
	jQuery('.skill').each(function() {
		var visible = jQuery(this).visible(true);
		var percent = jQuery(this).find('.skill-bar .skill-active ').attr('data-perc');
		if (jQuery(this).hasClass( "anim" )) {}
		else if (visible) {
			var randomval = Math.floor(Math.random() * (300 - 50 + 1)) + 50;
			jQuery(this).addClass("anim");
			jQuery(this).find('.skill-bar .skill-active ').animate({'width': percent+'%',}, 2000, 'easeInOutQuart', function(){
				jQuery(this).find('.tooltip').delay(randomval).animate({'top':'-28px','opacity':1}, 500);
			}).css('overflow', 'visible');
		}
	});

}

// FLEXSLIDER INIT FUNCTION BECAUSE IT ALSO HAS TO BE REINITIALISED AFTER A PORTFOLIO ITEM IS LOADED
/*----------------------------------------------
 F L E X S L I D E R
 ------------------------------------------------*/
$(window).resize(function() {
	$('#slider .flexslider').height($(window).height() - 100);
});

$(window).trigger('resize');

function flexInit(el) {
	if(jQuery().flexslider) {
		jQuery(el+" .flexslider").flexslider({
			animation: "slide",
			slideshowSpeed: 7000,
			animationDuration: 1000,
			slideshow: false,
			directionNav: true,
			controlNav: false,
			smoothHeight: false,
			touch: true,
			video: true,
			randomize: false
		});
	}
}



jQuery(function($) {

	$(function() {
		$('#horizon_booking').booking({
			checkInSelector: '#checkin_date2',
			checkOutSelector: '#checkout_date2',
			adultSelector: '#adult2',
			childSelector: '#child2',
			roomSelector: '#room2',
			codeSelector: '#accesscode2',
			submitSelector: '#submit2',
			propertyId: '454',
		});
		$('#vertical_booking').booking({
			checkInSelector: '#checkin_date3',
			checkOutSelector: '#checkout_date3',
			adultSelector: '#adult3',
			childSelector: '#child3',
			roomSelector: '#room3',
			codeSelector: '#accesscode3',
			submitSelector: '#submit3',
			propertyId: '454',
		});
		$('input.styler, select.styler').styler({
			selectSearch: true
		});
	});
});

// ---------------------------------------------------------
// !!!!!!!!!!!!!!!!!document ready!!!!!!!!!!!!!!!!!!!!!!!!!!
// ---------------------------------------------------------

$(document).ready(function($) {
	/*----------------------------------------------
	 R E V O L U T I O N   S L I D E R
	 ------------------------------------------------*/
	if(jQuery().revolution) {
		$container = jQuery(this);
		var type = jQuery('.home-slider').data('type');
		jQuery('.home-slider').revolution({
			sliderType:type,
			sliderLayout:"auto",
			gridwidth : 1900,
			gridheight : 900,
			spinner: "spinner3",
			disableProgressBar:'on',
			startDelay: 0,
			parallax:{
				type:"mouse+scroll",
				levels:[5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85],
				origo:"enterpoint",
				speed:400,
				bgparallax:"off",
				disable_onmobile:"off"
			},
			touch:{
				touchenabled:"on",
				swipe_treshold : 75,
				swipe_min_touches : 1,
				drag_block_vertical:false,
				swipe_direction:"horizontal"
			},
			navigation : {
				keyboardNavigation:"on",
				keyboard_direction:"horizontal",
				mouseScrollNavigation:"off",
				onHoverStop:"on",
				touch:{
					touchenabled:"off",
					swipe_treshold : 75,
					swipe_min_touches : 1,
					drag_block_vertical:false,
					swipe_direction:"horizontal"
				},
				arrows: {
					style:"",
					enable:true,
					rtl:false,
					hide_onmobile:false,
					hide_onleave:false,
					hide_delay:200,
					hide_delay_mobile:1200,
					hide_under:1,
					hide_over:9999,
					tmp:'',
					left : {
						container:"slider",
						h_align:"left",
						v_align:"center",
						h_offset:20,
						v_offset:0,
					},
					right : {
						container:"slider",
						h_align:"right",
						v_align:"center",
						h_offset:20,
						v_offset:0
					}
				}
			},



		});
	}
	revapi = jQuery("#inner_header_slider").revolution({
		sliderType:"standard",
		sliderLayout:"auto",
		gridwidth:1230,
		gridheight:720,
		parallax:{
			type:"mouse+scroll",
			levels:[5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85],
			origo:"enterpoint",
			speed:400,
			bgparallax:"off",
			disable_onmobile:"off"
		},

		touch:{
			touchenabled:"on",
			swipe_treshold : 75,
			swipe_min_touches : 1,
			drag_block_vertical:false,
			swipe_direction:"horizontal"
		},
	});

	$('#flexslider-carousel').owlCarousel({
		loop:true,
		margin:10,
		nav:true,
		responsiveClass:false,
		responsive:{
			0:{
				items:1,
			},
			998:{
				items:2,
			},
			1100:{
				items:3,
			}
		}
	})
	$('#special-carousel').owlCarousel({
		loop:true,
		margin:10,
		nav:true,
		autoPlay:true,
		responsiveClass:false,
		stopOnHover:true,
		responsive:{
			0:{
				items:2,
			},
			768:{
				items:3,
			},
			1100:{
				items:4,
			}
		}
	})
	$(window).resize(function() {
		setTimeout();
	});
	setTimeout(function(){

		var top = $('#home').outerHeight(true);
		var bottom = $('footer').outerHeight(true);
		var headerheight = jQuery('header').height();
		if (jQuery('#home').length < 1){
			var top = 0;
		}
		if (jQuery( window ).width() > 448) {
			if(jQuery('#landing-nav').length < 1){
				$('#header').affix({
					offset: {
						top: top,
						bottom: bottom - headerheight
					}
				});
				$('#header').on('affixed-bottom.bs.affix', function(){
					jQuery(this).css({ 'top': '0px'});
				});
			}
			$('#landing-nav').affix({
				// Set start offset
				offset: {
					top: function () {
						return (this.top = $('#landing-nav').offset().top)
					},
					bottom: bottom
				}
			})
			$('.at4-share-outer-right').affix({
				// Set start offset
				offset: {
					bottom: bottom
				}
			})

			$('#horizon_booking').affix({
				offset: {
					top: top+headerheight,
					bottom: bottom
				}
			});
		
		}
		if (jQuery( window ).width() > 768) {
			$('#horizon_booking').affix({
				offset: {
					top: top+headerheight,
					bottom: bottom
				}
			});

		}

		if (jQuery('#sidebar').length > 0){
			var aside = $('#sidebar'),
				margintop = $('#header').height(),
				sidebartop = $(aside).offset().top - margintop,
				width = $(aside).outerWidth(),
				bottom = $('#page-content').outerHeight() - $('#main-block').offset().top - $('#main-block').outerHeight(),
				right =  aside.offsetParent().width() - aside.outerWidth() - aside.position().left;

			$(aside).css({ 'right': right +'px', 'top': margintop + 'px', 'width': width + 'px' });
			if (jQuery(window).width() > 767) {
				$(aside).affix({
					offset: {
						top:sidebartop,
						bottom:  bottom
					}
				});
				$(aside).on('affix.bs.affix', function(){
					jQuery(this).css({ 'right': right +'px', 'top': margintop + 'px', 'width': width + 'px' });
				});
				$(aside).on('affixed-top.bs.affix', function(){
					jQuery(this).removeAttr('style');
				});

			}
			else
			{
				$(aside).affix({
					offset: {
						top: function () {
							return (this.top = $('#sidebar').offset().top - margintop)
						},
						bottom: bottom
					}
				});

			}

		}



		$('.input-group.date').datepicker({
			autoclose: true
		});

		jQuery('#CDSWIDSSP').css({ 'width': '100%' });
		jQuery('<div class="scroll-up" title="up"><a class="scroll-to" href="#page-content"><i class="fa fa-angle-up"></i></a></div>').insertBefore('#at4-scc');

		jQuery('.at-icon-wrapper').each(function(){
			jQuery(this).removeAttr('style');
		});
		jQuery('#at4-thankyou').remove()

	}, 2000);





});
jQuery('#show_me_map').click(function() {
	jQuery('#sections-contacts').css({ 'display': 'block' });
	google.maps.event.addDomListener(window, 'resize', init);
	google.maps.event.addDomListener(window, 'load', init);
});

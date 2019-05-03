/* Booking Function */
(function($) {
	"use strict";
	
    $.fn.booking = function( options ) {
        var settings = $.extend({
            checkInSelector: '#checkin_date',
            checkOutSelector: '#checkout_date',
            adultSelector: '#adult',
            childSelector: '#child',
            roomSelector: '#room',
            codeSelector: '#accesscode',
            submitSelector: '#submit',
            validateSelector: null,
            propertyId: '#property',
            onlineId: '4',
            language: null,
            beforeSubmit: function(){},
            afterSubmit: function(){},
			debug: false,
        }, options);

        var $this = $(this);
        var thisIndex = $this.index();
        var $checkIn = $this.find(settings.checkInSelector);
        var $checkOut = $this.find(settings.checkOutSelector);
        var $submit = $this.find(settings.submitSelector);
        var $validate = $this.find(settings.validateSelector);
        
        
        
        //Define property
        function propertyVal(raw) {
            if ( $.isNumeric(raw) === true ) {
                return raw;
            } else {
                return $this.find(raw).val();
            }
        }
        
        
        
        //Insert hidden field
        var alt_checkin_id = 'checkin_alt_val_'+thisIndex;
        var alt_checkout_id = 'checkout_alt_val_'+thisIndex;
        $checkIn.after('<input id="'+alt_checkin_id+'" type="hidden" />');
        $checkOut.after('<input id="'+alt_checkout_id+'" type="hidden" />');
        
        
        
        //Datepicker
        $checkIn.datepicker({
            minDate: new Date(),
            changeMonth: false,
            changeYear: false,
            dateFormat: 'dd M yy',
            altFormat: 'yy-mm-dd',
            altField: '#'+alt_checkin_id,
            numberOfMonths: 1,
            onClose: function (selectedDate) {
                onSelectedCheckinDate($checkOut, selectedDate);
            }
        });

        $checkOut.datepicker({
            minDate: '+1d',
            changeMonth: false,
            changeYear: false,
            dateFormat: 'dd M yy',
            altFormat: 'yy-mm-dd',
            altField: '#'+alt_checkout_id,
            numberOfMonths: 1,
            beforeShow: function (dateText, inst) {
                beforeShowCheckOutDate($checkIn, $checkOut, inst);
            }
        });
        
        
        
        //Set Date
        var today = new Date();
        var afterTomorrow = new Date(today.getTime() + 172800000); //2 days
        $checkIn.datepicker('setDate', today);
        $checkOut.datepicker('setDate', afterTomorrow);
        
        

        $submit.on('click', function(e) {
            e.preventDefault();

            var baseurl = 'https://reservation.travelanium.net/propertyibe2/rates?';
            var propertyIdParam = 'propertyId=';
            var onlineIdParam = 'onlineId=';
            var checkInParam = 'checkin=';
            var checkOutParam = 'checkout=';
            var adultParam = 'numofadult=';
            var childParam = 'numofchild=';
            var roomParam = 'numofroom=';
            var accesscodeParam = 'accesscode=';
            
            var propertyIdValue = propertyVal(settings.propertyId);
            var onlineIdValue = settings.onlineId;
            
            var languageParam = 'lang=';
            var language = settings.language;
            
            var checkInValue = $('#'+alt_checkin_id).val();
            var checkOutValue = $('#'+alt_checkout_id).val();
            var adultValue = $this.find(settings.adultSelector).val();
            var childValue = $this.find(settings.childSelector).val();
            var roomValue = $this.find(settings.roomSelector).val();
            var accesscodeValue = $this.find(settings.codeSelector).val();
            
            var redirectUrl = baseurl + propertyIdParam + propertyIdValue + "&" + onlineIdParam + onlineIdValue;
            
            redirectUrl += "&" + checkInParam + checkInValue;
            redirectUrl += "&" + checkOutParam + checkOutValue;
            
            if (language !== null) {
                redirectUrl += '&' + languageParam + language;
            }

            if (roomValue !== '') {
                redirectUrl += "&" + roomParam + roomValue;
            }

            if (adultValue !== '') {
                redirectUrl += "&" + adultParam + adultValue;
            }

            if (childValue !== '') {
                redirectUrl += "&" + childParam + childValue;
            }

            if (accesscodeValue !== '') {
                redirectUrl += "&" + accesscodeParam + accesscodeValue;
            }
            
            function gotoURL() {
				if( settings.debug === true ) {
					console.log(decorateGACrossDomainTracking(redirectUrl));
				} else {	
             		window.open(decorateGACrossDomainTracking(redirectUrl));
				}
            }
			
			$.beforeSubmit = settings.beforeSubmit;
            $.beforeSubmit();
            
            if($validate.length > 0) {
                $validate.each(function(i, e) {
                    var $elm = $this.find(e);

                    function errorAlert() {
                        $elm.addClass('error');
                        $elm.parent('.field').addClass('field-error');
                        return false;
                    }

                    function errorClear() {
                        $elm.removeClass('error');
                        $elm.parent('.field').removeClass('field-error');
                        gotoURL();
                    }

                    $elm.on('change', function() {
                        if($elm.val() === '') {
                            errorAlert();
                        } else {
                            errorClear();
                        }
                    });
                });
            } else {
                gotoURL();
            }
            
            $.afterSubmit = settings.afterSubmit;
            $.afterSubmit();
        });
    };



    // Initialize checkin and checkout date picker.
    function onSelectedCheckinDate(targetId, selectedDate) {
        if (selectedDate) {
            var tmpDate = new Date(selectedDate);
            var minCheckoutDateInMilliSecond = tmpDate.getTime() + 86400000;
            tmpDate = new Date(minCheckoutDateInMilliSecond);
            targetId.datepicker("option", "minDate", tmpDate);
            targetId.datepicker("show");
        }
    }



    // Initialize checkout picker.
    function beforeShowCheckOutDate(calendarCheckinId, calendarCheckoutId, inst) {
        var checkInDate = calendarCheckinId.val();
        var tmpDate = new Date();
        if (checkInDate) {
            tmpDate = new Date(checkInDate);
        }

        var minCheckoutDateInMilliSecond = tmpDate.getTime() + 86400000;
        tmpDate = new Date(minCheckoutDateInMilliSecond);
        calendarCheckoutId.datepicker("option", "minDate", tmpDate);
    }
    
    
    
    // Generate Google tracking script
    function decorateGACrossDomainTracking(url) {
        var output = url;
        try {
            if(!ga) return output;
            ga(function (tracker) {
                if(!tracker) return output;
                if(!tracker.get('linkerParam')) return output;
                var linker = new window.gaplugins.Linker(tracker);
                output = linker.decorate(url);
            });
        } catch (e) {
            console.log(e.message);
        }
        return output;
    }

})(jQuery);
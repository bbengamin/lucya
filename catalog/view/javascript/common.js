function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

$(document).ready(function() {
	
$('.back-slides-box').owlCarousel({
	items: 1,
	autoPlay: false,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="material-icons">navigate_before</i>', '<i class="material-icons">navigate_next</i>'],
	pagination: false
});
	  $('.owl-gallery').owlCarousel({
		    loop:true,
		    margin:10,
		    autoPlay: false,
		  	singleItem: false,
		  	navigation: true,
		  	navigationText: ['<i class="material-icons">navigate_before</i>', '<i class="material-icons">navigate_next</i>'],
		  	pagination: false
		});
	
	$('#reservation-form').on('submit',function(e) {
		e.preventDefault();
		var $form = $(this);
		$('.error').detach();
	    $.ajax({
			url: 'index.php?route=common/ajax/order',
			type: 'post',
			data: $('#reservation-form input'),
			dataType: 'json',
			success: function(json) {
				if (json['error']) {
					$.each(json['error'], function(key, val) {
						$form.find('[name="' + key + '"]').after('<span class="error">' + val + '</span>');
                    });
				}
				if (json['success']) {
					$('#reservation-form').hide();
					$('#reservation-form').next().show();
				}
			}
		});
		return false;
	});
	$('#banket-form').on('submit',function(e) {
		var $form = $(this);
		e.preventDefault();
		$('.error').detach();
	    $.ajax({
			url: 'index.php?route=common/ajax/banket',
			type: 'post',
			data: $('#banket-form input'),
			dataType: 'json',
			success: function(json) {
				if (json['error']) {
					$.each(json['error'], function(key, val) {
						$form.find('[name="' + key + '"]').after('<span class="error">' + val + '</span>');
                    });
				}
				if (json['success']) {
					$('#banket-form').hide();
					$('#banket-form').next().show();
				}
			}
		});
		return false;
	});
	
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('header input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('header input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-grid > .clearfix').remove();

		//$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');
		$('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		 localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}

	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
	
	//home-page-slired-1
	/*$('.home-page-slider').owlCarousel({
		items: 6,
		autoPlay: false,
		singleItem: true,
		navigation: true,
		navigationText: ['<i class="material-icons">navigate_before</i>', '<i class="material-icons">navigate_next</i>'],
		pagination: false
	});*/
	
	$('.date-pick-item').datepicker({
	    todayBtn: "linked",
	    language: "ru",
	    autoclose: true
	});
	
	$('.owl-gallery-no-slides a').hover(function(){ 
		$('.owl-gallery-no-slides a').addClass("hovered"); 
		$(this).removeClass("hovered"); 
	});
	$( ".owl-gallery-no-slides" ).mouseleave(function() {
	  $('.owl-gallery-no-slides a').removeClass("hovered"); 
	});
	
});

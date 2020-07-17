$(document).ready(function() {
    $('.slide_client').owlCarousel({
	    navigation:false,
	    pagination:true,
	    responsiveclass: true,
	    paginationNumbers: true,
	    margin:20,
	    auto:true,
	    responsive: {
		    0: {
			    items: 1,
			    nav: true
		    },
		    768: {
			    items: 3,
			    nav: true
		    },
		    1000: {
			    items: 4,
			    nav: true,
			    loop: true
		    }
	    }
    });
    var carousel_change = $("#slide_home");
	carousel_change.owlCarousel({
		loop:true,
		items : 2,
		singleItem:true,
		autoplay: true,
		autoplayTimeout: 5000,
		autoplaySpeed: 1000,
		margin:10,
		nav:true,
		navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
	});
	
	$('.cacmohinh').owlCarousel({
	    loop:true,
		items : 3,
		singleItem:true,
		autoplay: true,
		margin:10,
		autoplayTimeout: 5000,
		autoplaySpeed: 1000,
		nav:true,
		navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    });
    
});
$(window).resize(function() {
resizePanel();
});
/**
*
*/

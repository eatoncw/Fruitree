var flashFade = function() {
	$('.alert').fadeOut(8000);
};

var highlightComments = function() {
	$('.comments').mouseenter(function() {
		$(this).addClass("comments-highlight");
		$( this ).find(".flag").addClass("flag-show");
	});
	$('.comments').mouseleave(function() {
		$(this).removeClass("comments-highlight");
		$( this ).find(".flag").removeClass("flag-show");
	});
};

var rated = function() {
	$('.rated').raty( { path: '/assets',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
};


var searchButtonToggle = function() {
	$('.search-toggle').on('click', function() {
		if ($(this).closest(".search-form").find("input[type=text]").val().length < 1 ) {
			$(this).val('Go');
		} else if ($(this).val() === 'Go'){
			$(this).val('Reset');
		} else {
			$(this).val('Go');
		}
	});
}

var imageUpload = function() {
	$(".image-upload").on('change', function() {
		readURL(this);
	});
}



$(document).on('turbolinks:load', function () {
	flashFade();
	highlightComments();
	$('[data-toggle="tooltip"]').tooltip({'placement': 'top'});
	
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' } );
	
	rated();
	searchButtonToggle();
	//imageUpload();

	$(".img-zoom").elevateZoom({
		zoomType: "lens",
		lensShape: "round",
		lensSize: 200,
		responsive: true
	});

	//function readURL(input) {
		//if (input.files && input.files[0]) {
			//var reader = new FileReader();
			//console.log(reader);

			//reader.onload = function (e) {
				//$('#product-preview').attr('src', e.target.result);
				//$('.photo-preview').css('background', 'url(' + e.target.result + ')');
				//reader.readAsDataURL(input.files[0]);
			//}
		//}
	//}

	
});
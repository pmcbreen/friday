// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/* cannot pass params to setTimer functions, so have to do it this way */

function preview_offering() {
	preview_item('#offering_long_desc');
}


function preview_item(src) {
	var converter = new Showdown.converter();
	
	var text = $(src).val();
	var html = converter.makeHtml(text);
	$('#preview').empty();
	$('<div/>').html(html).appendTo('#preview');
}

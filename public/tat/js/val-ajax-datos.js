$(document).ready(function(){

	
});
$(document).on('click','#alert-datos',function(e){
	$('.ajax-val-datos').html('<p class="alert alert-danger">Por favor Inicia sesión o registrate</p>');
	e.preventDefault();
});
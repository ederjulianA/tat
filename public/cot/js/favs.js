$(document).ready(function(){
		
	
	
});

$(document).on('click','.noFav',function(e){
	var id = $(this).attr('data');
		alert(id);
	e.preventdefault();
});
 
$(document).on('click','.noSes',function(e){
	
	notie.alert(3, 'Inicie sesión para agregar favoritos', 2);
	e.preventdefault();
});
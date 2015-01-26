$(document).on('keyup','#titulo', function(){
	var nombre = $('#titulo').val();
	var seo = nombre.toLowerCase().replace(/ +/g,'-').replace(/[ñ]/g,'n').replace(/['àáâãäåÁ']/g,'a').replace(/['èéêëÉ']/g,'e').replace(/['ìíîïÍ']/g,'i').replace(/['òóôõöÓ']/g,'o').replace(/['ùúûüÚ']/g,'u').replace(/[^a-z0-9-_]/g,'').trim();
	$('#titulo').val(seo);
	console.log(seo);

});
$(document).ready(function(){



});

$(document).on('click','#btnNewUser',function(e){
	var form 		= $('#FormNewUser');
	var nombre 		= $('#nombre').val();
	var apellido 	= $('#apellido').val();
	var nit 		= $('#nit').val();
	var telefono 	= $('#telefono').val();
	var direccion 	= $('#direccion').val();
	var email 		= $('#email').val();
	var password 	= $('#password').val();
	//alert(nombre+'-'+apellido+'-'+nit+'-'+telefono+'-'+direccion+'-'+email);
	return false;

});

$(document).on('change','#nit',function(e){

	var nit 		= $('#nit').val();
	$.ajax({
			url : 'http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/USER/GetNit.php',
			dataType: "json",
			type : "post",
			data : { NitIde : nit},
			success : function(data){
				console.log(data);
				if(data.est == '')
				{
					//alert("Nit valido");
					$('#nit').removeClass("errorE");
				}else{
					swal("Ya existe la cedula", "La cedula :"+nit+" ya esta registrada ", "error")
					$('#nit').addClass("errorE");
					var html = '<p class="alert alert-danger">:message</p>';
					$('#nit').append(html);
					$('#nit').focus();
					return false;

				}
				
			},error : function(data){
				
				console.log(data);
				
				
				}


				


		});
	e.preventdefault(e);
});
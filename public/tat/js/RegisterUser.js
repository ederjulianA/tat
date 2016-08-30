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
	var valN = valNit(nit);
	if( valN == 1)
	{
		notie.alert(3, 'Error en el formulario', 2);
		return false;
		$('#ajaxNit').text("El número de cedula ya se encuentra registrada");
		return false;
	}else{
		$('#ajaxNit').text("");

	}
	 var valMail = valMai(email);
	 if( valMail == 1)
	{
		notie.alert(3, 'Error en el formulario', 2);
		
		$('#ajaxEmail').text("El email ya se encuentra registrado");
		return false;
	}else{
		$('#ajaxEmail').text("");

	}
	var sumVal = 0;
	sumVal = valN + valMail;
	if (sumVal == 0){
	 //alert("email"+valMail);
	 //form.submit();
	 saveUser();
	}
	return false;

});

$(document).on('change','#nit',function(e){

	var nit 		= $('#nit').val();
	$.ajax({
			//url : 'http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/USER/GetNit.php',
			url : 'http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/USER/GetNit.php',
			dataType: "json",
			type : "post",
			data : { NitIde : nit},
			success : function(data){
				console.log(data);
				if(data.est == '')
				{
					//alert("Nit valido");
					$('#nit').removeClass("errorE");

					$('#ajaxNit').text("");
				}else{
					swal("Ya existe la cedula", "La cedula :"+nit+" ya esta registrada ", "error")
					$('#nit').addClass("errorE");
					var html = '<p class="alert alert-danger">:message</p>';
					$('#nit').append(html);
					$('#ajaxNit').text("El número de cedula ya se encuentra registrada");
					$('#nit').focus();
					return false;

				}
				
			},error : function(data){
				
				console.log(data);
				
				
				}


				


		});
	e.preventdefault(e);
});

function saveUser()
{
	var form 		= $('#FormNewUser');
	var nombre 		= $('#nombre').val();
	var apellido 	= $('#apellido').val();
	var nit 		= $('#nit').val();
	var telefono 	= $('#telefono').val();
	var direccion 	= $('#direccion').val();
	var email 		= $('#email').val();
	var password 	= $('#password').val();

	$.ajax({
			url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/USER/newUser.php",
			dataType: "json",
			type : "get",
			data  : { nombre:nombre, apellido:apellido, nit:nit, telefono:telefono, direccion:direccion, email:email, password:password},
			success : function(data){
				console.log(data);

				if(data.estado == 1)
				{
					//saveUserStore();
					form.submit();
				}else{
					console.log("error");
				}
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}
function valNit(nit)
{
	var c = 0;
	$.ajax({
			//url : 'http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/USER/GetNit.php',
			url : 'http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/USER/GetNit.php',
			dataType: "json",
			type : "post",
			async: false,
			data : { NitIde : nit},
			success : function(data){
				console.log(data);
				if(data.est == '')
				{
					
					//alert("Nit valido");
					$('#nit').removeClass("errorE");
				}else{
					//swal("Ya existe la cedula", "La cedula :"+nit+" ya esta registrada ", "error")
					//$('#nit').addClass("errorE");
					//var html = '<p class="alert alert-danger">:message</p>';
					//$('#nit').append(html);
					//$('#nit').focus();
					
					c = 1;

				}
				
			},error : function(data){
				
				console.log(data);
				
				
				}


				


		});
	
	return c;
}

function valMai(email)
{
	var c = 0;
	var url = $('#urlValMail').val();
	$.ajax({
			url : url,
			dataType: "json",
			type : "post",
			async: false,
			data : { email : email},
			success : function(data){
				console.log(data);
				if(data.estado.estado == '2')
				{
					
					//alert("Nit valido");
					$('#email').removeClass("errorE");
				}else{
					
					$('#email').addClass("errorE");
					c = 1;

				}
				
			},error : function(data){
				
				console.log(data);
				
				
				}


				


		});
	
	
	return c;
}
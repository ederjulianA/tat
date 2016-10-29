$(document).ready(function(){



});

$(document).on('click','#btnNewUser2',function(e){
	$("#_nombre, #_apellido, #_apellido, #_NitSec, #_telefono, #_selDep, #_selCiu, #_direccion, #_email, #_password, #_password_rep, #_terminos").html("");
	var url = $('#newUserAjax').val();
	$.ajax({
			url : url,
			dataType: "json",
			type : "post",
			async: true,
			data : $('#FormNewUser').serialize(),
			success : function(data){
				console.log(data);
				if (data.success == false)
				{
					notie.alert(3, 'Errores en el formulario', 4);
					$.each(data.errors, function(index,value){
						$("#_"+index).html("<p class='alert alert-danger'>"+value+"</p>");
					});
				}else{
					saveUser()
				}

				

			},error : function(data){
				
				console.log(data);
				
				
				}
		});
	e.preventDefault();
});

/*$(document).on('click','#btnNewUser2',function(e){
	e.preventdefault();
	alert("New User 2");
	var url = $('#newUserAjax').val();
	$.ajax({
			url : url,
			dataType: "json",
			type : "post",
			async: true,
			data : $('#FormNewUser').serialize(),
			success : function(data){
				console.log(data);
				

			},error : function(data){
				
				console.log(data);
				
				
				}
		});
	

	return false; 
});*/

$(document).on('click','#btnNewUser',function(e){
	var form 					= $('#FormNewUser');
	var nombre 					= $('#nombre').val();
	var apellido 				= $('#apellido').val();
	var nit 					= $('#nit').val();
	var telefono 				= $('#telefono').val();
	var direccion 				= $('#direccion').val();
	var email 					= $('#email').val();
	var password 				= $('#password').val();
	var password_confirmation 	= $('#password_rep').val();
	//alert(nombre+'-'+apellido+'-'+nit+'-'+telefono+'-'+direccion+'-'+email);
	if (nombre == "")
	{
		notie.alert(3, 'Ingrese un nombre valido', 4);
		$('#nombre').addClass("errorE");
		return false;
	}else{
		$('#nombre').removeClass("errorE");
	}
	if (apellido == "")
	{
		notie.alert(3, 'Ingrese un apellido valido', 4);
		$('#apellido').addClass("errorE");
		return false;
	}else{
		$('#apellido').removeClass("errorE");
	}
	if (nit == "")
	{
		notie.alert(3, 'Ingrese una cedula valida', 4);
		$('#nit').addClass("errorE");
		return false;
	}else{
		$('#nit').removeClass("errorE");
	}
	if (email == "")
	{
		notie.alert(3, 'Ingrese un email valido', 4);
		$('#email').addClass("errorE");
		return false;
	}else{
		$('#email').removeClass("errorE");
	}
	if (password == "" || password_confirmation == "")
	{
		notie.alert(3, 'Ingrese una contraseña valida', 4);
		$('#password').addClass("errorE");
		return false;
	}else{
		if(password != password_confirmation){
			notie.alert(2, 'Las contraseñas no coinciden', 4);
			$('#password_confirmation').addClass("errorE");
			return false;	
		}
		
	}
	var valN = valNit(nit);
	if( valN == 1)
	{
		alert("hola");
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
	e.preventdefault();

});

$(document).on('change','#nit',function(e){

	var nit 		= $('#nit').val();
	$.ajax({
			url : 'http://190.156.239.253:8086/websomic/EDER/TV8/USER/GetNit.php',
			//url : 'http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/USER/GetNit.php',
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
	//e.preventdefault(e);
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
	var ciucod      = $('#selCiu').val();
	var depcod      = $('#selDep').val();
	var url2        = $('#urlValDatos').val();

	$.ajax({
			//url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/USER/newUser.php",
			url   : "http://190.156.239.253:8086/websomic/EDER/TV8/USER/newUser.php",
			dataType: "json",
			type : "get",
			data  : { nombre:nombre, apellido:apellido, nit:nit, telefono:telefono, direccion:direccion, email:email, password:password,ciucod:ciucod,depcod:depcod},
			//data : $('#FormNewUser').serialize(),
			success : function(data){
				console.log(data);

				if(data.estado == 1)
				{
					notie.alert(1, 'Usuario Creado', 4);
					location.reload();
					//saveUserStore();
					//form.submit();
				}else{
					console.log("error guardando");
					notie.alert(3, 'Error creando usuario', 4);
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
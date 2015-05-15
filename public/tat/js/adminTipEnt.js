$(document).ready(function(){
	
});

$( "#formTipEnv" ).on( "submit", function(e) {
 	var form=$("#formTipEnv");

 		$.ajax({

			url: form.attr('action'),
	        data: form.serialize(),
	         type: form.attr('method'),
	            beforeSend: function(){
	            	$('.before').append('<h3>Creando...</h3>');
	            },
	            complete: function(data){
	            	
	            },
				success : function(data){
								

					$('.before').hide();
					$('.errors_form').html('');
					$('.success_message').hide().html('');
	            	if(data.success == false){
		            	var errores = '';
		            	for(datos in data.errors){
		            		errores += '<small class="error">' + data.errors[datos] + '</small> <br>';
		            	}
		            	$('.errors_form').html(errores)
		            }else{
		            	$(form)[0].reset();//limpiamos el formulario
		            	var n_valor		= data.envio.valor.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		            	var n_tipo = ' <tr id="fila-'+data.envio.id+'"><td>'+data.envio.id+'</td><td>'+data.envio.nom_metodo+'</td><td>'+data.envio.tiempo_entrega+'</td><td>'+n_valor+'</td></td> '
		            	$('#con-tipent').append(n_tipo);
		            	$('.success_message').show().html(data.message);
		            	console.log(data);
		            }

				
				}

		});

e.preventDefault();

});

$(document).on("click",'.tipos', function(e){
	e.preventDefault();
	var url = $('#urlTipEnvDelete').val();
	var idtipent = $(this).attr('href');
		$.ajax({

			url: url,
	        data: {idtipent:idtipent},
	        dataType: "json",
	        type: "post",
	            beforeSend: function(){
	            	$('.before').append('<h3>Eliminando...</h3>');
	            },
	            complete: function(data){
	            	$('.before').html('');
	            },
			success : function(data){
								
					if(data.success === true)
					{
						$('#fila-'+idtipent).hide();
						$('.success_message').show().html(data.message);
					}
					

				
				}

		});
	
});


//
$(document).on("click",".fa-sort-desc", function(e){
	var id = $(this).attr('id');

	$('#'+id).removeClass('fa-sort-desc');
	$('#'+id).addClass('fa-sort-up');
});


$(document).on("click",".fa-sort-up", function(e){
	var id = $(this).attr('id');

	$('#'+id).removeClass('fa-sort-up');
	$('#'+id).addClass('fa-sort-desc');
});


//FUNCIÓN PARA ELIMINAR UNA PROMOCIÓN

$(document).on("click",'#btnDeletePromo', function(e){
	

	var idPromo = $(this).attr('href');
	$('#idPromo').val(idPromo);


	$('#ModalDelPromo').modal('show');
				

	
	e.preventDefault();
});

$(document).on("click","#confDelete", function(e){
	$('#ModalDelPromo').modal('show');
				$.ajax({

			url: form.attr('action'),
	        data: form.serialize(),
	         type: form.attr('method'),
	            beforeSend: function(){
	            	$('.before').append('<h3>Eliminando...</h3>');
	            },
	            complete: function(data){
	            	
	            },
				success : function(data){
								

					

				
				}

		});
});







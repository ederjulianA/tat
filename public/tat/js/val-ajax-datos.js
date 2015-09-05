$(document).ready(function(){
	
	loadEnvios();
	
});
$(document).on('click','#alert-datos',function(e){
	$('.ajax-val-datos').html('<p class="alert alert-danger">Por favor Inicia sesión o registrate</p>');
	e.preventDefault();
});


//FUNCION PARA CARGAR LOS BARRIOS ASOCIADOS A UNA CIUDAD

$(document).on('change','#ciudad_id',function(e){
	var id_ciudad = $('#ciudad_id').val();
	

	loadBarrios(id_ciudad);
});



//FUNCIONES 

function loadBarrios(id_ciudad)
{
	var url = $('#urlBarriosAjax').val();
	//var id_ciudad = id_ciudad;
	$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data : { id_ciudad : id_ciudad},
			success : function(data){

				if(data.estado.estado == 1)
				{
					if(data.num_bar == 0)
					{
						//alert("NO HAY BARRIOS!");

						//$('#barrio_id').html('');
						var barriosOpt = "<option value='0'>No hay barrios</option>";
						$('#barrio_id').append(barriosOpt);

					}
					//console.log(data);
					$('#barrio_id').html('');

					for (var i in data.barrios){
							//console.log("dia:"+data.diasv[i].id);
						
							var barriosOpt = "<option value='"+data.barrios[i].id+"'> "+data.barrios[i].bar_nom+"</option>";
							$('#barrio_id').append(barriosOpt);

					}
				}
				
					if(data.num_bar != 0){
						cargarDias();
					}
			}

				


		});
}

	function loadEnvios()
{
	var url = $('#urlEnvAjax').val();
			
			$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data : { },
			success : function(data){

				if(data.estado.estado == 1)
				{
					console.log(data);
					$('#slc_envio').html('');

					for (var i in data.envios){
							//console.log("dia:"+data.diasv[i].id);
						
							var enviosOpt = "<option value='"+data.envios[i].id+"'> "+data.envios[i].nom_metodo+"---"+data.envios[i].tiempo_entrega+"</option>";
							$('#slc_envio').append(enviosOpt);

					}
				}
				
				
			}

				


		});
}

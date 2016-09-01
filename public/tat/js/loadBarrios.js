$(document).ready(function(){

	loadEnvios();
	loadDep();
});
$(document).on('change','#ciudad_id',function(e){
	var id_ciudad = $('#ciudad_id').val();
	

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
});

$(document).on('change','#selDep', function(e){
	$('#selCiu').html('');
	var id = $('#selDep').val();
	$.ajax({
			url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getCiudadesById.php",
			dataType: "json",
			type : "get",
			data : {id:id},
			success : function(data){
				console.log(data);
				var barriosOpt ='<option data-tokens="" value="0">Escoja una ciudad</option>';
				$('#selCiu').append(barriosOpt);
				for (var i  in data) {
					 barriosOpt ="<option value='"+data[i].CiuCod+"' data-tokens='"+data[i].CiuNom+"' > "+data[i].CiuNom+"</option>";
							$('#selCiu').append(barriosOpt);
				}
				$('#selCiu').selectpicker('refresh');
				//guardar(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}
		});

	
});

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

function loadDep()
{
	$.ajax({
			url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getDepartamentos.php",
			dataType: "json",
			type : "get",
			
			success : function(data){
				console.log(data);
				var barriosOpt ='<option data-tokens="" value="0">Escoja una opción</option>';
				$('#selDep').append(barriosOpt);
				for (var i  in data) {
					 barriosOpt ="<option value='"+data[i].DepCod+"' data-tokens='"+data[i].DepNom+"' > "+data[i].DepNom+"</option>";
							$('#selDep').append(barriosOpt);
				}
				$('#selDep').selectpicker('refresh');
				//guardar(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}
		});
}



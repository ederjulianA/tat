$(document).ready(function () { $("#input").cleditor(); });

$(document).on('change','.conf', function(e){

		var id = $(this).attr('data');


		var c = $('#conf-'+id).prop('checked');
		//var c = $('#conf-'+id).attr('checked')?true:false;


		//alert(c);


		if(c == false)
		{
			//alert("false");
				$.ajax({

			url : "../confAjaxf",
			dataType: "json",
			type : "post",
			data : { id_pedido : id},
			success : function(data){
				//console.log(data);
				if(data.estado.estado == 1)
				{
					//alert(data.compra.conf);
					$('#est-'+id).removeClass('label-info');
						$('#est-'+id).addClass('label-danger');
						$('#-'+id).prop('checked',false);
						$('#est-'+id).text('Pendiente de Confirmación');
					//console.log(data);
				}
				
			}

				


		});
		}

		
		if(c == true)
		{


		$.ajax({

			url : "../confAjax",
			dataType: "json",
			type : "post",
			data : { id_pedido : id, c:c},
			success : function(data){
				//console.log(data);
				if(data.estado.estado == 1)
				{
					if(data.compra.conf == 1)
					{
						$('#est-'+id).removeClass('label-danger');
						$('#est-'+id).addClass('label-info');
						$('#conf-'+id).prop('checked',true);
						$('#est-'+id).text('Confirmado');
					}
					
					//console.log(data);
				}
				
			}

				


		});
		}

		e.preventDefault();
});



$(document).on('change','.cA', function(e){

		var id = $(this).attr('data');


		var c = $('#conf-'+id).prop('checked');

		alert(c);

		

		$.ajax({

			url : "../confAjax",
			dataType: "json",
			type : "post",
			data : { id_pedido : id, c:c},
			success : function(data){
				console.log(data);
				if(data.estado.estado == 1)
				{
					
				}
				
			}

				


		});

		e.preventDefault();

});

$(document).on('click','#btn-editar',function(e){
	var cont = $('#input').val();
	var id  = $('#id_prod').val();

	$('#btn-editar').text('Guardando cambios...');

		$.ajax({

			url : "../../addDescriptionAjax",
			dataType: "json",
			type : "post",
			data : { cont : cont, id:id},
			success : function(data){
				console.log(data);
				if(data.estado.estado == 1)
				{
					$('#btn-editar').text('Guardar Cambios');
					$('.ajaxR').fadeToggle(2000);
					$('.ajaxR').fadeToggle('slow');

					
				}
				
			}

				


		});
	//alert(cant);
	e.preventDefault();
});

//FUNCIÓN PARA BORRAR TODOS LOS DIAS DE VISITAS ASIGNADOS

$(document).on('click','#btn_borrar_dias', function(e){
	$('#ModalEliminar').modal({
						show:true,
						keyboard:false
					});

	e.preventDefault();
});

$(document).on('click','#btn_conf_eli', function(e){

		$.ajax({

			url : "../confEliDiasV",
			dataType: "json",
			type : "post",
			
			success : function(data){
				//console.log(data);
				if(data.estado.estado == 1)
				{
					
					location.reload();
					//console.log(data);
				}
				
			}

				


		});

	e.preventDefault();
});



//FUNCIÓN PARA DESMARCAR UN DIA DE VISITA
$(document).on('change','.Dia', function(e){

		var id_dia = $(this).attr('data');
		var id_barrio = $(this).attr('dataBarrio');
		//alert(id_dia+'---'+id_barrio);

		$.ajax({

			url : "../barrioAjax",
			dataType: "json",
			type : "post",
			data : { id_dia : id_dia, id_barrio:id_barrio},
			success : function(data){
				console.log(data);
				if(data.estado.estado == 1)
				{
					console.log(data);
					$('#dia-'+id_dia+'-'+id_barrio).removeClass('Dia');
					$('#dia-'+id_dia+'-'+id_barrio).addClass('noDia');
				}
				
			}

				


		});
		e.preventDefault();
});

//FUNCIÓN PARA DESMARCAR UN DIA DE VISITA
$(document).on('change','.noDia', function(e){

		var id_dia = $(this).attr('data');
		var id_barrio = $(this).attr('dataBarrio');
		//alert(id_dia+'---'+id_barrio);

		$.ajax({

			url : "../barrioAjaxNo",
			dataType: "json",
			type : "post",
			data : { id_dia : id_dia, id_barrio:id_barrio},
			success : function(data){
				
				if(data.estado.estado == 1)
				{
					console.log(data);
					$('#dia-'+id_dia+'-'+id_barrio).removeClass('noDia');
					$('#dia-'+id_dia+'-'+id_barrio).addClass('Dia');
				}
				
			}

				


		});
		e.preventDefault();
});

//FUNCIÓN PARA BUSCAR UN BARRIO VIA AJAX EN LA LISTA DE BARRIOS
$(document).on('click','#btn_b_barrio', function(e){

	var bar_nom = $('#bar_nom').val();
	$('#r_ajax').html('');
	$.ajax({

			url : "../barrioAjaxSearch",
			dataType: "json",
			type : "post",
			data : { bar_nom : bar_nom},
			success : function(data){
				
				if(data.estado.estado == 1)
				{
						if(data.num_bar == 0)
						{
							alert("NO HAY BARRIOS");
						}

						for (var i in data.bar)

						{
							var nBarrio = '<div class="barrioA"><div>'+data.bar[i].bar_nom+'<a class="btn btn-success Nbar" id="Nbar-'+data.bar[i].id+'" href="'+data.bar[i].id+'">Editar</a></div> </div>';

							$('#r_ajax').append(nBarrio);
						}
					
				}
				
			}

				


		});

	e.preventDefault();
});

$(document).on('click','.Nbar', function(e){
	alert("ONE");
	e.preventDefault();
})

$(document).on('change','#sel_ciudad', function(e){
	$('#contenedor_barrios').html('');
	var id_ciudad = $('#sel_ciudad').val();
	loadBarriosV(id_ciudad);

	e.preventDefault();
});

function loadBarriosV(id_ciudad)
{
	var url = $('#urlBarriosVajax').val();
	$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data : { id_ciudad : id_ciudad},
			success : function(data){

				if(data.estado.estado == 1)
				{
					for (j in data.d)
					{
						var check2 = ' <td><input class="Dia" data="1" id="dia-1-1" dataBarrio="1" checked="checked" name="Lunes" type="checkbox" value="1"> </td> ';
						
						
					};
					
					for( i in data.b)
					{
						
						var check = '<tr> <td id="col">'+data.b[i].bar_nom+'</td>'+check2+' </tr>';
						$('#contenedor_barrios').append(check);

						
						
					}
					console.log(data);
				}
				
					
			}

				


		});
}


//FUNCIÓN PEDIDO EN REPARTO

$(document).on('click','#btnReparto', function(e){

	var url = $('#urlReparto').val();
	var id_pedido = $('#pedido_id').val();

	$('#btnReparto').text('Confirmando...');


	$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data: {id_pedido: id_pedido},
			success : function(data){

				console.log(data);
				$('#btnReparto').text('Confirmado');
				$('#estadoP').removeClass('label-info');
				$('#estadoP').addClass('label-warning');
				$('#estadoP').text('En reparto');
				$('#btnReparto').fadeOut(1000);

				
			}

				


		});
	e.preventDefault();
});
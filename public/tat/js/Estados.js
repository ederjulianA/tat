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
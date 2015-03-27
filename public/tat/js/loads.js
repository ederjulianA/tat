$(document).ready(function(){
	
});

$(document).on('click','#loadProd',function(e){

	var url = $('#urlLoadProd').val();

	$('#modalAddItems').modal({
						show:true,
						keyboard:false
					});
	$( "#contenedor-prod-ajax" ).load( url );
	e.preventDefault();
});
//funcion que se encarga de agregar un nuevo item al pedido, via ajax
$(document).on('click','.itemP',function(e){
	var urlProd = $('#urlAddProd').val();
	var idArt = $(this).attr('data');
	var idPedido = $('#idPedido').val();

	

		$.ajax({

			url : urlProd,
			dataType: "json",
			type : "post",
			data : { idPedido : idPedido, idArt: idArt},
			success : function(data){
				console.log(data);

				 if(data.estado == 0)
				{
					console.log(data);
				}
				if(data.estado.estado == 1)
				{
					
					var n_iva = '';
					var n_cantidad 			= data.item.cantidad;
					var n_val_total			= data.item.valor_total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var n_num_items 		= data.pedido.num_items;
					var n_valor_unitario	= data.item.valor_unitario.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var n_total_compra		= data.pedido.total_compra.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					if(data.item.iva == null)
					{
						n_iva = '';
					}else{
						n_iva = data.item.iva;
					}
					
					var html = '';
						html +='<tr id="fila-prod-'+idArt+'">';
							html +='<td>'+data.item.id_producto+'</td>';
							html +='<td>'+data.item.nombre+'</td>';
							html +='<td id="can_pro-'+idArt+'">'+n_cantidad+'</td>';
							html +='<td>$'+n_valor_unitario+'</td>';
							html +='<td>'+n_iva+'</td>';
							html +='<td id="val_total-'+idArt+'">$'+n_val_total+'</td>';
							html +='<td><a href="'+idArt+'" title="" class="btn-eli-item" id="eliminar-'+idArt+'">Eliminar</a></td>';
						html +='</tr>';
					$('#modalAddItems').modal('hide');
					$('#contenedor-productos').append(html);
					$('#num_items').text(n_num_items);
					$('#total_compra').text(n_total_compra);
					
				}

				

				 if (data.estado.estado == 2)
				{
					
					var n_cantidad 		= data.item.cantidad;
					var n_val_total		= data.item.valor_total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var n_num_items 	= data.pedido.num_items;
					var n_total_compra	= data.pedido.total_compra.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('#can_pro-'+data.item.id_producto).text(n_cantidad);
					$('#val_total-'+data.item.id_producto).html('<p>$'+n_val_total+'</p>');
					$('#num_items').text(n_num_items);
					$('#total_compra').text(n_total_compra);
					$('#modalAddItems').modal('hide');
					//alert("SE ACTUALIZO PRODUCTO");
				}
				
				
			}

				


		});
	e.preventDefault();
});

//función para buscar productos por el nombre

$(document).on('change','#inputSearch', function(e){
	var url = $('#urlBuscarProd').val();
	var inputSearch = $('#inputSearch').val();
	$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data: {name: inputSearch},
			success : function(data){
				if(data.estado.estado == 1)
				{
					console.log(data);
					$('#contenedor-prod').html('');
					for (var i in data.productos)
					{
							if(data.productos[i].por_iva == null)
							{
								var n_iva = '';
							}else
							{
								var n_iva = data.productos[i].por_iva;
							}
							var n_precio			= data.productos[i].precio.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							var html = '';
							html +='<tr>';
							html +='<td>'+data.productos[i].id+'</td>';
							html +='<td>'+data.productos[i].pro_nom+'</td>';
							html +='<td>$'+n_precio+'</td>';
							html +='<td>'+n_iva+'</td>';
							html +='<td colspan="" rowspan="" headers=""><a href="#" class="itemP btn btn-info" id="itemP-'+data.productos[i].id+'" data="'+data.productos[i].id+'" title="">Agregar</a></td>';
						html +='</tr>';
						$('#contenedor-prod').append(html);
					}
					//console.log(data);
				}

				if(data.estado.estado == 2)
				{

					$('#contenedor-prod').html('');
					for (var i in data.productos)
					{
							if(data.productos[i].por_iva == null)
							{
								var n_iva = '';
							}else
							{
								var n_iva = data.productos[i].por_iva;
							}
							var n_precio			= data.productos[i].precio.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							var html = '';
							html +='<tr>';
							html +='<td>'+data.productos[i].id+'</td>';
							html +='<td>'+data.productos[i].pro_nom+'</td>';
							html +='<td>$'+n_precio+'</td>';
							html +='<td>'+n_iva+'</td>';
							html +='<td colspan="" rowspan="" headers=""><a href="#" class="itemP btn btn-info" id="itemP-'+data.productos[i].id+'" data="'+data.productos[i].id+'" title="">Agregar</a></td>';
						html +='</tr>';
						$('#contenedor-prod').append(html);
					}
					//console.log(data);
				}
				
				
			}

				


		});

}) ;

//funcion para eliminar un articulo del pedido
$(document).on('click','.btn-eli-item', function(e){
	var idArt = $(this).attr('href');
	var urlDeleteProd = $('#urlDeleteProd').val();
	var idPedido = $('#idPedido').val();

	//alert("idArt"+idArt);

			//LLAMADO AJAX

		$.ajax({

			url : urlDeleteProd,
			dataType: "json",
			type : "post",
			data : { idPedido : idPedido, idArt: idArt},
			success : function(data){
				
				if(data.estado.estado == 1){
					
					var n_num_items 		= data.pedido.num_items;
					
					var n_total_compra		= data.pedido.total_compra.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('#num_items').text(n_num_items);
					$('#total_compra').text(n_total_compra);
					$('#fila-prod-'+idArt).fadeOut(1200);
			}
		}

		});
	
	e.preventDefault();
});



//JSON##################################3


$(document).on('click','#loadProdApi',function(e){
	sync();
	e.preventDefault();
});


function sync()
{

	$.ajax({

			url : "http://www.tiendo.co/api/productos",
			dataType: "json",
			type : "get",
			
			success : function(data){
				console.log(data);
				guardar(data);
				
			}

				


		});
}

function guardar(data)
{
	var urlSync = $('#urlSync').val();
	$.ajax({

			url : urlSync,
			dataType: "json",
			type : "post",
			data: {data: data},
			success : function(data){

				console.log(data);
				
			}

				


		});
}
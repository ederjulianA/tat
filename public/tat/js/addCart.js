$(document).ready(function(){

	var id_ciudad = $('#ciudad_id').val();
	//loadBarrios(id_ciudad);
	cargarDias();


	$('#input-quantity').numeric();
	$('.input-quantity').numeric();

});

$(document).on('click','#btnPayu',function(e){

	
	var key = $('#code').val();
	
	var url = $('#UrlPedTem').val();
	var form = $('#formPayu');

	$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data : { key : key},
			success : function(data){
				if(data.estado.estado == 1)
				{
					console.log(data);
					form.submit();
					
				}
				
			},error : function(data){
				
				console.log(data);
				
				
				}


				


		});

	


	return false;
	
	
});







$(document).on('click','#btn_addCart', function(e){
	


	
	var id_pro 		= $('#id_producto').val();
	var cantidad 	= $('#input-quantity').val();
	var dis 		= $('#cant-dis').val();
	//alert(dis+'---'+cantidad);
	var tot 		= parseInt(dis-cantidad);
			 
	


	if( cantidad <= 0)
	{
		swal({   title: "Cantidad no valida!",   text: "Ingrese un valor valido",   timer: 2000,   showConfirmButton: false });
		return false;
	}else{
		if(parseInt(dis) < parseInt(cantidad))
		{
			swal("Cantidad no disponible.", "Unidades disponibles: "+dis);
		}else{

				$.ajax({


			url : "../addcartAjax",
			dataType: "json",
			type : "post",
			data : { id_producto : id_pro, cantidad:cantidad},
			success : function(data){

				if(data.estado.estado == 1)
				{
					var Ntotal = data.estado.totalCart.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('#ModalCart').modal({
						show:true,
						keyboard:false
					});
					if(data.producto.img == 'img/Mantis/def.png')
					{
						$('.info-item').html('<p>Has agregado a tu lista :'+data.producto.pro_nom+' <img src="/'+data.producto.img+'" height="120px" width="auto"></p><br><strong>Total del Pedido: $'+Ntotal+'</strong>')
					}else{
						$('.info-item').html('<p>Has agregado a tu lista :'+data.producto.pro_nom+' <img src="'+data.producto.img+'" height="120px" width="auto"></p><br><strong>Total del Pedido: $'+Ntotal+'</strong>')
					}
					//$('.info-item').html('<p>Has agregado a tu lista :'+data.producto.pro_nom+' <img src="/'+data.producto.img+'" height="120px" width="auto"></p><br><strong>Total del Pedido: $'+Ntotal+'</strong>')
					console.log(data);
				}
				
			}

				


		});
		}
		
	}
	

				/*$.ajax({

			url : "../addcartAjax",
			dataType: "json",
			type : "post",
			data : { id_producto : id_pro, cantidad:cantidad},
			success : function(data){
				if(data.estado.estado == 1)
				{
					var Ntotal = data.estado.totalCart.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('#ModalCart').modal({
						show:true,
						keyboard:false
					});
					$('.info-item').html('<p>Has agregado a tu lista :'+data.producto.pro_nom+' <img src="'+data.producto.img+'" height="120px" width="auto"></p><br><strong>Total del Pedido: $'+Ntotal+'</strong>')
					console.log(data);
				}
				
			}

				


		});*/
		//end ajax call


	//alert('id : '+id_pro+'Cantidad :'+cantidad);

	e.preventDefault();
});

$(document).on('click','#closeModal', function(e){

			location.reload();

		e.preventDefault();
});

$(document).on('change','#slc_envio', function(e){
	var env = $('#slc_envio').val();
	var totalCart = $('#totalCart').val();
		if(env == 0)
		{

			$('#slc_envio').addClass('select_error');
			$('#vlr_envio').text('');
			$('#msg-ajax').html('<p class="alert alert-danger"> Por favor escoja un metodo de envio valido</p>');
		}
		else if( env == 1)
		{
		
			var r_total = parseInt(totalCart) + parseInt("0");
			Ntotal = r_total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#slc_envio').removeClass('select_error');
			$('#slc_envio').addClass('select_ok');
			$('#vlr_envio').text('0');
			$('#vlr_envio_a').val('0');
			$('#totalP').text(Ntotal);
			$('#msg-ajax2').html('');
			$('#msg-ajax').html('<p class="alert alert-success"> El envio del pedido se hara segun las rutas de entrega dispuestas por TAT</p><P>Costo de entrega : $0</P>');
		}
		else if (env == 2)

		{	
			
			var r_total = parseInt(totalCart) + parseInt("5000");
			
			Ntotal = r_total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			$('#slc_envio').removeClass('select_error');
			$('#vlr_envio').text('5.000');
			$('#vlr_envio_a').val('5000');
			$('#slc_envio').addClass('select_ok');
			$('#totalP').text(Ntotal);
			$('#total_compra').val(r_total);
			$('#msg-ajax2').html('');
			$('#msg-ajax').html('<p class="alert alert-success"> El envio será entregado de forma inmediata por medio de un mensajero.</p><P>Costo de entrega : $5.000<br>Tiempo de entrega : 60 Minutos</P>');
		}
});


$(document).on('click','#alert-datos', function(e){

	$('#msg-ajax2').html('<p class="alert alert-danger"> Por favor actualiza tus datos</p>');
	e.preventDefault;
});
$(document).on('submit','#form-pedido', function(){
	var tipo = $('#slc_envio').val();

		if(tipo == 0)
		{
			$('#msg-ajax2').html('<p class="alert alert-danger"> Por favor escaja un Metodo de envio</p>');
			return false;
		}
		else
		{
			return true;
		}
});

$(document).on('change','#barrio_id', function(e){
			cargarDias();
			/*var barrio_id = $('#barrio_id').val();
			
			$.ajax({

			url : "/DiasAjax",
			dataType: "json",
			type : "post",
			data : { barrio_id : barrio_id},
			success : function(data){

				if(data.estado.estado == 1)
				{
					console.log(data);
					$('#nom_barrio').text(data.barrio.bar_nom);

					for (var i in data.diasv){
							//console.log("dia:"+data.diasv[i].id);
						
							var diasvisita = "<div class='diaV'> Dia:"+data.diasv[i].dia_nom+"</div>";
							$('#con_dias').append(diasvisita);

					}
				}
				
				
			}

				


		});

	$('#ModalDias').modal({
						show:true,
						keyboard:false
					});
	e.preventDefault();*/ 
});

$(document).on('change','.cant', function(e){
	var id = $(this).attr('data');
	var identifier = $(this).attr('togle');
	var can = $('#can-'+id).val();
	//alert(can);
	
 	
 	var url = $('#urlValDis').val();
 	var dis = getDis(id,url);
	
 	console.log("und:"+dis);
 	
	

	if (can <= 0)
	{
		notie.alert(3, 'Ingrese un valor valido', 2);
		return false;
	}

	if(parseInt(dis) < parseInt(can))
	{
		
		swal("Cantidad no disponible.", "Unidades disponibles: "+dis);
		$("#cant-"+id).focus();
		return false;
	}

	actCart(id,identifier,can);

	e.preventDefault();
});

function actCart(id, identifier, can){
	//alert("id: "+id+" identifier: "+identifier+" can: "+can);

	$.ajax({

			url : "/CarroAjax",
			dataType: "json",
			type : "post",
			data : { id_pro : id, identifier: identifier, cantidad:can},
			success : function(data){
				
				if(data.estado.estado == 1)
				{
					var NtotalItem = data.estado.itemTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var NtotalItemTax = data.estado.itemTotalTax.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var Ntotal = data.estado.totalCart.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var NtotalTax = data.estado.totalCartTax.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					console.log(data);
					$('.totalCart').text(Ntotal);
					$('.itemTotal-'+id).text(NtotalItem);
					$('.totalCartTax').text(NtotalTax);
					notie.alert(1, 'Cantidad actualizada!', 1.8);
					
							//console.log("dia:"+data.diasv[i].id);
						
							

					
				}
				
				
			}

				


		});
}


//funcion para consultar la cantidad disponible
function getDis(id,url)
{
	
	var d = 0;
	var t = 0;

	/*$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			async:false,
			data : { id : id},
			success : function(data){

				if(data.estado.estado == 1)
				{
					//var dis = parseInt(data.pro.saldo);
					d = parseInt(data.pro.saldo);
					console.log(dis);
					console.log(data);
					
				}	
					
					

		}

			});*/
$.ajax({

			url : "http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/getPriceById.php",
			dataType: "json",
			type : "post",
			data: {id: id},
			async: false,
			success : function(data){
				
				console.log(data);
				for (var i  in data)
				{
					//console.log(data);
					var oPrice = data[i].precio3;
					var nPrice = data[i].precio3.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					 d  = parseInt(data[i].saldo);
					//console.log("cantidades:"+d);
					//console.log("cantidades:"+d);
	
					

					
				}
				t = d;
				
			
				
			},error : function(data){
				
				console.log(data);
				
				
				} 

		});
//alert(t);
return d;
	
}




function cargarDias()
{
	var barrio_id = $('#barrio_id').val();
			
			$.ajax({

			url : "/DiasAjax",
			dataType: "json",
			type : "post",
			data : { barrio_id : barrio_id},
			success : function(data){

				if(data.estado.estado == 1)
				{
					console.log(data);
					//$('#nom_barrio').text(data.barrio.bar_nom);
					$('#ulDiasV').html('');

					for (var i in data.diasv){
							//console.log("dia:"+data.diasv[i].id);
						
							var diasvisita = "<li> "+data.diasv[i].dia_nom+"</li>";
							$('#ulDiasV').append(diasvisita);

					}
				}
				
				
			}

			});
}
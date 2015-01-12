$(document).on('click','#btn_addCart', function(e){
	var id_pro = $('#id_producto').val();
	var cantidad = $('#input-quantity').val();

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
					$('.info-item').html('<p>Has agregado a tu lista :'+data.producto.pro_nom+' <img src="../'+data.producto.img+'" height="120px" width="auto"></p><br><strong>Total del Pedido: $'+Ntotal+'</strong>')
					console.log(data);
				}
				
			}

				


		});


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

$(document).on('click','#d_entrega', function(e){
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
	e.preventDefault();
});
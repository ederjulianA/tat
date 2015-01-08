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
					$('#ModalCart').modal('show');
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
			var r_total = (totalCart + 0);
			Ntotal = r_total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#slc_envio').removeClass('select_error');
			$('#slc_envio').addClass('select_ok');
			$('#vlr_envio').text('0');
			$('#totalP').text(Ntotal);
			$('#msg-ajax').html('<p class="alert alert-success"> El envio del pedido se hara segun las rutas de entrega dispuestas por TAT</p><P>Costo de entrega : $0</P>');
		}
		else if (env == 2)

		{	
			var r_total = (totalCart + 5000);
			Ntotal = r_total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			$('#slc_envio').removeClass('select_error');
			$('#vlr_envio').text('5.000');
			$('#slc_envio').addClass('select_ok');
			$('#totalP').text(Ntotal);
			$('#msg-ajax').html('<p class="alert alert-success"> El envio será entregado de forma inmediata por medio de un mensajero.</p><P>Costo de entrega : $5.000<br>Tiempo de entrega : 60 Minutos</P>');
		}
});
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

$(document).on('click','.itemP',function(e){
	var urlProd = $('#urlAddProd').val();
	var idArt = $(this).attr('data');
	var idPedido = $('#idPedido').val();

	alert(urlProd);

		$.ajax({

			url : urlProd,
			dataType: "json",
			type : "post",
			data : { idPedido : idPedido, idArt: idArt},
			success : function(data){
				console.log(data);
				if(data.estado.estado == 1)
				{
					//var NtotalItem = data.estado.itemTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					//var Ntotal = data.estado.totalCart.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

				
				alert(data);
					
							//console.log("dia:"+data.diasv[i].id);
						
							

					
				}
				
				
			}

				


		});
	e.preventDefault();
});
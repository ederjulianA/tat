$(document).ready(function(){
		
		buscarPrecio();
	
});


function buscarPrecio()
{
	
		$('.idSync').each(function(){
			var id = $(this).attr('data');
			//console.log(id);

			consultarPrecio(id);

		});
}


function consultarPrecio(id)
{

	$.ajax({

			
			//url : "http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/getPriceById.php",
			url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getPriceById.php",
			dataType: "json",
			type : "post",
			data: {id: id},
			success : function(data){
				
				
				for (var i  in data)
				{
					console.log(data);
					//var oPrice = data[i].precio3;
					//var nPrice = data[i].precio3.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var oPrice = Math.round(data[i].valIva);
					//var new_number = Math.round(oPrice);
					var nPrice = oPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var nPrice2 = Math.round(nPrice);
					var saldo  =  Math.round(data[i].saldo);
					console.log(nPrice);
					$('#pro-'+id).text('$ '+nPrice);
					grabarArt(oPrice,id,saldo,oPrice);
					//$('#pro-'+id).text(nPrice2);

						
					}
			
				
			},error : function(data){
				
				console.log(data);
				
				
				}

		});
}

function grabarArt(	oPrice,id,saldo,oPrice)
{
	var url = $('#urlSaveArt').val();
	
	
	$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data: {id: id, oPrice:oPrice,saldo:saldo,oPrice:oPrice},
			success : function(data){
				
				console.log(data);
			},error : function(data){
				
				console.log(data);
				
				
				}

		});
}
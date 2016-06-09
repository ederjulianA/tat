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

			url : "http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/getPriceById.php",
			dataType: "json",
			type : "post",
			data: {id: id},
			success : function(data){
				
				
				for (var i  in data)
				{
					console.log(data);
					var oPrice = data[i].precio3;
					var nPrice = data[i].precio3.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var saldo  = data[i].saldo;
					console.log(saldo);

					grabarArt(nPrice,id,saldo,oPrice);
					$('#pro-'+id).text(nPrice);
				}
			
				
			},error : function(data){
				
				console.log(data);
				
				
				}

		});
}

function grabarArt(nPrice,id,saldo,oPrice)
{
	var url = $('#urlSaveArt').val();
	
	
	$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data: {id: id, nPrice:nPrice,saldo:saldo,oPrice:oPrice},
			success : function(data){
				
				console.log(data);
			},error : function(data){
				
				console.log(data);
				
				
				}

		});
}
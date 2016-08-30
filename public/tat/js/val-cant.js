$(document).ready(function(){
		
		//buscarPrecio();
		setInterval(function(){
        buscarPrecio();;
    }, 3000);
	
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
					var oPrice = Math.round(data[i].valIva);
					var nPrice = oPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var saldo  = data[i].saldo;
					var artCod = data[i].ArtCod;
					console.log("el saldo:"+saldo);

					if (saldo <= 0)
					{
						notie.alert(3, 'Uno o más items se ha quedado sin existencias', 5000);
						$('#item-'+artsec).addClass('error');
						return false;
					}
					grabarArt(oPrice,id,saldo,oPrice);
					$('#pro-'+id).text(nPrice);
				}
			
				
			},error : function(data){
				
				console.log(data);
				
				
				}

		});
}

function grabarArt(oPrice,id,saldo,oPrice)
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
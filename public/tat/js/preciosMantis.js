$(document).ready(function(){

		//filter();		
		buscarPrecio();
		addClassBanner();
	
});

$(document).on('change','#selSea',function(e){
	var val = $('#selSea').val();
	URL = document.URL;

if(URL.indexOf('ord=asc') != -1)
       URL = URL.replace('ord=asc','ord=desc');
else
      URL = URL.replace('ord=desc','ord=asc'); 

window.location = URL;
	//window.location.search += '&ord='+val;
	//alert(val);
});

function filter()
{

	var url = location.search;
	var ord = $.query.get('ord');
	if (ord ==="")
	{
	 url = $.query.set("ord", "asc").toString();
	 window.location.href = url;
	}
	
	console.log(url);
	
}

function buscarPrecio()
{
	
		$('.idSync').each(function(){
			var id = $(this).attr('data');
			//console.log(id);

			consultarPrecio(id);

		});
}

function addClassBanner()
{

	//$('#itemB div').addClass('active');
	$('.itemB').each(function(i) {
    if ( i === 0 ) {
       $(this).addClass('active');
       console.log("item");
    }
});
}


function consultarPrecio(id)
{

	$.ajax({

			
			url : "http://190.156.239.253:8086/websomic/EDER/TV8/getPriceById.php",
			//url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getPriceById.php",
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
					var pre = Math.round(data[i].precio3);
					//var new_number = Math.round(oPrice);
					var nPrice = oPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var nPre = pre.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var nPrice2 = Math.round(nPrice);
					var nPre2 = Math.round(nPre);
					var saldo  =  Math.round(data[i].saldo);
					console.log("nPre2 price:"+pre);
					if (saldo <= 0)
					{
						$('#pb-'+id).block({ 
                message: null 
            });
					}
					$('#pro-'+id).text('$ '+nPrice);
					grabarArt(oPrice,id,saldo,pre);
					//$('#pro-'+id).text(nPrice2);

						
					}
			
				
			},error : function(data){
				
				console.log(data);
				
				
				}

		});
}

function grabarArt(	oPrice,id,saldo,pre)
{
	var url = $('#urlSaveArt').val();
	
	console.log(pre);
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
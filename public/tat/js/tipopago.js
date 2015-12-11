$(document).ready(function(){


});

$(document).on('change','#tipo_pago', function(e){
	
	var tippag = $('#tipo_pago').val();
	if(tippag == 1)
	{
		var url = $('#ajaxLoadPayment').val();
		$( "#load-content" ).load(url);
		loadEnvios();
	}

	if(tippag == 2)
	{
		var url = $('#ajaxLoadPaymentU').val();
		$( "#load-content" ).load(url);
		loadEnvios();
	}

});

$(document).on('change','#slc_TipPag', function(e){
	var tippag = $('#slc_TipPag').val();

		if(tippag == 2)
		{
			
		
			//alert("hahah");
			var NitSec = $('#NitSec').val();
			var url    = $('#urlTipPag').val();
			var carval = $('#carval').val();
			console.log(url);
			$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data : { NitSec : NitSec, carval: carval},
			success : function(data){
				
				console.log(data);
				
				
				},error : function(data){
				
				console.log(data);
				
				
				},complete : function(data){
				
				console.log(data);
				
				
				}
			});

			console.log()

		



		}
	
});
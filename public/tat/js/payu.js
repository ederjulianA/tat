$(document).ready(function(){

	loadPayu();
});

function loadPayu()
{
	var len = "en";
	var com = "PING";
	var test = true;
	var merchant ={apiLogin: "pRRXKOl8ikMmt9u",apiKey: "4Vj8eK4rloUd272L48hsrarnUA"};
	$.ajax({

			url : "https://sandbox.api.payulatam.com/reports-api/4.0/service.cgi",
			dataType: "json",
			type : "post",
			data : { 
				   language: "es",
   command: "GET_BANKS_LIST",
   merchant: {
      apiLogin: "pRRXKOl8ikMmt9u",
      apiKey: "4Vj8eK4rloUd272L48hsrarnUA"
   },
   test: false,
   bankListInformation: {
      paymentMethod: "PSE",
     paymentCountry: "CO"
   }
			},
			success : function(data){
				console.log(data);
				
				
			},error : function(data){
				
				console.log(data);
				
				
				}

			});
}


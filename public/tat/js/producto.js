$(document).ready(function(){

	actDet();

});

function actDet()
{
	var ArtSec = $('#ArtSec').val();
	$.ajax({
			url : 'http://190.156.239.253:8086/websomic/EDER/TV8/bas/detalle.php',
			dataType: "json",
			type : "get",
			data : {id:ArtSec},
			success : function(data){
				console.log(data);
				for (var i  in data) {
					
					ficha = data[i].ArtFicTec;
					console.log(ficha);
					save(ArtSec,ficha);
				}
			

				

			},error : function(data){
				
				console.log(data);
				
				
				}
		});

	//alert(url);
}

function save(ArtSec,ArtFicTec){
	var url = $('#urlActDes').val();
	$.ajax({
			url : url,
			dataType: "json",
			type : "get",
			data : {ArtSec:ArtSec,ArtFicTec:ArtFicTec},
			success : function(data){
				console.log(data);
				
			

				

			},error : function(data){
				
				console.log(data);
				
				
				}
		});
}
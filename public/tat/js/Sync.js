$(document).ready(function(){
	
});



$(document).on('click','#loadProdApi',function(e){
	sync();
	$('#loadProdApi').text('Sincronizando...');
	e.preventDefault();
});

$(document).on('click','#loadArt',function(e){
	sync();
	$('#loadProdApi').text('Sincronizando...');
	e.preventDefault();
});


$(document).on('click','#loadTestPro',function(e){
	console.log("iniciando...");
	sync2();
	//$('#loadProdApi').text('Sincronizando...');
	e.preventDefault();
});


function sync2()
{

	$.ajax({

			url : "http://localhost/JSONS/GetArticulosCount2.php",
			dataType: "json",
			type : "get",
			
			success : function(data){
				console.log("Armando Ids");
				console.log(data);
				armarIds(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}



function sync()
{

	$.ajax({

			url : "http://somic.com.co:8086/WEBSOMIC/EDER/getFamilias.php",
			dataType: "json",
			type : "get",
			
			success : function(data){
				console.log(data);
				guardar(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}

function armarIds(conteo)
{
	console.log("llega...")
	console.log(conteo);
	var urlSync = $('#urlTestPro').val();
	$.ajax({

			url : urlSync,
			dataType: "json",
			type : "post",
			data: {data: conteo},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				console.log("Importando articulos...");
				console.log(data);
				getArticulos(data);

				//$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});

}



function getArticulos(data)
{
	
	$.ajax({

			url : "http://localhost/JSONS/GetArticuos2.php",
			dataType: "json",
			type : "post",
			
			data: {data: data},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				console.log(data);
				guardar(data);
				

				//$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});

}




function guardar(data)
{
	var urlSync = $('#urlTestSavePro').val();
	$.ajax({

			url : urlSync,
			dataType: "json",
			type : "post",
			data: {data: data},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				console.log(data);
				//$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}



//SINCRONIZAR ARTICULOS

function prodMantisAjax()
{

	$.ajax({

			url : "http://somic.com.co:8086/WEBSOMIC/EDER/getFamilias.php",
			dataType: "json",
			type : "get",
			
			success : function(data){
				console.log(data);
				guardar(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}


function guardarProdMantisAjax(data)
{
	var urlSync = $('#urlSync').val();
	$.ajax({

			url : "http://localhost:8000/api/saveproducts",
			//url : "http://morenoyalvarez.com/api/saveproducts",
			dataType: "json",
			type : "post",
			data: {data: data},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				console.log(data);
				$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}



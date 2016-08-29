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

			//url : "http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/GetArticulosCount2.php",
			//url : "http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/articulos1.php",
			  url : "http://192.168.100.241:8086/WEBSOMIC/EDER/TV8/articulos1.php",
			 dataType: "json",
			 type : "get",
			
				success : function(data){
				console.log("Armando Ids");
				console.log(data);
				var cont = 0;
				var ids = "";
				var por = data.length;
				var porNum = 1;
				var valPor = 1;
				var NvalPor = 1;
				console.log(por);
				swal({   title: "Esto puede tardar varios minutos...!",   text: "<div class='progress'><div class='progress-bar' role='progressbar'  aria-valuemin='0' id='pbar' aria-valuemax='100' style='width:0%;'>10%</div></div>",   html: true ,showConfirmButton: false});
				//var ids =[];
				for (var i  in data) {
					ids = ids+" '"+data[i].id+"',";
					cont ++;
					porNum ++;
					valPor = (porNum*100)/ por;
					 NvalPor =  Math.round(valPor);

					 
					//console.log(NvalPor);

					if (cont == 1) {
						getArt(ids,NvalPor);
						cont = 0;
						ids = "";
					};

					
				};

				//armarIds(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}



function sync()
{

	$.ajax({

			//url : "http://somic.com.co:8086/WEBSOMIC/EDER/getFamilias.php",
			url : "http://192.168.100.241:8086/WEBSOMIC/EDER/TV8/getFamilias.php",
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
				var num = data.length;
				console.log(num);
				//getArticulos(data);

				//$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});

}



function getArt(ids,NvalPor)
{
	console.log(ids);
	$.ajax({

			//url : "http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/articulos2.php",
			  //url : "http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/GetArticuos2.php",
			  url : "http://192.168.100.241:8086/WEBSOMIC/EDER/TV8/GetArticuos2.php",
			dataType: "json",
			type : "get",
			
			data: {ids: ids},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				console.log(data);
				console.log(NvalPor);
				guardar(data,NvalPor);
				

				//$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});

}




function guardar(data,NvalPor)
{
	var urlSync = $('#urlTestSavePro').val();
	console.log(data);
	$.ajax({

			url : urlSync,
			dataType: "json",
			type : "post",
			data: {data: data},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				//console.log(data);
				$('#pbar').css("width",NvalPor+'%');
					 $('#pbar').text(NvalPor+"%");
				

					 if(NvalPor >= 100)
					 {
					 	swal({   title: "Sincronizacón terminada",   text: "Se han sincronizado los Articulos.",   timer: 2000,   showConfirmButton: false });
					 }
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

			//url : "http://somic.com.co:8086/WEBSOMIC/EDER/getFamilias.php",
			url : "http://192.168.100.241:8086/WEBSOMIC/EDER/TV8/getFamilias.php",
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



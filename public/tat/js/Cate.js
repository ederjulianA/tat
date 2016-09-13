$(document).ready(function(){
	
});


$(document).on('click','#loadGrupos',function(e){
	loadGrupos();
	$('#loadProdApi').text('Sincronizando...');
	e.preventDefault();
});

$(document).on('click','#loadFamilias',function(e){
	loadFamilias();
	$('#loadProdApi').text('Sincronizando...');
	e.preventDefault();
});

$(document).on('click','#loadSubGrupo',function(e){
	loadSubGrupo();
	$('#loadProdApi').text('Sincronizando...');
	e.preventDefault();
});


function loadGrupos()
{

	$.ajax({

			url : "http://190.156.239.253:8086/websomic/EDER/TV8/GetGrupos.php",
			//url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getGrupos.php",

			dataType: "json",
			type : "get",
			
			success : function(data){
				console.log(data);
				guardarGrupos(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}


function loadSubGrupo()
{

	$.ajax({

			url : "http://190.156.239.253:8086/websomic/EDER/TV8/GetSubGrupos.php",
			//url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getSubGrupos.php",

			dataType: "json",
			type : "get",
			
			success : function(data){
				console.log(data);
				//guardarGrupos(data);
				var numReg = data.length;
				//console.log("Num: "+numReg);
				var cont = 0;
				var ids ="";
				var porNum = 1;
				var valPor = 1;
				var NvalPor = 1;
				swal({   title: "Esto puede tardar varios minutos!",   text: "<div class='progress'><div class='progress-bar' role='progressbar'  aria-valuemin='0' id='pbar' aria-valuemax='100' style='width:0%;'>0%</div></div>",   html: true ,showConfirmButton: false});
				for (var i  in data) {
					//console.log(data[i]);
					ids = ids+"'"+data[i].InvSubGruCod+"',";
					cont ++;
					


					 valPor = (porNum*100)/ numReg;
					 NvalPor =  Math.round(valPor);
					 porNum ++;
					 
					//console.log(NvalPor);

					if (cont == 1) {
						getSubGru(ids,NvalPor);
						cont = 0;
						ids = "";
					};
				}
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}



function guardarGrupos(data)
{
	var urlSync = $('#urlSaveGrupos').val();
	$.ajax({

			url : urlSync,
			dataType: "json",
			type : "post",
			data: {data: data},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				console.log(data);
				location.reload(true);
				//$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}

//loadFamilias

function loadFamilias()
{

	$.ajax({

			url : "http://190.156.239.253:8086/websomic/EDER/TV8/getFamilias.php",
			//url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getFamilias.php",
			dataType: "json",
			type : "get",
			
			success : function(data){
				//console.log(data);
				var cont = 0;
				var ids ="";
				var por = data.length;
				var porNum = 1;
				var valPor = 1;
				var NvalPor = 1;
				swal({   title: "Esto puede tardar varios minutos...!",   text: "<div class='progress'><div class='progress-bar' role='progressbar'  aria-valuemin='0' id='pbar' aria-valuemax='100' style='width:0%;'>10%</div></div>",   html: true ,showConfirmButton: false});
				for (var i  in data) {
					ids = ids+" '"+data[i].jj+"',";
					cont ++;
					porNum ++;


					 valPor = (porNum*100)/ por;
					 NvalPor =  Math.round(valPor);
					 
					console.log(NvalPor);

					if (cont == 1) {
						getFam(ids,NvalPor);
						cont = 0;
						ids = "";
					};

					
				};
				//console.log(ids);
				//guardarFamilias(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}



function getFam(ids,NvalPor)
{

	$.ajax({

			url : "http://190.156.239.253:8086/websomic/EDER/TV8/getFamiliasIds.php",
			//url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getFamiliasIds.php",
			dataType: "json",
			type : "get",
			data: {ids:ids},
			
			success : function(data){
				//console.log(data);
				var cont = 0;
				var ids ="";
				guardarFamilias(data,NvalPor);
			
				//console.log(ids);
				//guardarFamilias(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}

function getSubGru(ids,NvalPor){
	console.log(NvalPor+'los ids: '+ids);
	var urlSaveSubGrupos = $('#urlSaveSubGrupos').val();
	$.ajax({

			url : "http://190.156.239.253:8086/websomic/EDER/TV8/getSubGruposIds.php",
			//url : "http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/getSubGruposIds.php",
			dataType: "json",
			type : "get",
			data: {ids:ids},
			
			success : function(data){
				console.log(data);
				var cont = 0;
				var ids ="";
				guardarSubGrupos(data,NvalPor);
			
				//console.log(ids);
				//guardarFamilias(data);
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}

function guardarSubGrupos(data,NvalPor)
{
	var urlSync = $('#urlSaveSubGrupos').val();
	$.ajax({

			url : urlSync,
			dataType: "json",
			type : "post",
			data: {data: data},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				//console.log(data);
				//$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();

				$('#pbar').css("width",NvalPor+'%');
					 $('#pbar').text(NvalPor+"%");

					 if(NvalPor >= 100)
					 {
					 	swal({   title: "Sincronizacón terminada",   text: "Se han sincronizado las Familias.",   timer: 2000,   showConfirmButton: false });
					 }
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}


function guardarFamilias(data,NvalPor)
{
	var urlSync = $('#urlSaveFamilias').val();
	$.ajax({

			url : urlSync,
			dataType: "json",
			type : "post",
			data: {data: data},
			success : function(data){

				//var html = '<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Actualización terminada</strong></div>';
				//console.log(data);
				//$('#loadProdApi').text('Load products');
				//$('.ajax2').append(html);
				//location.reload();

				$('#pbar').css("width",NvalPor+'%');
					 $('#pbar').text(NvalPor+"%");

					 if(NvalPor == 100)
					 {
					 	swal({   title: "Sincronizacón terminada",   text: "Se han sincronizado las Familias.",   timer: 2000,   showConfirmButton: false });
					 }
				
			},error : function(data){
				
				console.log(data);
				
				
				}

				


		});
}


//load articulos
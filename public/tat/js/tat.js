$(document).ready(function(){
		
});

$(document).on('change','.cb-act',function(e){
	var id = $(this).attr('data');
	var cb = $("#act-"+id).prop('checked');
	var url = $("#UrlActivo").val();
		$.ajax({
			url : url,
			dataType: "json",
			type : "post",
			data : { id : id,cb:cb},
			success : function(data){
				console.log(data);
				/*if(data.estado.estado == 1)
				{
					console.log(data);
					
					
				}*/
				
			},error : function(data){
				
				console.log(data);
				
				
				}


				


		});
});


$(document).on("click",".btnActBan", function(e){
	var id  = $(this).attr('data');
	var pos = $("#pos-"+id).val();

	$.ajax({
			url : "/api/banner-edit",
			dataType: "json",
			type : "post",
			data : { id : id,pos:pos},
			success : function(data){
				console.log(data);
			},error : function(data){
				
				console.log(data);
				
				
				}


				


		});
	

	e.preventDefault();
});
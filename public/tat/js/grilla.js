$(document).ready(function(){

		filter();		
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
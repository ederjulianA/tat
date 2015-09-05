$(document).ready(function(){


	//cargarProductosAjax();



});


function cargarProductosAjax()
{
	var url = $('#UrlLoadPro').val();

	
	$.ajax({

			url : url,
			dataType: "json",
			type : "post",
			data : { },
			success : function(data){

				if(data.estado.estado == 1)
				{
					$('#rowProd').html('');
					var urlProducto = 'http://localhost:8000/producto/';
						
						
						for( var i in data.productos){
								var html = '';

								html += '<div class="col-md-4 col-sm-6">';
								html += '<div class="product-col">';
									html += '<div class="image">';
										html += '<img src="'+data.productos[i].UrlImg+'" alt="product" class="" height="150px" width="auto" />';
									html += '</div>';
									html += '<div class="caption">';
										html += '<h4><a href="">'+data.productos[i].ArtNom+'</a></h4>';
										html += '<div class="description">';
											
										html += '</div>';
										html += '<div class="price">';
											html += '<span class="price-new">$'+data.productos[i].precio1+'</span> ';
											
										html += '</div>';
										html += '<div class="cart-button button-group">';
											html += '<button type="button" title="Favoritos" class="btn btn-wishlist">';
												html += '<i class="fa fa-heart"></i>';
											html += '</button>';
											html += '<!--<button type="button" title="Compare" class="btn btn-compare">';
												html += '<i class="fa fa-bar-chart-o"></i>';
											html += '</button>-->';
											html += '<a  class="btn btn-cart" href="'+urlProducto+data.productos[i].Slug+'">';
												html += 'Agregar Producto';
												html += '<i class="fa fa-shopping-cart"></i> ';
											html += '</a>';									
										html +='</div>';
									html +='</div>';
								html +='</div>';
							html +='</div>';

							$('#rowProd').append(html);
						}

							

					
				}
				
				
			}

				


		});
}

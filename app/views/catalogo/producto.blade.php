@extends('layouts.front')

@section('cart-items')
	@include('includes.cart')
	
@stop

@section('content')
	<div class="row">
		<div class="row">
			<div class="col-md-5">
				  @if(Session::has('message-alert'))

            <div class="alert alert-warning alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <strong>Mensaje</strong> {{Session::get('message-alert')}}
            </div>

            <!--<p class="mensajes-flash" style="" data-dismiss="alert"id="mensaje-flash"> {{Session::get('message-alert')}}
                
            </p>-->
        @endif
				
			</div>
			
		</div>
			<form method="post" action="/addToCart">
			<!-- Primary Content Starts -->
				<div class="col-md-9">
				<!-- Breadcrumb Starts -->
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li><a href="#"></a>{{ Funciones::getCat($producto->categoria_id)}}</li>
						<li class="active">{{$producto->pro_nom}}</li>
					</ol>
				<!-- Breadcrumb Ends -->
				<!-- Product Info Starts -->
					<div class="row product-info">
					<!-- Left Starts -->
						<div class="col-sm-5 images-block">
							<p>
								<img src="{{asset($producto->img)}}" alt="Image" class="img-responsive thumbnail" />
							</p>
							<!--<ul class="list-unstyled list-inline">
								<li>
									<img src="images/product-images/thumb1.jpg" alt="Image" class="img-responsive thumbnail" />
								</li>
								<li>
									<img src="images/product-images/thumb2.jpg" alt="Image" class="img-responsive thumbnail" />
								</li>
								<li>
									<img src="images/product-images/thumb3.jpg" alt="Image" class="img-responsive thumbnail" />
								</li>
								<li>
									<img src="images/product-images/thumb4.jpg" alt="Image" class="img-responsive thumbnail" />
								</li>
							</ul>-->
						</div>
					<!-- Left Ends -->
					<!-- Right Starts -->
						<div class="col-sm-7 product-details">
						<!-- Product Name Starts -->
							<h2>{{$producto->pro_nom}}</h2>
						<!-- Product Name Ends -->
							<hr />
						<!-- Manufacturer Starts -->
							<ul class="list-unstyled manufacturer">
								<li>
									<span>Categoria:</span> {{ Funciones::getCat($producto->categoria_id)}}
								</li>
								<!--<li><span>Uni. Disponibles:</span> {{$producto->cantidad}}</li>-->
								<!--<li>
									<span>Disponible:</span> 

										@if($producto->cantidad > 0)
											<strong class="label label-success"> Sí</strong>
										@else
											<strong class="label label-danger"> No</strong>
										@endif
									
								</li>-->
							</ul>
						<!-- Manufacturer Ends -->
							<hr />
						<!-- Price Starts -->
							<div class="price">
								<span class="price-head">Precio :</span>
								<span class="price-new">${{number_format($producto->precio, 0, '', '.')}}</span> 
							</div>
						<!-- Price Ends -->
							<hr />
						<!-- Available Options Starts -->
							<div class="options">
								<div class="form-group">
									<label class="control-label text-uppercase" for="input-quantity">Cant:</label>
									<input type="number"  name="cantidad" value="1" size="2" id="input-quantity" class="form-control inputQnt" />
								</div>
								<div class="cart-button button-group">
									<!--<button type="button" title="Wishlist" class="btn btn-wishlist">
										<i class="fa fa-heart"></i>
									</button>
									<button type="button" title="Compare" class="btn btn-compare">
										<i class="fa fa-bar-chart-o"></i>
									</button>-->
									<input type="hidden" name="id_producto" id="id_producto" value="{{$producto->id}}">
									
											<button type="button" class="btn btn-cart" id="btn_addCart">
												Agregar
												<i class="fa fa-shopping-cart"></i> 
											</button>
									</form>											
								</div>
							</div>
						<!-- Available Options Ends -->
							<hr />
						</div>
					<!-- Right Ends -->
					</div>
				<!-- product Info Ends -->
				<!-- Product Description Starts -->
					<div class="product-info-box">
						<h4 class="heading">Descripción</h4>
						<div class="content panel-smart">
							<p>
								{{$producto->descripcion}}
							</p>
						
						</div>
					</div>
				<!-- Product Description Ends -->
				<!-- Additional Information Starts -->
					<!--<div class="product-info-box">
						<h4 class="heading">Additional Information</h4>
						<div class="content panel-smart">
							<p>
								Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
							</p>
						</div>
					</div>-->
				<!-- Additional Information Ends -->
				
				</div>
			<!-- Primary Content Ends -->
			<!-- Sidebar Starts -->
				<div class="col-md-3">
				<!-- Categories Links Starts -->

					@include('includes.categoriasDerecha')
				<!-- Categories Links Ends -->
				<!-- Shopping Options Starts -->
					<!--@include('includes.ShoppingOptions')-->
				<!-- Shopping Options Ends -->
				<!-- Bestsellers Links Starts -->
					@include('includes.bestSeller')
				<!-- Bestsellers Links End -->
				</div>
			<!-- Sidebar Ends -->
			</div>



<div class="modal signUpContent fade" id="ModalCart" tabindex="-1" role="dialog" >
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header modalHeader">
        <button type="button" id="closeModal" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h3 class="modal-title-site text-center" > PRODUCTO AGREGADO </h3>
      </div>
      <div class="modal-body">
      	<div class="info-item">
      		
      	</div>
      
        
      </div>
      <div class="modal-footer">
      	<a href="/catalogo" class="btn btn-info">Seguir Comprando</a> -- <a href="/cart" class="btn btn-danger">Terminar Pedido</a>
        
      </div>
    </div>
    <!-- /.modal-content --> 
    
  </div>
  <!-- /.modal-dialog --> 
  
</div>
<!-- /.Modal Login --> 
@stop
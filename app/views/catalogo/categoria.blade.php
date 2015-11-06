@extends('layouts.front')

@section('cart-items')
	@include('includes.cart')
	
@stop

@section('content')
		 @if(Session::has('message-alert'))
			<div class="row">
			<div class="col-md-5">
				 

            <div class="alert alert-warning alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <strong>Mensaje</strong> {{Session::get('message-alert')}}
            </div>

            <!--<p class="mensajes-flash" style="" data-dismiss="alert"id="mensaje-flash"> {{Session::get('message-alert')}}
                
            </p>-->
        
				
			</div>
			
		</div>
		@endif

		<div class="row">
			<!-- Primary Content Starts -->
				<div class="col-md-9">
				<!-- Breadcrumb Starts -->
					<ol class="breadcrumb">
						<li><a href="/">Home</a></li>
						<li class="active">Categoria</li>
					</ol>
				<!-- Breadcrumb Ends -->
				<!-- Main Heading Starts -->
					<h2 class="main-heading2">
						Productos TAT 
					</h2>
				<!-- Main Heading Ends -->
			
				<!-- Product Filter Starts -->
					<div class="product-filter">
						<div class="row">
							<div class="col-md-4">
								<div class="display">
								
								</div>
							 </div>
							<!--<div class="col-md-2 text-right">
								<label class="control-label">Sort</label>
							</div>-->
							<!--<div class="col-md-3 text-right">
								<select class="form-control">
									<option value="default" selected="selected">Default</option>
									<option value="NAZ">Name (A - Z)</option>
									<option value="NZA">Name (Z - A)</option>
								</select>
							</div>-->
							<!--<div class="col-md-1 text-right">
								<label class="control-label" for="input-limit">Show</label>
							</div>
							<div class="col-md-2 text-right">
								<select id="input-limit" class="form-control">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3" selected="selected">3</option>
								</select>
							</div>-->
						</div>						 
					</div>
				<!-- Product Filter Ends -->
				<!-- Product Grid Display Starts -->
				
					<div class="row">
					  @foreach(array_chunk($productos->getCollection()->all(),3) as $row)
							@foreach($row as $producto)
							<!-- Product #1 Starts -->
								<div class="col-md-4 col-sm-6">
									<div class="product-col">
										<div class="image">
											<img src="{{asset($producto->img)}}" alt="product" class="" height="150px" width="auto" />
										</div>
										<div class="caption">
											<h4><a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}">{{$producto->pro_nom}}</a></h4>
											<div class="description">
												
											</div>
											<div class="price">
												<span class="price-new">${{number_format($producto->precio, 0, '', '.')}}</span> 
												<!--<span class="price-old">$249.50</span>-->
											</div>
											<div class="cart-button button-group">
												<button type="button" title="Favoritos" class="btn btn-wishlist">
													<i class="fa fa-heart"></i>
												</button>
												<!--<button type="button" title="Compare" class="btn btn-compare">
													<i class="fa fa-bar-chart-o"></i>
												</button>-->
												<a  class="btn btn-cart" href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}">
													Agregar Producto
													<i class="fa fa-shopping-cart"></i> 
												</a>									
											</div>
										</div>
									</div>
								</div>
							<!-- Product #1 Ends -->
							@endforeach	
					@endforeach	


					</div>
					{{$productos->links()}}
				
				<!-- Product Grid Display Ends -->
				</div>
			<!-- Primary Content Ends -->
			<!-- Sidebar Starts -->
				<div class="col-md-3">
				<!-- Categories Links Starts -->
					@include('includes.categoriasDerecha')
				<!-- Categories Links Ends -->
				<!-- Shopping Options Starts -->
						<!--  SHOPPING OPTIONS-->
				<!-- Shopping Options Ends -->
				<!-- Bestsellers Links Starts -->
						@include('includes.bestSeller')
				<!-- Bestsellers Links Ends -->
				</div>
			<!-- Sidebar Ends -->
			</div>

@stop
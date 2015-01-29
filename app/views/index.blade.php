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


		<!-- Latest Products Starts -->
		<section class="products-list">			
			<div class="container">
			<!-- Heading Starts -->
				<!--<h2 class="product-head">Nuestross productos</h2>-->
			<!-- Heading Ends -->
			<!-- Products Row Starts -->
				<div class="row">
				@foreach($productos as $pro)
					<!-- Product #1 Starts -->
						<div class="col-md-3 col-sm-6">
							<div class="product-col">
								<div class="image">
									<img src="{{asset($pro->img)}}" alt="product" class="" height="150px" width="auto" />
								</div>
								<div class="caption">
									<h4><a href="/producto/{{$pro->slug}}">{{$pro->pro_nom}}</a></h4>
									<div class="description">
										{{$pro->descripcion}}
									</div>
									<div class="price">
										<span class="price-new">${{number_format($pro->precio, 0, '', '.')}}</span> 
										<!--<span class="price-old">$249.50</span>-->
									</div>
									<div class="cart-button button-group">
										<!--<button type="button" title="Wishlist" class="btn btn-wishlist">
											<i class="fa fa-heart"></i>
										</button>
										<button type="button" title="Compare" class="btn btn-compare">
											<i class="fa fa-bar-chart-o"></i>
										</button>-->
										<a  class="btn btn-cart" href="/producto/{{$pro->slug}}">
											Agregar
											<i class="fa fa-shopping-cart"></i> 
										</a>									
									</div>
								</div>
							</div>
						</div>
					<!-- Product #1 Ends -->
				@endforeach	
				
				</div>
			<!-- Products Row Ends -->
			</div>
		</section>
	<!-- Latest Products Ends -->
@stop
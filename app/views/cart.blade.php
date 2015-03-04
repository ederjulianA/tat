@extends('layouts.front')

@section('cart-items')
	@include('includes.cart')
	
@stop

@section('content')
<style type="text/css">
	.btn-finalizar{
		position: absolute;
		right: 5px;
		bottom: 5px;

	}

</style>
	<!-- Breadcrumb Starts -->
			<ol class="breadcrumb">
				<li><a href="/">Home</a></li>
				<li class="active">Mi pedido</li>
			</ol>
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
		<!-- Breadcrumb Ends -->
		<!-- Main Heading Starts -->
			<h2 class="main-heading text-center">
				Mi pedido 
			</h2>
		<!-- Main Heading Ends -->
		<!-- Shopping Cart Table Starts -->
			<div class="table-responsive shopping-cart-table">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="text-center">
								Imagen
							</td>
							<td class="text-center">
								Detalle Producto
							</td>							
							<td class="text-center">
								Cantidad
							</td>
							<td class="text-center">
								Precio
							</td>
							<td class="text-center">
								% IVA
							</td>
							<td class="text-center">
								Total
							</td>
							<td class="text-center">
								Acción
							</td>
						</tr>
					</thead>
					<tbody>
						@if($products)
							@foreach($products as $pro)
								<tr>
									<td class="text-center">
										<a href="product.html">
											<img src="{{asset($pro->image)}}" alt="Product Name" title="Product Name" class="" height="120px" width="auto" />
										</a>
									</td>
									<td class="text-center">
										<a href="#">{{$pro->name}}</a>
									</td>	
								<form method="post" action="{{URL::route('updateItem')}}">						
									<td class="text-center">
										<div class="input-group btn-block">
											<input type="number" name="cantidad" width="10%" class="cant" togle="{{$pro->identifier}}" id="cant-{{$pro->id}}" data="{{$pro->id}}" value="{{$pro->quantity}}" size="1" class="form-control" />
											<input type="hidden" name="id_producto" value="{{$pro->id}}">
											<input type="hidden" name="identifier" value="{{$pro->identifier}}">
										</div>								
									</td>
									<td class="text-center">
										$<span id="precio-{{$pro->id}}">{{number_format($pro->price, 0, '', '.')}}</span>
									</td>
									<td class="text-center">
										{{$pro->tax}} %
									</td>
									<td class="text-center">
										$ <span class="itemTotal-{{$pro->id}}">{{number_format($pro->total(), 0, '', '.')}}</span>
									</td>
									<td class="text-center">
										<button type="submit" title="Actualizar" class="btn btn-default tool-tip">
											<i class="fa fa-refresh"></i>
										</button>
								</form>
									<form action="{{URL::route('removeItem', array('identifier'=>$pro->identifier))}}">		
										<button type="submit" title="Remove" class="btn btn-default tool-tip">
											<i class="fa fa-times-circle"></i>
										</button>
									</form>	
									</td>
								</tr>
							@endforeach	
						@endif		
												
					</tbody>
					<tfoot>
						<tr>
						  <td colspan="4" class="text-right">
							<strong>Sub-total :</strong>
						  </td>
						  <td colspan="2" class="text-left">
							$<span class="totalCart">{{number_format(Cart::total(false), 0, '', '.')}}</span>
						  </td>
						</tr>
						
							<tr>
						  <td colspan="4" class="text-right">
							<strong>Total :</strong>
						  </td>
						  <td colspan="2" class="text-left">
							$<span class="totalCart">{{number_format(Cart::total(), 0, '', '.')}}</span>
						  </td>
						</tr>
						<tr>
							<td colspan="4">
								
							</td>
							<td colspan="2">
								<a class="btn btn-warning btn-lg text-right" href="{{URL::route('checkout')}}"> FINALIZAR MI PEDIDO!</a>
							</td>
						</tr>
					</tfoot>
				</table>				
			</div>
		<!-- Shopping Cart Table Ends -->
		
@stop
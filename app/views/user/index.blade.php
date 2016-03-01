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
			<div class="col-md-4">
				<div class="panel panel-smart">
					<div class="panel-heading">
								<h3 class="panel-title">
									Mis ordenes  <a href="#" title="" id="loadProdApi">Load products</a>
									<input type="hidden" name="" id="urlSync" value="{{URL::route('saveproducts')}}">
								</h3>
					</div>
					<div class="panel-body">
						<table class="table">
							<th>Id pedido</th>
							<th>Valor</th>
							<th>Acciones</th>
							@foreach($pedidos as $pedido)
							<tr>
								<td>{{$pedido->id}}</td>
								<td>${{number_format($pedido->total_compra, 0, '', '.')}}</td>
								<td><a href="/micuenta/orden/{{$pedido->id}}">Detalle</a></td>
							</tr>

							@endforeach
						</table>
					</div>
				</div>
				
			</div>
			
		</div>

	
@stop
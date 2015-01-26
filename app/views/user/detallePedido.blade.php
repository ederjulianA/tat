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
			<div class="col-md-12">
				<div class="panel panel-smart">
					<div class="panel-heading">
								<h3 class="panel-title">
									Orden No : {{$pedido->id}}
								</h3>
					</div>
					<div class="panel-body">
						<table class="table table-responsive">
							<th>Id</th>
							<th>Detalle</th>
							<th>Cantidad</th>
							<th>Vlor Unitario</th>
							<th>IVA</th>
							<th>Valor Total</th>
							@foreach($items as $item)
								<tr>
									<td>{{$item->id_producto}}</td>
									<td>{{$item->nombre}}</td>
									<td>{{$item->cantidad}}</td>
									<td>${{number_format($item->valor_unitario, 0, '', '.')}}</td>
									<td>{{$item->iva}}</td>
									<td>${{number_format($item->valor_total, 0, '', '.')}}</td>
								</tr>
							@endforeach
						</table>

					</div>
				</div>
				<div class="panel-footer">
					<div class="row">
						<div class="col-md-4">
							Numero de Items: {{$pedido->num_items}}<br>
							Tipo de entrega: {{ Funciones::tipoPedido($pedido->tipo_compra)}} 
							
						</div>
						<div class="col-md-4">
							ENVIO : <STRONG>${{number_format($pedido->vlr_envio, 0, '', '.')}}</STRONG><br>
							TOTAL COMPRA : <strong> ${{number_format($pedido->total_compra, 0, '', '.')}}</strong>
							
						</div>
						<div class="col-md-4">
							ESTADO DEL PEDIDO:<br> 
							{{Funciones::getEstado($pedido->estado_id)}}
						</div>
						
					</div>

					
				</div>
				
			</div>
			
		</div>

	
@stop
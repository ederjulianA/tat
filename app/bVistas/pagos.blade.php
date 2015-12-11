<!-- Medoto envio Panel Starts -->
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Método de envío
								</h3>
							</div>
							<form method="post" action="{{URL::route('postPedido')}}" id="form-pedido">
							<input type="hidden"id="urlEnvAjax" value="{{URL::route('urlEnvAjax')}}">
							<div class="panel-body">
								<select class="select_envio select_error" name="tipo_compra" id="slc_envio">
									<option value="0">ESCOJA UNA OPCIÓN </option>
									
								</select>
								<!--RUTA TAT{{Form::radio('tipo_compra', '1','',array('id'=>'slc_envio'))}}
								inmediata{{Form::radio('tipo_compra', '2','',array('id'=>'slc_envio'))}}-->
								<hr />
							
								
								
							</div>
							<div class="text-uppercase clearfix" id="msg-ajax">
									
								</div>
						</div>
					<!-- Total Panel Ends -->


					<!-- Medoto envio Panel Starts -->
						<!--<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Método de Pago
								</h3>
							</div>
							
							<input type="hidden"id="urlTipPag" value="{{URL::route('urlTipPag')}}">
							<input type="hidden" id="carval" value="{{Cart::total()}}">
							<div class="panel-body">
								<select class="select_envio select_error" name="tipo_pago" id="slc_TipPag">
									@foreach($pagos as $pago)
									
										<option value="{{$pago->id}}">{{$pago->TipPagNom}} </option>
									@endforeach	
									
								</select>
							
								<hr />
							
								
								
							</div>
							<div class="text-uppercase clearfix" id="msg-ajax">
									
								</div>
						</div>-->
					<!-- Total Panel Ends -->





					<!-- Total Panel Starts -->
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Total de mi pedido
								</h3>
							</div>
							<div class="panel-body">
								<dl class="dl-horizontal">
									<dt>Total No. Items :</dt>
									<dd>{{Cart::totalItems()}}</dd>
									<dt>Subtotal Items :</dt>
									<dd>${{number_format(Cart::total(), 0, '', '.')}}</dd>
									<dt>Valor envio :</dt>
									<dd>$ <span id="vlr_envio"></span></dd>
									<!--<dt>Shipment Fee :</dt>-->
									<input type="hidden" id="totalCart" name="totalCart" value="{{Cart::total()}}">
									<input type="hidden" id="totalCart"name="totalItems" value="{{Cart::totalItems()}}">
									<input type="hidden" id="vlr_envio_a" name="vlr_envio_a" value="">
									<!--<dd>$15.00</dd>
									<dt>Tax Total :</dt>
									<dd>$315.00</dd>-->
								</dl>
								<hr />
								<dl class="dl-horizontal total">
									<dt>Total :</dt>
									<dd>$ <span id="totalP">{{number_format(Cart::total(), 0, '', '.')}}</span></dd>
									<input type="hidden" id="total_compra" name="total_compra" value="{{Cart::total()}}">
								</dl>
								<hr />
								<div class="text-uppercase clearfix">
									<a href="{{URL::route('catalogo')}}" class="btn btn-default pull-left">
										<span class="hidden-xs">Continuar comprando</span>
										<span class="visible-xs">Continue</span>
									</a>
									@if($datos)
									<button type="submit" class="btn btn-default pull-right" id="btn-pedido">		
										Hacer pedido
									</button>
									@else
										<button type="button" id="alert-datos" class="btn btn-default pull-right">		
										Hacer pedido
									</button>
									<br>
									<div class="ajax-val-datos">
										
									</div>
									@endif
								</div>
								<!--<div id="msg-ajax2">
									
								</div>-->
							</div>
						</div>
						</form>
					<!-- Total Panel Ends -->

<!--<form action="{{URL::route('payment')}}" method="post" accept-charset="utf-8">
									<input type="submit" name="" value="PAYPAL">
									
								</form>-->
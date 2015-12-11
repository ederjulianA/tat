<!-- Medoto envio Panel Starts -->
						<!--<div class="panel panel-smart">
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
									@foreach($envi as $e)
										<option value="{{$e->id}}">{{$e->nom_metodo}}</option>
									@endforeach
									
								</select>
								
								<hr />
							
								
								
							</div>
							
						</div>
					


					





					
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
									<dt>Shipment Fee :</dt>
									<input type="hidden" id="totalCart" name="totalCart" value="{{Cart::total()}}">
									<input type="hidden" id="totalCart"name="totalItems" value="{{Cart::totalItems()}}">
									<input type="hidden" id="vlr_envio_a" name="vlr_envio_a" value="">
									
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
								
									<button type="submit" class="btn btn-default pull-right" id="btn-pedido">		
										Hacer pedido
									</button>	
									
									
									<div class="ajax-val-datos">
										
									</div>
								
								</div>
								
							</div>
						</div>
						</form>-->

						<style type="text/css" media="screen">
							.paypalBtn{
								background: #1565C0;
								border:0;
								border-bottom: 5px solid #0D47A1;
								
								color: #fff;
								font-size: 20px;
								font-weight: bold;
								margin: 0 auto !important;
								max-width: 100%;
								padding: 5px;
								text-align: center;
								text-shadow: 1px 2px 1px rgba(0,0,0,.5);
								width: 80%;


							}	
						</style>
	<div class="panel panel-smart">				
		<div class="panel-heading">
								<h3 class="panel-title">
									Método de envío
								</h3>
							<form action="{{URL::route('payment')}}" method="post" accept-charset="utf-8">
								<input type="hidden"id="urlEnvAjax" value="{{URL::route('urlEnvAjax')}}">
								<div class="panel-body">
									<select class="select_envio select_error" name="tipo_compra" id="slc_envio">
										<option value="0">ESCOJA UNA OPCIÓN </option>
										@foreach($envi as $e)
											<option value="{{$e->id}}">{{$e->nom_metodo}}</option>
										@endforeach
										
									</select>
									
									<hr />

									<dl class="dl-horizontal">
									<dt>Total No. Items :</dt>
									<dd>{{Cart::totalItems()}}</dd>
									<dt>Subtotal Items :</dt>
									<dd>${{number_format(Cart::total(), 0, '', '.')}}</dd>
									<dt>Valor envio :</dt>
									<dd>$ <span id="vlr_envio"></span></dd>
									<dt>Shipment Fee :</dt>
									<input type="hidden" id="totalCart" name="totalCart" value="{{Cart::total()}}">
									<input type="hidden" id="totalCart"name="totalItems" value="{{Cart::totalItems()}}">
									<input type="hidden" id="total_compra" name="total_compra" value="{{Cart::total()}}">
									<input type="hidden" id="vlr_envio_a" name="vlr_envio_a" value="">
									
								</dl>
								<hr />
								<dl class="dl-horizontal total">
									<dt>Total :</dt>
									<dd>$ <span id="totalP">{{number_format(Cart::total(), 0, '', '.')}}</span></dd>
									<input type="hidden" id="total_compra" name="total_compra" value="{{Cart::total()}}">
								</dl>
								<hr />
							
									<button type="submit" class="paypalBtn">PAGAR</button> 
								
							</div>
									
									
						</form>

		</div>	

		<!-- PayPal Logo --><table border="0" cellpadding="10" cellspacing="0" align="center"><tr><td align="center"></td></tr><tr><td align="center"><a href="https://www.paypal.com/webapps/mpp/paypal-popup" title="How PayPal Works" onclick="javascript:window.open('https://www.paypal.com/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;"><img src="https://www.paypalobjects.com/webstatic/mktg/logo/bdg_now_accepting_pp_2line_w.png" border="0" alt="Now Accepting PayPal"></a><div style="text-align:center"><a href="https://www.paypal.com/webapps/mpp/how-paypal-works"><font size="2" face="Arial" color="#0079CD">How PayPal Works</font></a></div></td></tr></table><!-- PayPal Logo -->
	</div>		
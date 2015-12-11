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
							<form action="https://stg.gateway.payulatam.com/ppp-web-gateway/" method="post" accept-charset="utf-8">
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
									<?php    $sig = "5hthemedg8dujsa7bo9omdu9at~518436~TestPayU~".Cart::totalItems()."~COP"; $f = md5($sig); ?>
									<input type="hidden" id="totalCart" name="totalCart" value="{{Cart::total()}}">
									<input type="hidden" id="totalCart"name="totalItems" value="{{Cart::totalItems()}}">
									<input type="hidden" id="total_compra" name="total_compra" value="{{Cart::total()}}">
									<input type="hidden" id="vlr_envio_a" name="vlr_envio_a" value="">

										<!--<input name="merchantId"    type="hidden"  value="518436"   >-->
										<input name="merchantId"    type="hidden"  value="500238"   >
									  <input name="accountId"     type="hidden"  value="500537" >
									  <input name="description"   type="hidden"  value="Test PAYU"  >
									  <input name="referenceCode" type="hidden"  value="TestPayU" >
									  {{--<input name="amount"        type="hidden"  value="{{Cart::totalItems()}}"   >--}}
									  <input name="amount"        type="hidden"  value="3">
									  <input name="tax"           type="hidden"  value="0"  >
									  <input name="taxReturnBase" type="hidden"  value="0" >
									  <input name="currency"      type="hidden"  value="USD" >
									  <input name="signature"     type="hidden"  value="be2f083cb3391c84fdf5fd6176801278"  >
									  <input name="test"          type="hidden"  value="1" >
									  <input name="buyerEmail"    type="hidden"  value="test@test.com" >
									  <input name="responseUrl"    type="hidden"  value="http://www.test.com/response" >
									  <input name="confirmationUrl"    type="hidden"  value="http://www.test.com/confirmation" >
									
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
						<br>
						<form method="post" action="https://gateway.payulatam.com/ppp-web-gateway/pb.zul" accept-charset="UTF-8">
  <input type="image" border="0" alt="" src="http://www.payulatam.com/img-secure-2015/boton_pagar_grande.png" onClick="this.form.urlOrigen.value = window.location.href;"/>
  <input name="merchantId" type="hidden" value="518436"/>
  <input name="accountId" type="hidden" value="519941"/>
  <input name="description" type="hidden" value="Pago 1"/>
  <input name="referenceCode" type="hidden" value="p1"/>
  <input name="amount" type="hidden" value="{{Cart::total()}}"/>
  <input name="tax" type="hidden" value="0"/>
  <input name="taxReturnBase" type="hidden" value="0"/>
<input name="shipmentValue" value="0" type="hidden"/>
  <input name="currency" type="hidden" value="COP"/>
  <input name="lng" type="hidden" value="es"/>
  <input name="sourceUrl" id="urlOrigen" value="" type="hidden"/>
  <input name="buttonType" value="SIMPLE" type="hidden"/>
  <input name="signature" value="8955e8de8518bff9a80a5a83051f604d3d22a91072139a0211baa7377af1a248" type="hidden"/>
</form>

		</div>	
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
									<?php    $sig = "6u39nqhq8ftd0hlvnjfs66eh8c~500238~TestEder~".Cart::total()."~COP"; $f = md5($sig); ?>
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
						<?php    $sig = "FkS99SYEYsrO52J20y398S7eRC~553848~TestEder2~".Cart::total()."~COP"; $f = md5($sig); ?>

 <form method="post" action="https://stg.gateway.payulatam.com/ppp-web-gateway/">
<input type="hidden" name="accountId" value="500537" />
<input type="hidden" name="referenceCode" value="TestEder2" />

<input type="hidden" name="test" value="1" />
<input type="hidden" name="buyerEmail" value="ederalvarez2091057@gmail.com" />
<input type="hidden" name="taxValue" value="0" />
<input type="hidden" name="lng" value="es" />
<input type="hidden" name="taxReturnBase" value="0" />
<input type="hidden" name="currency" value="COP" />
<input type="hidden" name="amount" value="{{Cart::total()}}" />
<input type="hidden" name="tax" value="0" />
<input type="hidden" name="description" value="Blizzard Entertainment" />
<input type="hidden" name="responseUrl" value="http://localhost:8000/payu/response" />
<input type="hidden" name="merchantId" value="500238" />
<input type="hidden" name="signature" value="{{$f}}" />
<button class="btn btn-primary btn-wide" id="payment-submit" data-gtm-id="payment-submit" tabindex="1">Continuar a PayU</button>
</form>

					<form method="post" action="https://gateway.payulatam.com/ppp-web-gateway" accept-charset="UTF-8">
  <input type="image" border="0" alt="" src="http://www.payulatam.com/img-secure-2015/boton_pagar_grande.png" onClick="this.form.urlOrigen.value = window.location.href;"/>
<?php    $sig = "FkS99SYEYsrO52J20y398S7eRC~553848~TestEder2~".Cart::total()."~COP"; $f = md5($sig); ?>
  <input name="merchantId" type="hidden" value="553848"/>
  <input name="accountId" type="hidden" value="556195"/>
  <input name="description" type="hidden" value="Pago 1"/>
  <input name="referenceCode" type="hidden" value="TestEder2"/>
  <input name="amount" type="hidden" value="{{Cart::total()}}"/>
  <input name="tax" type="hidden" value="0"/>
  <input name="taxReturnBase" type="hidden" value="0"/>
<input name="shipmentValue" value="0" type="hidden"/>
  <input name="currency" type="hidden" value="COP"/>
  <input name="lng" type="hidden" value="es"/>
  <input name="sourceUrl" id="urlOrigen" value="" type="hidden"/>
  <input name="buttonType" value="SIMPLE" type="hidden"/>
 <input name="test"          type="hidden"  value="0" >
  <input name="signature" value="{{$f}}" type="hidden"/>
 <input name="buyerEmail"    type="hidden"  value="ederalvarez2009@hotmail.com" >
   <input name="confirmationUrl"    type="hidden"  value="http://localhost:8000" >
</form>



<?php  $refCod = "eder-".date('YmdHms');$sig = "6u39nqhq8ftd0hlvnjfs66eh8c~500238~".$refCod."~".Cart::total()."~COP"; $e = md5($sig);?>
	<form method="post" action="https://stg.gateway.payulatam.com/ppp-web-gateway/">
  <input name="merchantId"    type="hidden"  value="500238"   >
  <input name="accountId"     type="hidden"  value="500537" >
  <input name="description"   type="hidden"  value="Test PAYU"  >
  <input name="referenceCode" type="hidden"  value="{{$refCod}}" >
  <input name="amount"        type="hidden"  value="{{Cart::total()}}"   >
  <input name="tax"           type="hidden"  value="0"  >
  <input name="taxReturnBase" type="hidden"  value="0" >
  <input name="currency"      type="hidden"  value="COP" >
  <input name="signature"     type="hidden"  value="{{$e}}"  >
  <input name="test"          type="hidden"  value="1" >
  <input name="buyerEmail"    type="hidden"  value="{{Auth::user()->email}}" >
  <input name="responseUrl"    type="hidden"  value="{{URL::route('pur')}}" >
  <input name="confirmationUrl"    type="hidden"  value="http://www.morenoyalvarez.com/payu/confirmation" >
  <input name="Submit"        type="submit"  value="PAGAR PAYU" >
</form>
{{--http://localhost:8000/checkout?merchantId=553848&merchant_name=ivan+jose+rojas+cabrales&merchant_address=cll+22+n+21-37+apto+906&telephone=3015673205&merchant_url=&transactionState=4&lapTransactionState=APPROVED&message=APPROVED&referenceCode=TestEder&reference_pol=102385282&transactionId=79991a13-ae86-4380-986d-70f5d0505a52&description=Pago+1&trazabilityCode=345744429&cus=345744429&orderLanguage=es&extra1=&extra2=&extra3=&polTransactionState=4&signature=95c7def631b35a40291750157cd16093&polResponseCode=1&lapResponseCode=APPROVED&risk=.00&polPaymentMethod=28&lapPaymentMethod=MASTERCARD&polPaymentMethodType=2&lapPaymentMethodType=CREDIT_CARD&installmentsNumber=1&TX_VALUE=9999.20&TX_TAX=.00&currency=COP&lng=es&pseCycle=&buyerEmail=ederalvarez2009%40hotmail.com&pseBank=&pseReference1=&pseReference2=&pseReference3=&authorizationCode=930001&processingDate=2016-01-09



local

http://localhost:8000/payu/response?merchantId=500238&merchant_name=Test+PayU+Test&merchant_address=Av+123+Calle+12&telephone=7512354&merchant_url=http%3A%2F%2Fpruebaslapv.xtrweb.com&transactionState=4&lapTransactionState=APPROVED&message=Aprobada&referenceCode=Testeder&reference_pol=7731673&transactionId=d39af30d-aebd-4e61-8e87-24a6b9576289&description=Test+PAYU&trazabilityCode=00000000&cus=00000000&orderLanguage=es&extra1=&extra2=&extra3=&polTransactionState=4&signature=4f68fdab6c1768727508048b3a34aa3a&polResponseCode=1&lapResponseCode=APPROVED&risk=1.00&polPaymentMethod=229&lapPaymentMethod=MASTERCARD&polPaymentMethodType=2&lapPaymentMethodType=CREDIT_CARD&installmentsNumber=1&TX_VALUE=3.00&TX_TAX=.00&currency=USD&lng=es&pseCycle=&buyerEmail=test%40test.com&pseBank=&pseReference1=&pseReference2=&pseReference3=&authorizationCode=00000000&processingDate=2016-02-26
--}}

		</div>


		{{--Payu::payuBottom()->setTest(1);
		1095810636
   	Payu::payuBottom()->setApikey('6u39nqhq8ftd0hlvnjfs66eh8c');
   	Payu::payuBottom()->setMerchantid(500238);
   	Payu::payuBottom()->setUrlgate('https://stg.gateway.payulatam.com/ppp-web-gateway/');
   	Payu::payuBottom()->setAccountid(500537);
   	http://www.grimmstories.com/es/grimm_cuentos/la_novia_del_bandolero	--}}
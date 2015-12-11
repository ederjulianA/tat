<div class="col-md-5">
					<!-- Medoto envio Panel Starts -->
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Medio de pago
								</h3>
							</div>
							
							<input type="hidden"id="ajaxLoadPayment" value="{{URL::route('ajaxLoadPayment')}}">
							<input type="hidden"id="ajaxLoadPaymentU" value="{{URL::route('ajaxLoadPaymentU')}}">
							<div class="panel-body">
								<select class="select_envio select_error" name="tipo_pago" id="tipo_pago">
									<option value="0">ESCOJA UNA OPCIÓN </option>
									<option value="1">Paypal </option>
									<option value="2">PayU </option>
									
								</select>
								<!--RUTA TAT{{Form::radio('tipo_compra', '1','',array('id'=>'slc_envio'))}}
								inmediata{{Form::radio('tipo_compra', '2','',array('id'=>'slc_envio'))}}-->
								<hr />
							
								
								
							</div>
							<div class="text-uppercase clearfix" id="msg-ajax">
									
								</div>
						</div>
					<!-- Total Panel Ends -->

					<div id="load-content">
							



					</div><!-- END LOAD CONTENT-->
					
				</div>
				
			</div>
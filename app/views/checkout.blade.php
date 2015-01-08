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

		@if(Auth::check())
			<div class="row">
				<div class="col-md-9">
					<h2>Confirma tus datos</h2>

					
				</div>
				<div class="col-md-3">

					
				</div>
				
			</div>
		@else
			<div class="row">
				<div class="col-md-7">
					<h2>Crear Cuenta TAT</h2>
						
					
				</div>
				<div class="col-md-5">
				<!-- Medoto envio Panel Starts -->
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Metodo de envio
								</h3>
							</div>
							<div class="panel-body">
								<select class="select_envio select_error" id="slc_envio">
									<option value="0">ESCOJA UNA OPCIÓN </option>
									<option value="1"> RUTA TAT</option>
									<option value="2"> INMEDIATA</option>
								</select>
								<hr />
							
								
								<div class="text-uppercase clearfix" id="msg-ajax">
									
								</div>
							</div>
						</div>
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
									<dt>Shipment Fee :</dt>
									<input type="hidden" id="totalCart" value="{{Cart::total()}}">
									<dd>$15.00</dd>
									<dt>Tax Total :</dt>
									<dd>$315.00</dd>
								</dl>
								<hr />
								<dl class="dl-horizontal total">
									<dt>Total :</dt>
									<dd>$ <span id="totalP">{{number_format(Cart::total(), 0, '', '.')}}</span></dd>
								</dl>
								<hr />
								<div class="text-uppercase clearfix">
									<a href="#" class="btn btn-default pull-left">
										<span class="hidden-xs">Continue Shopping</span>
										<span class="visible-xs">Continue</span>
									</a>
									<a href="#" class="btn btn-default pull-right">		
										Checkout
									</a>
								</div>
							</div>
						</div>
					<!-- Total Panel Ends -->


					
				</div>
				
			</div>
		@endif
	

		
@stop
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
				<div class="col-md-7">
					@if($datos != null)
						@include('includes.forms.datos')
					@else
						@include('includes.forms.noDatos')
					@endif
					 
					
				</div>
				<!--INCLUIR EL RESUMEN DEL CHECKOUT######################################-->
				@include('includes.resumenCheckout')
				
			</div>
		@else
			<div class="row">
				<div class="col-md-7">
							<!-- Form registro y login  Panel Starts -->
								@include('includes.forms.formRegLog')
							<!-- Form registro y login Panel Ends -->

						
					
				</div>

				<!--INCLUIR EL RESUMEN DEL CHECKOUT######################################-->
				@include('includes.resumenCheckout')
				
		@endif
	

		
@stop
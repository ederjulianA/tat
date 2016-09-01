@extends('layouts.cotra')

{{--@section('menu')
	@include('includes.cotracolta.pri.menu')
@stop--}}

@section('content')

	 <div class="content margin-top60 margin-bottom60">
	  @if(Session::has('message-alert'))
				<div class="row">
					
						 

			            <div class="alert alert-warning alert-dismissable">
			              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			              <strong>Mensaje</strong> {{Session::get('message-alert')}}
			            </div>

			            <!--<p class="mensajes-flash" style="" data-dismiss="alert"id="mensaje-flash"> {{Session::get('message-alert')}}
			                
			            </p>-->
			    
					
				</div>
			@endif
                    <div class="container">
                        <div class="row">
                            <!-- Content -->
                            <div class="content col-sm-4 col-md-4">
                                <!-- check out steps -->
                                <ul id="checkoutsteps" class="clearfix panel-group">
                                    <!-- Panel 1 -->
                                    @if(!Auth::check())
                                    <li class="panel">
                                        <a href="#step-1" class="step-title" data-parent="#checkoutsteps" data-toggle="collapse">
                                            <div class="number"></div>
                                            <h6>Login</h6>
                                        </a>
                                        <div id="step-1" class="collapse in">
                                            <div class="step-content">
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-12 bottom-padding-mobile">
                                                        <h3 class="title">Registro o login</h3>
                                                        <p>Regístrate</p>
                                                        <div class="register-radio">
                                                            <label class="radio"><input type="radio" name="register">Checkout como invitado</label>
                                                            <label class="radio"><input type="radio" name="register"> Registro</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-12">
                                                        <h3 class="title">Login</h3>
                                                        <p>Si ya tienes cuenta con nosotros, loguéate.</p>
                                                        <form class="checkout-login" action="{{URL::route('postLogin')}}" method="post">
                                                            <input class="form-control" placeholder="Email" type="email" name="email" required>    
                                                            <input class="last form-control" placeholder="Contraseña" type="password" name="password" required>
                                                            <label class="checkbox">
                                                            <input type="checkbox"> Recordar contraseña
                                                            </label>

                                                            <div class="clearfix"></div>
                                                        <div class="buttons-box clearfix">
                                                            <button type="submit" class="btn btn-color">Login</button>
                                                            <a href="#" class="forgot">Olvidaste tu contraseña?</a>
                                                            <span class="required"><b>*</b> Campos requeridos</span>
                                                        </div>
                                                        </form>
                                                        <!-- /checkout-login -->
                                                        
                                                        <!-- /buttons-box -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                     <!-- /Panel 1 -->
                                     <!-- Panel 2 -->
                                    <li class="panel">
                                        <a href="#step-2" class="collapsed step-title" data-parent="#checkoutsteps" data-toggle="collapse">
                                            <div class="number"></div>
                                            <h6>Registro</h6>
                                        </a>
                                        <div id="step-2" class="collapse">
                                            <div class="step-content">
                                                <form class="row no-margin" method="post" action="/register/new/user">
                                                    <div class="col-sm-12 col-md-12">
                                                        {{ Form::text('nombre','',array('class'=>'form-control','name'=>'nombre','placeholder'=>'nombre')) }}
                                                             {{ $errors->first('nombre','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="col-sm-12 col-md-12">
                                                        {{ Form::text('apellido','',array('class'=>'form-control','name'=>'apellido','placeholder'=>'apellido')) }}
                                            {{ $errors->first('apellido','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-sm-12 col-md-12">
                                                        {{ Form::text('NitSec','',array('class'=>'form-control','name'=>'NitSec','placeholder'=>'Cedula')) }}
                                            {{ $errors->first('NitSec','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-sm-12 col-md-12">
                                                        {{ Form::text('telefono','',array('class'=>'form-control','name'=>'telefono','placeholder'=>'telefono')) }}
                                            {{ $errors->first('telefono','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="col-sm-12 col-md-12">
                                                        {{ Form::text('direccion','',array('class'=>'form-control','name'=>'direccion','placeholder'=>'direccion')) }}
                                            {{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-sm-12 col-md-12">
                                                        {{ Form::email('email','',array('class'=>'form-control','name'=>'email','placeholder'=>'Email')) }}
                                            {{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-sm-12 col-md-12">
                                                        <input type="password" class="form-control" name="password" id="inputPassword" placeholder="******">
                                            {{ $errors->first('password','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="col-sm-12 col-md-12">
                                                        <input type="password" class="form-control" name="password_confirmation" id="inputRePassword" placeholder="******">
                                            {{ $errors->first('password_confirmation','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <input type="checkbox" name="terminos"> He leído y acepto los términos y condiciones de servicio 

                                                    {{ $errors->first('terminos','<p class="alert alert-danger">:message</p>') }}
                                                    <div class="col-sm-12 buttons-box text-right">
                                                        <button type="submit" class="btn btn-color">Continuar</button>
                                                        <span class="required"><b>*</b> Campos requeridos</span>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Panel 2 -->


                                    @else
                                    <!-- Panel 3 -->
                                    <li class="panel">
                                        <a href="#step-3" class="step-title" data-parent="#checkoutsteps" data-toggle="collapse">
                                            <div class="number"></div>
                                            <h6>Información comprador</h6>
                                        </a>
                                        <div id="step-3" class="collapse">
                                            <div class="step-content">
                                                <form class="row no-margin" method="post" action="{{URL::route('postUpdateData')}}">
                                                    <div class="col-sm-6 col-md-6">
                                                        <input class="form-control" placeholder="Nombre" type="text" name="nombre" value="{{$datos->nombre}}">
                                                        {{ $errors->first('nombre','<p class="alert alert-danger">:message</p>') }}
                                                        <input type="hidden" id="NitSec" value="{{Auth::user()->NitSec}}">
                                                    </div>
                                                    <div class="col-sm-6 col-md-6">
                                                        <input class="form-control" placeholder="Apellido" type="text" value="{{$datos->apellido}}" name="apellido">
                                                        {{ $errors->first('apellido','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    
                                                    <div class="col-sm-6 col-md-6">
                                                        {{ Form::text('telefono',$datos->telefono,array('class'=>'form-control','name'=>'telefono','placeholder'=>'')) }}
												{{ $errors->first('telefono','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-sm-6 col-md-6">
                                                        {{ Form::text('direccion',$datos->direccion,array('class'=>'form-control','name'=>'direccion','placeholder'=>'')) }}
												{{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="col-sm-6 col-md-6">
                                                        {{ Form::text('nit',$datos->cedula,array('class'=>'form-control','name'=>'nit','placeholder'=>'')) }}
												{{ $errors->first('nit','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-sm-6 col-md-6">
                                                        <input class="form-control" placeholder="Código postal" type="text">
                                                    </div>
                                                    <div class="col-sm-6 col-md-6">
                                                        {{ Form::select('ciudad_id', $ciudades, $datos->ciudad, ['class'=>'form-control','id'=>'ciudad_id']) }}
												<!--<a id="d_entrega">Consultar dias de entrega </a>-->
												{{ $errors->first('ciudad_id','<p class="alert alert-danger">:message</p>') }}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-sm-12 buttons-box text-right">
                                                    	<input type="hidden" name="canal_id" value="0">
                                                    	<input type="hidden" name="barrio_id" value="1">
                                                        <button type="submit" class="btn btn-color">Actualizar</button>
                                                        <span class="required"><b>*</b> Campo requerido</span>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Panel 3 -->

                                    @endif
                                   

                                    
                                    
                                <!-- /check out steps -->
                            </div>
                            <!-- /content -->

                           
                            <!-- Content -->
                            <div class="content col-sm-4 col-md-4">
                                <!-- check out steps -->
                                <ul id="checkoutsteps" class="clearfix panel-group">
                                       
                                     <li class="panel">
                                        <a href="#step-6" class="collapsed step-title" data-parent="#checkoutsteps" data-toggle="collapse">
                                            <div class="number"></div>
                                            <h6>Resumen de pedido</h6>
                                        </a>
                                        <div id="step-6" class="collapse">
                                            <div class="step-content">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>Nombre producto</th>
                                                                <th>Precio</th>
                                                                <th>Cantidad</th>
                                                                <th>Subtotal</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        	@if($products)
																@foreach($products as $pro)
		                                                            <tr>
		                                                                <td>{{$pro->name}}</td>
		                                                                <td>${{number_format(Funciones::getPriceIva($pro->price,$pro->tax), 0, '', '.')}}</td>
		                                                                <td>{{$pro->quantity}}</td>
		                                                                <td>${{number_format($pro->total(), 0, '', '.')}}</td>
		                                                            </tr>
		                                                         @endforeach
		                                                     @endif       
                                                           
                                                            <tr>
                                                                <td colspan="3">Subtotal</td>
                                                                <td>${{number_format(Cart::total(false), 0, '', '.')}}</td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">Total</td>
                                                                <td>${{number_format(Cart::total(), 0, '', '.')}}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <button type="button" class="btn btn-color">Confirmar</button>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Panel 6 -->
                                <!-- /check out steps -->
                            </div>
                            <!-- /content -->

                            <!-- sidebar -->
                            <div id="sidebar" class="col-sm-3 col-md-3 sidebar checkout-progress">
                                <aside class="widget">
                                    <header>
                                        <h3 class="title">Datos Checkout</h3>
                                    </header>
                                    <ul class="progress-list">
                                        <li class="active"><a href="#" class="edit"><i class="fa fa-pencil"></i> Editar</a> Método Checkout</li>
                                        {{-- PAYPAL--}}
                                        	@if(Auth::check())
                                        		<li>
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
									
									<input type="hidden" id="totalCart" name="totalCart" value="{{Cart::total()}}">
									<input type="hidden" id="totalCart"name="totalItems" value="{{Cart::totalItems()}}">
									<input type="hidden" id="total_compra" name="total_compra" value="{{Cart::total()}}">
									<input type="hidden" id="vlr_envio_a" name="vlr_envio_a" value="0">
									
								</dl>
								<hr />
								<dl class="dl-horizontal total">
									<dt>Total :</dt>
									<dd>$ <span id="totalP">{{number_format(Cart::total(), 0, '', '.')}}</span></dd>
									<input type="hidden" id="total_compra" name="total_compra" value="{{Cart::total()}}">
								</dl>
								<hr />
							
									<button type="submit" class="paypalBtn">PAGAR con paypal</button> 
								
							</div>
									
									
						</form>
                                        		</li>


                                        		<li>
                                        			

                                        			<?php  $refCod = "eder-".date('YmdHms');$sig = "4Vj8eK4rloUd272L48hsrarnUA~508029~".$refCod."~".Cart::total()."~COP"; $e = md5($sig);?>
	<form method="post" action="https://sandbox.gateway.payulatam.com/ppp-web-gateway" id="formPayu">
    {{--<form method="post" action="{{URL::route('purconfirmation2')}}">6u39nqhq8ftd0hlvnjfs66eh8c--}}
    {{--<form method="post" action="https://sandbox.gateway.payulatam.com/ppp-web-gateway/">--}}
  {{--<input name="merchantId"    type="hidden"  value="500238" >
  <input name="accountId"     type="hidden"  value="500537" >--}}
  <input name="merchantId"    type="hidden"  value="508029" >
  <input name="accountId"     type="hidden"  value="512322" >
  <input name="description"   type="hidden"  value="Test PAYU"  >
  <input name="referenceCode" type="hidden"  id="code" value="{{$refCod}}" >
  <input name="amount"        type="hidden"  value="{{Cart::total()}}"   >
  <input name="tax"           type="hidden"  value="0"  >
  <input name="taxReturnBase" type="hidden"  value="0" >
  <input name="currency"      type="hidden"  value="COP" >
  <input name="signature"     type="hidden" id="sig"  value="{{$e}}"  >
  <input name="test"          type="hidden"  value="1" >
    <input name="extra1"          type="hidden"  value="{{Auth::user()->id}}">
   <input name="extra3"          type="hidden"  value="{{Funciones::getCodigos()}}">
     {{--<input name="extra3"          type="hidden"  value="{{Cart::totalItems()}}">--}}
    <input name="extra2"type="hidden"  value="{{Cart::totalItems()}}">
  <input name="buyerEmail"    type="hidden"  value="{{Auth::user()->email}}">
  <input name="responseUrl"    type="hidden"  value="{{URL::route('pur')}}">
  <input name="confirmationUrl"    type="hidden"  value="{{URL::route('purconfirmation')}}" >
  <input type="image" id="btnPayu" border="0" alt="" src="http://www.payulatam.com/img-secure-2015/boton_pagar_grande.png"/>
  
</form>
<input type="hidden" id="UrlPedTem" value="{{URL::route('UrlPedTem')}}">
                                        		</li>

                                                <li>
                                                    

 

                                                </li>
                                        	@else
                                        		<li>Inicia sesión para finalizar la compra</li>
                                        	@endif
                                        {{--ENDPAYPAL--}}	



                                        <li><a href="#" class="edit"><i class="fa fa-pencil"></i> Editar</a>Método de envío</li>
                                    </ul>
                                </aside>
                            </div>
                            <!-- /sidebar -->
                        </div>
                    </div>
                </div>
                <!-- /Main Content -->


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
@stop
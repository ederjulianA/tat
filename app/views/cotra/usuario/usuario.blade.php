@extends('layouts.cotra')


@section('menu')
	@include('includes.cotracolta.pri.menu')
@stop

@section('content')
	<div class="wrap">
       
            <!-- Main Content -->
                <div class="content margin-top60 margin-bottom60">
                    <div class="container">
                        <div class="row">
                            <!-- My Order Table -->
                            <div class="col-sm-9 col-md-9 col-lg-9">
                                <div class="my-account">
                                    <div class="bottom-padding">
                                        <h3 class="hello">Hola {{$shipping->nombre}}!</h3>
                                        <p>
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
                                        </p>
                                    </div>
                                    <div class="bottom-padding">
                                        <div class="title-box">
                                            <h3>Mis órdenes</h3>
                                        </div>
                                        <!-- Table  -->
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-responsive text-left my-orders-table">
                                                <thead>
                                                    <tr class="first last">
                                                        <th>#</th>
                                                        <th>Fecha</th>
                                                        
                                                        <th><span class="nobr">Total de la orden</span></th>
                                                        <th>Estado</th>
                                                        <th class="text-center">¿Qué quieres hacer?</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach($pedidos as $pedido)
                                                    
                                                        <tr>
                                                            <td>{{$pedido->id}}</td>
                                                            <td>{{$pedido->created_at}}</td>
                                                           
                                                            <td><span class="price">${{number_format($pedido->total_compra, 0, '', '.')}}</span></td>
                                                            <td class="text-primary"><em>{{$pedido->nom_est}}</em></td>
                                                            <td class="text-center last">
                                                                <div class="btn-group">
                                                                    <a href="/micuenta/orden/{{$pedido->id}}" class="btn btn-color">Ver orden</a>
                                                                    @if($pedido->estado_id == 1)
                                                                    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#payAgai">Pagar</a>
                <div class="modal register fade" id="payAgai" tabindex="-1" role="dialog" aria-labelledby="registrationModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h2 class="form-signin-heading modal-title" id="registrationModalLabel">Pagar Orden</h2>
                        </div>
                        
                                <div class="modal-body">
                                    <div class="row">
                                        <h3>Orden #{{$pedido->id}}</h3>
                                       <p>
                            <form action="{{URL::route('paymentAgain')}}" method="post" accept-charset="utf-8">
                              
                                <div class="panel-body">
                               
                                    
                                    <hr />

                                    <dl class="dl-horizontal">
                                    
                                    <input type="hidden" id="totalCart" name="totalCart" value="{{$pedido->total_compra}}">
                                    <input type="hidden" id="totalCart"name="totalItems" value="{{$pedido->num_items}}">
                                    <input type="hidden" id="total_compra" name="total_compra" value="{{$pedido->total_compra}}">
                                    <input type="hidden" id="vlr_envio_a" name="vlr_envio_a" value="">
                                    <input type="hidden" id="id" name="id" value="{{$pedido->id}}">
                                    
                                </dl>
                                <hr />
                                <dl class="dl-horizontal total">
                                    <dt>Total :</dt>
                                    <dd>$ <span id="totalP">{{number_format($pedido->total_compra, 0, '', '.')}}</span></dd>
                                    <input type="hidden" id="total_compra" name="total_compra" value="{{$pedido->total_compra}}">
                                </dl>
                                <hr />
                            
                                    <button type="submit" class="">PAGAR con paypal</button> 
                                
                            </div>
                                    
                                    
                        </form>
                                           {{--PAYPAL--}}

<?php  $refCod = "eder-".date('YmdHms').'-'.$pedido->id;
$sig = "4Vj8eK4rloUd272L48hsrarnUA~508029~".$refCod."~".$pedido->total_compra."~COP";
 $e = md5($sig);?>
    <form method="post" action="https://sandbox.gateway.payulatam.com/ppp-web-gateway" id="formPayu">
    {{--<form method="post" action="{{URL::route('purconfirmation2')}}">6u39nqhq8ftd0hlvnjfs66eh8c--}}
    {{--<form method="post" action="https://sandbox.gateway.payulatam.com/ppp-web-gateway/">--}}
  {{--<input name="merchantId"    type="hidden"  value="500238" >
  <input name="accountId"     type="hidden"  value="500537" >--}}
  <input name="merchantId"    type="hidden"  value="508029" >
  <input name="accountId"     type="hidden"  value="512322" >
  <input name="description"   type="hidden"  value="Test PAYU"  >
  <input name="referenceCode" type="hidden"  id="code" value="{{$refCod}}" >
  <input name="amount"        type="hidden"  value="{{$pedido->total_compra}}"   >
  <input name="tax"           type="hidden"  value="0"  >
  <input name="taxReturnBase" type="hidden"  value="0" >
  <input name="currency"      type="hidden"  value="COP" >
  <input name="signature"     type="hidden" id="sig"  value="{{$e}}"  >
  <input name="test"          type="hidden"  value="1" >
    <input name="extra1"          type="hidden"  value="{{Auth::user()->id}}">
   <input name="extra3"          type="hidden"  value="{{Funciones::getCodigos()}}">
     {{--<input name="extra3"          type="hidden"  value="{{Cart::totalItems()}}">--}}
    <input name="extra2"type="hidden"  value="{{$pedido->num_items}}">
  <input name="buyerEmail"    type="hidden"  value="{{Auth::user()->email}}">
  <input name="responseUrl"    type="hidden"  value="{{URL::route('pur')}}">
  <input name="confirmationUrl"    type="hidden"  value="{{URL::route('purconfirmation')}}" >
  <input type="image" id="btnPayu2" border="0" alt="" src="http://www.payulatam.com/img-secure-2015/boton_pagar_grande.png"/>
  
</form>

<input type="hidden" id="UrlPedTem2" value="{{URL::route('UrlPedTem2')}}">
<input type="hidden" id="com_id"           value="{{$pedido->id}}">



                                       </p>
                                    </div>
                                   
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    <button type="button" class="btn btn-color">Registrarse</button>
                                </div>
                            
                        </div>
                    </div>
                </div>
                                                                    @endif
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    @endforeach    
                                                    {{--<tr>
                                                        <td>100000022</td>
                                                        <td>4/30/14</td>
                                                        <td>Mr. Cliente</td>
                                                        <td><span class="price">$1,306.84</span></td>
                                                        <td class="text-primary"><em>Nuevo</em></td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-color">Ver orden</a>
                                                                <a href="#" class="btn btn-default">Re ordenar</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>100000022</td>
                                                        <td>4/30/14</td>
                                                        <td>Mr. Cliente</td>
                                                        <td><span class="price">$1,306.84</span></td>
                                                        <td class="text-primary"><em>Cancelado</em></td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-color">Ver orden</a>
                                                                <a href="#" class="btn btn-default">Re ordenar</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>100000019</td>
                                                        <td>3/02/14</td>
                                                        <td>Mr. Cliente</td>
                                                        <td><span class="price">$1105.02</span></td>
                                                        <td class="text-warning"><em>Pendiente</em></td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-color">Ver orden</a>
                                                                <a href="#" class="btn btn-default">Re ordenar</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>100000018</td>
                                                        <td>3/02/14</td>
                                                        <td>Mr. Cliente</td>
                                                        <td><span class="price">$202.50</span></td>
                                                        <td class="text-color"><em>Terminado</em></td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-color">Ver orden</a>
                                                                <a href="#" class="btn btn-default">Re ordenar</a>
                                                            </div>
                                                        </td>
                                                    </tr>--}}
                                                </tbody>
                                            </table>

                                            {{$pedidos->links()}}
                                        </div>
                                        <!-- /Table  -->
                                    </div>
                                    {{--<div class="title-box">
                                        <h2 class="title">Información de la cuenta</h2>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 info-box">
                                            <h3 class="subtitle">Información de contacto</h3>
                                            <p>
                                                Mr. Cliente<br>
                                                mr-cliente@mail.com<br>
                                                <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Cambiar contraseña</a>
                                            </p>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h3 class="subtitle">Direcciones</h3>
                                            <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Editar direcciones</a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-sm-6 col-md-6">
                                            <h3 class="subtitle">Editar dirección de envío</h3>
                                            <address>
                                                Mr. Cliente<br>
                                                Dirección<br>
                                                Bucaramanga, Santander<br>
                                                Colombia<br>
                                                <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Editar</a>
                                            </address>
                                        </div>
                                    </div>--}}
                                </div>
                            </div>
                            <!-- /My Order Table -->
                            <!-- Sidebar -->
                             @include('includes.cotracolta.pri.sidebar')
                            <!-- /Sidebar -->
                        </div>
                    </div>
                </div>
                <!-- Main Content -->
    
            <!-- Footer -->
         


@stop
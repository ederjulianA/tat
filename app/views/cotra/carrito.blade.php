@extends('layouts.cotra')

@section('menu')
	@include('includes.cotracolta.pri.menu2')
@stop


@section('content')
<style type="text/css" media="screen">
    .error{
        
        border: 2px solid #EE5E5E !important;
    }
    
</style>
<input type="hidden" id="urlValDis" value="{{URL::route('urlValDis')}}">
<input type="hidden" id="urlSaveArt" value="{{URL::route('urlSaveArt')}}">
	  <!-- Main Content -->
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
                            <div class="col-sm-12 col-md-12">
                                <div class="table-box">
                                    <!-- shopping-cart-table -->
                                    <table class="shopping-cart-table responsive-table table table-bordered table-striped" id="shopping-cart-table">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th class="td-name">Nombre producto</th>
                                                {{--<th></th>--}}
                                                <th class="td-price">Precio unitario</th>
                                                <th class="td-total">Cantidad</th>
                                                <th class="td-qty">Subtotal</th>
                                                <th class="td-remove"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	@if($products)
												@foreach($products as $pro)
	                                            <tr id="item-{{$pro->ArtSec}}" class="">
	                                                <td class="td-images">
	                                                    <a class="product-image" href="shop-product-view.html">
	                                                    <img width="auto" height="70" title="" alt="" src="{{asset($pro->image)}}">
	                                                    </a>
	                                                </td>
	                                                <td class="td-name">
	                                                    <a href="#">{{$pro->name}}---{{$pro->ArtCod}} </a>
                                                        <div id="ajaxMsg-{{$pro->ArtSec}}" class="msgAjax" data="{{$pro->ArtSec}}">

                                                            
                                                        </div>
	                                                </td>
	                                                {{--<td class="td-edit">
	                                                    <a class="edit" href="#"><i class="fa fa-pencil"></i> Editar</a>
	                                                </td>--}}
	                                                <td class="td-price">
	                                                    <div class="price idSync" data="{{$pro->ArtSec}}"><span id="precio-{{$pro->id}}">${{--{{number_format(Funciones::getPriceIva($pro->price,$pro->tax), 0, '', '.')}}--}}
                                                        {{number_format($pro->valIva,0,'','.')}}</span></div>
	                                                </td>
	                                                <td class="td-qty">
	                                                   <input type="number" name="cantidad"  width="100px" class="cant input-quantity" togle="{{$pro->identifier}}" id="can-{{rtrim($pro->ArtSec)}}" data="{{rtrim($pro->ArtSec)}}" value="{{$pro->quantity}}" size="1" class="form-control" />
	                                                </td>
	                                                <td class="td-total">
	                                                    <div class="price">$ <span class="itemTotal-{{$pro->ArtSec}}">{{number_format($pro->total(), 0, '', '.')}}</span></div>
	                                                </td>
	                                                <td class="td-remove">
	                                                    
	                                                    <form  method="post" action="{{URL::route('removeItem', array('identifier'=>$pro->identifier))}}">		
										<button type="submit" title="Remove" class="btn btn-default tool-tip">
											<i class="fa fa-trash-o"></i>
										</button>
									</form>
	                                                </td>
	                                            </tr>
	                                            @endforeach
	                                         @endif   
                                            
                                        </tbody>
                                    </table>
                                    <!-- /shopping-cart-table -->
                                </div>
                                <table class="shopping-cart-table shopping-cart-table-button table">
                                    <tbody>
                                        <tr>
                                            <td class="action no-border">
                                                <a href="{{URL::route('catalogo')}}" class="btn btn-default"><i class="fa fa-angle-left"></i> Continuar comprando</a>
                                                <a class="update btn btn-color pull-right" href="{{URL::route('cart')}}"><i class="fa fa-rotate-right"></i> Actualizar</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row" id="car-bottom">
                            <div class="col-sm-4 col-md-4 pull-left">
                                 <label class="checkbox">
                                  <input type="checkbox"> <a href="#">Acepto los términos y condiciones</a> 
                                 </label>
                            </div>
                            <div class="col-sm-4 col-md-4 pull-right" >
                                <div class="car-bottom-box bg total">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <h3>Sub Total : </h3>
                                                </td>
                                                <td>
                                                    <h3>$<span class="totalCartTax">{{number_format(Cart::total(false), 0, '', '.')}}</span></h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h3>Total :  </h3>
                                                </td>
                                                <td>
                                                    <h3>$<span class="totalCart">{{number_format(Cart::total(), 0, '', '.')}}</span></h3>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>
                                        <a class="btn  btn-color"id="btnGoCheck"  href="{{URL::route('checkout')}}">Ir al Checkout</a><br>   
                                    </div>
                                </div>
                            </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <!-- /Main Content -->
            </section>
            <!-- /Main Section -->
@stop

@section('scripts')
    <script src="{{asset('tat/js/val-cant.js')}}"></script>
@stop
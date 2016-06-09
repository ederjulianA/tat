@extends('layouts.cotra')

@section('menu')
	@include('includes.cotracolta.pri.menu')
@stop

@section('content')
    <input type="hidden" id="urlSaveArt" value="{{URL::route('urlSaveArt')}}">
	<div class="row carousel-holder">
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

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="{{asset('cot/img/slider/b1.jpg')}}" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="{{asset('cot/img/slider/b2.jpg')}}" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="{{asset('cot/img/slider/b3.jpg')}}" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>

                <!-- Slider End--> 
                
                <!-- /Product Lead--> 
                <!-- Products List-->
                <div class="related-product margin-top60 margin-bottom70">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="text-center">
                                    <h2 class="wow fadeIn">Productos destacados</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 wow fadeIn">
                                <div id="product-carousel" class="product-carousel carousel slide">
                                    <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="product-grid">
                                                    <div class="products-block">
                                                        <div class="row product-items">
                                                        @foreach($productos as $producto)
                                                            <!-- Single Product  -->
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 product-cols first">
                                                                <div class="product-block">
                                                                    <div class="image ">
                                                                        <span class="product-label product-label-special">
                                                                        <span>50%</span>
                                                                        </span>
                                                                        <!-- Swap image -->
                                                                        <div class="flip">
                                                                            <a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}" class="swap-image">
                                                                            <img src="{{asset($producto->img)}}" title="iPhone 5s 64 GB" alt="iPhone 5s 64 GB" class="front">
                                                                            </a>
                                                                        </div>
                                                                        <a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}" class="pav-colorbox btn btn-theme-default cboxElement"><em class="fa fa-plus"></em><span>Ver producto</span></a>
                                                                    </div>
                                                                    <div class="product-meta">
                                                                        <div class="left">
                                                                            <h3 class="name"><a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}">{{$producto->pro_nom}}</a></h3>
                                                                            <div class="price">
                                                                                <span class="price-old">1'200.000</span>
                                                                                <span class="price-new idSync" data="{{$producto->ArtSec}}" id="pro-{{$producto->ArtSec}}">{{ number_format($producto->precio, 0, '', '.') }}</span>
                                                                                {{--<span class="price-new">${{ number_format($producto->precio, 0, '', '.') }}</span>--}}
                                                                            </div>
                                                                        </div>
                                                                        <div class="right">
                                                                            <div class="action">
                                                                                <div class="cart">
                                                                                    <!-- <input type="button" value="" onclick="addToCart('');" class="product-icon fa fa-shopping-cart shopping-cart" /> -->
                                                                                    <button class="btn btn-shopping-cart">
                                                                                    <span class="fa fa-shopping-cart product-icon hidden-sm">&nbsp;</span>
                                                                                    <span><a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}">Agregar al carro</a></span>
                                                                                    </button>
                                                                                </div>
            
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /Single Product  -->
                                                         @endforeach   
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Products List-->
                <!-- services --> 
                <div id="services" class="margin-top80">
                    <div class="pattern-overlay">
                        <div class="container">
                            <div class="row">
                                
                            </div>
                            
                        </div>
                     </div>
                </div>
            </div>
                
            <div class = 'text-center'>
                <img src="{{asset('cot/Img/bannerPublicitario.jpg')}}">                
            </div> 
@stop

@section('scripts')
    <script src="{{asset('tat/js/preciosMantis.js')}}"></script>
@stop
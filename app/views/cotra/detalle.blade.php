@extends('layouts.cotra')

@section('menu')
	@include('includes.cotracolta.pri.menu2')
@stop

@section('meta-data')
    <!-- You can use Open Graph tags to customize link previews.
    Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
    <!--<meta property="og:url"           content="http://tiendo.co/producto/{{$producto->slug}}" />
    <meta property="og:type"          content="website" />
    <meta property="og:title"         content="Articulo | {{$producto->pro_nom}}" />
    <meta property="og:description"   content="Your description" />
    <meta property="og:image"         content="http://www.your-domain.com/path/image.jpg" />-->
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# product: http://ogp.me/ns/product#">
  <meta property="fb:app_id"                       content="302184056577324" /> 
  <meta property="og:type"                         content="product" /> 
  <meta property="og:url"                          content="Put your own URL to the object here" /> 
  <meta property="og:title"                        content="Sample Product" /> 
  <meta property="og:image"                        content="https://s-static.ak.fbcdn.net/images/devsite/attachment_blank.png" /> 
  <meta property="product:original_price:amount"   content="Sample Original Price: " /> 
  <meta property="product:original_price:currency" content="Sample Original Price: " /> 
  <meta property="product:pretax_price:amount"     content="Sample Pre-tax Price: " /> 
  <meta property="product:pretax_price:currency"   content="Sample Pre-tax Price: " /> 
  <meta property="product:price:amount"            content="Sample Price: " /> 
  <meta property="product:price:currency"          content="Sample Price: " /> 
  <meta property="product:shipping_cost:amount"    content="Sample Shipping Cost: " /> 
  <meta property="product:shipping_cost:currency"  content="Sample Shipping Cost: " /> 
  <meta property="product:weight:value"            content="Sample Weight: Value" /> 
  <meta property="product:weight:units"            content="Sample Weight: Units" /> 
  <meta property="product:shipping_weight:value"   content="Sample Shipping Weight: Value" /> 
  <meta property="product:shipping_weight:units"   content="Sample Shipping Weight: Units" /> 
  <meta property="product:sale_price:amount"       content="Sample Sale Price: " /> 
  <meta property="product:sale_price:currency"     content="Sample Sale Price: " /> 
  <meta property="product:sale_price_dates:start"  content="Sample Sale Price Dates: Start" /> 
  <meta property="product:sale_price_dates:end"    content="Sample Sale Price Dates: End" /> 

@stop

@section('content')
    <style type="text/css" media="screen">
        .cont-pro-det{
            /*border: 1px solid #f90;*/
            padding: 10px;
            margin: 0 auto;
            text-align: center;
        }
        .cont-pro-det div{
                vertical-align: middle;
                display: inline-block;
                vertical-align: middle;
                
                min-height: 60px;
                width: 30%;
                margin: 0 auto;

        }

        .cont-pro-det div .precio-t input{
            vertical-align: middle;
        }
        .qty-e{
            width:80px;
            font-weight: bold;
            padding: 5px;
            text-align: center;
            border-radius: 5px;
        }
        #btn_addCart{
            width: 100%;
            padding: 10px;
            font-weight: bold;
            font-size: 18px;
            border-bottom: 5px solid #2D6027 !important;
            letter-spacing: 1px;
            text-shadow: 3px 1px 4px rgba(154, 150, 150, 1);
        }
        
    </style>
    <input type="hidden" id="urlSaveArt" value="{{URL::route('urlSaveArt')}}">
    <input type="hidden" id="urlActDes" value="{{URL::route('urlActDes')}}">
	 <!-- Main Content -->
                <div class="content margin-top60 margin-bottom60">
                    <div class="product-item">
                        <div class="container margin-top60">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <h2>{{$producto->pro_nom}}</h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                    <div class="simpleLens-gallery-container" id="demo-simpleLens-gallery">
                                        <!-- Single Product Image -->
                                        <div class="simpleLens-container">
                                            <div class="simpleLens-big-image-container">
                                                {{--<a class="simpleLens-lens-image" data-lens-image="{{asset('cot/img/shop/products/large/product-01.jpg')}}">--}}
                                                <a class="simpleLens-lens-image" data-lens-image="{{asset($producto->img)}}">
                                                {{--<img src="{{asset('cot/img/shop/products/medium/product-01.jpg')}}" alt="" class="simpleLens-big-image">--}}
                                                <img src="{{asset($producto->img)}}" alt="" class="simpleLens-big-image">
                                                </a>
                                            </div>
                                        </div>
                                        <!-- /Single Product Image -->
                                        <!-- Product Thumbnail -->
                                        {{--}} <div class="simpleLens-thumbnails-container">
                                                <div id="product-zoom-carousel" class="product-zoom-carousel carousel slide">
                                                <div class="carousel-inner">
                                                    <div class="item active">
                                                        <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="{{asset($producto->img)}}" data-big-image="{{asset($producto->img)}}">
                                                        <img alt="" height="100px" width="auto" src="{{asset($producto->img)}}">
                                                        </a>
                                                        <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="img/shop/products/large/product-02.jpg" data-big-image="img/shop/products/medium/product-02.jpg">
                                                        <img alt="" src="img/shop/products/thumbnail/product-02.jpg">
                                                        </a>
                                                        <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="img/shop/products/large/product-03.jpg" data-big-image="img/shop/products/medium/product-03.jpg">
                                                        <img alt="" src="img/shop/products/thumbnail/product-03.jpg">
                                                        </a>
                                                        <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="img/shop/products/large/product-04.jpg" data-big-image="img/shop/products/medium/product-04.jpg">
                                                        <img alt="" src="img/shop/products/thumbnail/product-04.jpg">
                                                        </a>                                                    
                                                    </div>
                                                    <div class="item">
                                                        <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="img/shop/products/large/product-01.jpg" data-big-image="img/shop/products/medium/product-01.jpg">
                                                        <img alt="" src="img/shop/products/thumbnail/product-01.jpg">
                                                        </a>
                                                        <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="img/shop/products/large/product-02.jpg" data-big-image="img/shop/products/medium/product-02.jpg">
                                                        <img alt="" src="img/shop/products/thumbnail/product-02.jpg">
                                                        </a>
                                                        <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="img/shop/products/large/product-03.jpg" data-big-image="img/shop/products/medium/product-03.jpg">
                                                        <img alt="" src="img/shop/products/thumbnail/product-03.jpg">
                                                        </a>
                                                        <a href="#" class="simpleLens-thumbnail-wrapper" data-lens-image="{{asset('cot/img/shop/products/large/product-04.jpg')}}" data-big-image="{{asset('cot/img/shop/products/medium/product-04.jpg')}}">
                                                        <img alt="" src="{{asset('cot/img/shop/products/thumbnail/product-04.jpg')}}">
                                                        </a>                                                    
                                                    </div>
                                                </div>
                                                </div>
                                                <a id="prev2" class="prev" href="#product-zoom-carousel" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                                                <a id="next2" class="next" href="#product-zoom-carousel" data-slide="next"><i class="fa fa-angle-right"></i></a>                    
                                        </div>--}}
                                        <!-- /Product Thumbnail -->
                                    </div>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <!-- Review Box -->
                                    <!-- /Review Box -->
                                    <!-- Product Details -->
                                    <div class="product-details">
                                        <p class="short-description">{{$producto->descripcion}}</p>
                                        <p><b>Código del producto :</b> {{$producto->id_mantis}}-</p>
                                        <p> 
                                            <ul>
                                                @foreach($caract as $c)
                                                    <li>{{$c->ArtCarDetDes}}</li>
                                                @endforeach        
                                            </ul>
                                        </p>
                                        <input type="hidden" name="id_producto" id="id_producto" value="{{$producto->id}}">
                                        @if($producto->cantidad > 0)
                                            <p><b>Stock : </b><span class="label label-success">Disponible</span></p>

                                        @else
                                            <p><b>Stock : </b><span class="label label-danger">No disponible</span></p>
                                        @endif

                                        <div class="cont-pro-det">
                                            <div class="precio-t">
                                                <input type="hidden" id="cant-dis" value="{{ round($producto->cantidad)}}">
                                                <input type="hidden" id="ArtSec" value="{{$producto->ArtSec}}">
                                                <h2 data="{{$producto->ArtSec}}" id="pro-{{$producto->ArtSec}}" class="idSync">${{ number_format($producto->valIva, 0, '', '.') }}</h2>
                                            </div>

                                            <div class="cantidad-t">
                                                <input class="td-qty qty-e" type="number"  name="cantidad" value="1" size="2" id="input-quantity">
                                            </div>

                                            <div class="add-t">
                                                 @if($producto->cantidad > 0)
                                               
                                                    <button type="button" class="btn btn-default btn-sm btn-color btn-lg" id="btn_addCart">Agregar al carro</button>
                                                </button>
                                                @else
                                              

                                                    <button type="button" class="btn btn-default btn-sm btn-color" id="btn_addCartDis" disabled>Agregar al carro</button>

                                                </button>
                                                @endif 
                                                
                                            </div>
                                            
                                        </div>
                                        
                                        
                                        <p><b> {{--<button type="button" class="btn btn-default btn-sm" disabled="disabled">$1200</button>--}} </b></p>
                                        <p><b></p>
                                        <p>     
                                                         
                                            
                                        </p>
                                    </div>
                                    <!-- /Product Details -->
                                </div>
                            </div>
                            <div class="row margin-top50">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <!-- Tabs -->
                                    <div class="widget tabs animate_afc">
                                        <div id="horizontal-tabs">
                                            <ul class="tabs">
                                                <li id="tab1" class="current">Características</li>
                                                <li id="tab2">Tab 2</li>
                                                <li id="tab3">Tab 3</li>
                                            </ul>
                                            <div class="contents">
                                                <div class="tabscontent" id="content1" style="display: block;">
                                                    <p>
                                                        Pantalla
                                                        Pantalla de 21,5 pulgadas (diagonal) retroiluminada por LED con tecnología IPS; resolución de 1920 x 1080 compatible con millones de colores.
                                                    <p>
                                                        Pantalla Retina 4K
                                                        Pantalla Retina 4K de 21,5 pulgadas (diagonal) con tecnología IPS; resolución de 4096 x 2304 compatible con millones de colores. 
                                                    </p>
                                                    <p>
                                                        DETALLE DEL PRODUCTO

Portátil HP 14-af106la AMD A6-5200, 4GB RAM DDR3L de SDRAM (1 DIMM), DD 500 GB 5400 RPM , Sist. Windows 10 - Color Gris
Esta Portátil HP presenta la combinación perfecta de diseño, confiabilidad y recursos. Estilo y productividad, al tiempo que piensas en tu presupuesto, algo que te encantará
                                                    </p>
                                                </div>
                                                <div class="tabscontent" id="content2">
                                                    <p>
                                                        Texto
                                                    </p>
                                                </div>
                                                <div class="tabscontent" id="content3">
                                                    <div id="reviews" class="posts-block col-lg-9 col-md-9 col-sm-8 col-xs-12 bottom-pad">
                                                          <p>
                                                            Texto
                                                        </p>                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Tabs -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- /product-item -->




<div class="modal signUpContent fade" id="ModalCart" tabindex="-1" role="dialog" >
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header modalHeader">
        <button type="button" id="closeModal" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h3 class="modal-title-site text-center" > PRODUCTO AGREGADO </h3>
      </div>
      <div class="modal-body">
        <div class="info-item">
            
        </div>
      
        
      </div>
      <div class="modal-footer">
        <a href="/catalogo" class="btn btn-info">Seguir Comprando</a> -- <a href="/cart" class="btn btn-danger">Terminar Pedido</a>
        
      </div>
    </div>
    <!-- /.modal-content --> 
    
  </div>
  <!-- /.modal-dialog --> 
  
</div>
<!-- /.Modal Login --> 
@stop

@section('scripts')
        <script src="{{asset('cot/js/simpleGallery/jquery.simpleGallery.js')}}"></script>
        <script src="{{asset('cot/js/simpleGallery/jquery.simpleLens.js')}}"></script>
        <script src="{{asset('cot/js/product.js')}}"></script>
        <script src="{{asset('js/jquery.knob.js')}}"></script>
        <!--<script src="{{asset('tat/js/payu.js')}}"></script>-->
         <script src="{{asset('tat/js/preciosMantis.js')}}"></script>
         <script src="{{asset('tat/js/producto.js')}}"></script>
@stop

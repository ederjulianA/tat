@extends('layouts.cotra')

@section('menu')
	@include('includes.cotracolta.pri.menu')
@stop

@section('content')
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
                                        <p class="short-description">Descripción del producto</p>
                                        <p><b>Código del producto :</b> {{$producto->id_mantis}}-</p>
                                        <input type="hidden" name="id_producto" id="id_producto" value="{{$producto->id}}">
                                        <p><b>Stock : </b><button type="button" class="btn btn-default btn-sm btn-color">Disponible</button></p>
                                        <input type="hidden" id="cant-dis" value="{{ round($producto->cantidad)}}">
                                        <p><b>Price : <button type="button" class="btn btn-default btn-sm" disabled="disabled">$1200</button> <button type="button" class="btn btn-default btn-sm">${{ number_format(App::make('UserController')->getPrice($producto->id_mantis), 0, '', '.') }}</button></b></p>
                                        <p><b>Cantidad :</b> <input class="td-qty" type="number"  name="cantidad" value="1" size="2" id="input-quantity"></p>
                                        <p>     
                                            @if($producto->cantidad > 0)
                                               
                                                    <button type="button" class="btn btn-default btn-sm btn-color" id="btn_addCart">Agregar al carro</button>
                                                </button>
                                            @else
                                              

                                                    <button type="button" class="btn btn-default btn-sm btn-color" id="btn_addCartDis" disabled>Agregar al carro</button>

                                                </button>
                                            @endif               
                                            
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
@stop
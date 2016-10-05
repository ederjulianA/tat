@extends('layouts.cotra')

@section('menu')
	@include('includes.cotracolta.pri.menu')
@stop


@section('content')

		    <div class="content margin-top60 margin-bottom60">
		    <input type="hidden" id="urlSaveArt" value="{{URL::route('urlSaveArt')}}">
                    <div class="container">
                        <div class="row">
                            <!-- Sidebar Start --> 
                            <div class="sidebar col-lg-2 col-md-2 col-sm-2 col-xs-10">                           
                                <!-- Categorias -->
                                <div class="widget category">
                                    <h3 class="title">Categorías</h3>
                                    <ul class="category-list slide">
                                    	@foreach($grupos as $gru)
                                        	<li><a href="/categoria/{{$gru->InvGruCod}}">{{$gru->InvGruNom}} </a></li>
                                        @endforeach
                                        
                                    </ul>                                    
                                </div>
                                <!-- /Categorias -->
                                                                           
                            </div>
                            <!-- /Sidebar End --> 
                            <!-- Products Start-->
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <div class="row">
                                    <div class="col-lg-7 col-md-6 col-sm-6 col-xs-12">
                                        <div class="display">
                                            <span><b>Vistas:</b></span>
                                            <a class="active btn-small btn-color btn-pad"><i class="fa fa-th"></i></a>
                                            <a class="list btn-small btn-pad" onclick="display(&#39;list&#39;);"><i class="fa fa-th-list"></i></a>
                                        </div>                                       
                                    </div>
                                    <div class="col-lg-4 col-md-5 col-sm-5 col-xs-11 pull-right">
                                        @include('includes.cotracolta.search')
                                       
                                    </div>
                                </div>
                                <div class="product-grid">
                                    <div class="products-block">
                                        <div class="row product-items">

	                                         @foreach(array_chunk($productos->getCollection()->all(),4) as $row)
												@foreach($row as $producto)
	                                            <!-- Product Items -->
	                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-11 product-cols first">
	                                                <div class="product-block" id="pb-{{$producto->ArtSec}}">
	                                                    <div class="image2 ">
	                                                        <span class="product-label product-label-special">
	                                                        <span>50%</span>
	                                                        </span>
	                                                        <!-- Swap image -->
	                                                        <div class="flip">
	                                                            <a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}" class="swap-image">
	                                                            <img src="{{asset($producto->img)}}" title="iPhone 5s 64 GB" alt="iPhone 5s 64 GB" class="front">
	                                                            </a>
	                                                        </div>
	                                                        <!-- /Swap image -->
	                                                        {{--<a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}" class="pav-colorbox btn btn-theme-default cboxElement"><em class="fa fa-plus"></em><span>Ver producto</span></a>--}}
	                                                    </div>
	                                                    <div class="product-meta">
	                                                        <div class="left">
	                                                            <h3 class="name"><a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}">{{$producto->pro_nom}}</a></h3>
	                                                            <div class="price">
	                                                                <span class="price-old"></span>
	                                                                <span class="price-new idSync" data="{{$producto->ArtSec}}" id="pro-{{$producto->ArtSec}}">${{ number_format($producto->valIva, 0, '', '.') }}</span>
	                                                                {{--<span class="price-new">${{ number_format(App::make('UserController')->getPrice($producto->id_mantis), 0, '', '.') }}</span>--}}
	                                                            </div>
	                                                        </div>
	                                                        <div class="right">
	                                                            <p class="description">
	                                                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
	                                                            </p>
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
	                                            <!-- /Product Items -->
	                                            @endforeach
	                                          @endforeach  
	                                          
                                        </div>
                                       
                                    </div>
                                </div>
                                <!-- .product-grid End-->
                                <div class="row">
                                    {{$productos->links()}}
                                </div>
                            </div>
                            <!-- /Products End -->
                        </div>
                    </div>
                </div>
            </section>
            <!-- /Main Section -->
           <!-- Footer -->

@stop

@section('scripts')
		
	<script src="{{asset('tat/js/preciosMantis.js')}}"></script>
	<script src="{{asset('cot/js/product.js')}}"></script> 
	<script src="{{asset('cot/js/productFilter.js')}}"></script> 
	

@stop  

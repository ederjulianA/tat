@extends('layouts.cotra')

@section('menu')
	@include('includes.cotracolta.pri.menu')
@stop


@section('content')
		    <div class="content margin-top60 margin-bottom60">
                    <div class="container">
                        <div class="row">
                            <!-- Sidebar Start --> 
                            <div class="sidebar col-lg-4 col-md-4 col-sm-4 col-xs-12">                           
                                <!-- Categorias -->
                                <div class="widget category">
                                    <h3 class="title">Categorías</h3>
                                    <ul class="category-list slide">
                                    	@foreach($categorias as $cat)
                                        	<li><a href="#">{{$cat->cat_nom}} 1</a></li>
                                        @endforeach
                                        
                                    </ul>                                    
                                </div>
                                <!-- /Categorias -->
                                                                           
                            </div>
                            <!-- /Sidebar End --> 
                            <!-- Products Start-->
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                <div class="row">
                                    <div class="col-lg-7 col-md-6 col-sm-6 col-xs-12">
                                        <div class="display">
                                            <span><b>Vistas:</b></span>
                                            <a class="active btn-small btn-color btn-pad"><i class="fa fa-th"></i></a>
                                            <a class="list btn-small btn-pad" onclick="display(&#39;list&#39;);"><i class="fa fa-th-list"></i></a>
                                        </div>                                       
                                    </div>
                                    <div class="col-lg-5 col-md-6 col-sm-6 col-xs-12 pull-right">
                                        <div class="input-group">
                                            <input type="text" value="Qué estás buscando?" onfocus="if(this.value=='Buscar productos')this.value='';" onblur="if(this.value=='')this.value='Buscar productos';" class="search-input form-control product-search-height">
                                            <span class="input-group-btn">
                                            <button type="submit" class="subscribe-btn btn product-search-height"><i class="fa fa-search"></i></button>
                                            </span>
                                        </div>  
                                        <!-- /Product Search  -->
                                    </div>
                                </div>
                                <div class="product-grid">
                                    <div class="products-block">
                                        <div class="row product-items">

	                                         @foreach(array_chunk($productos->getCollection()->all(),3) as $row)
												@foreach($row as $producto)
	                                            <!-- Product Items -->
	                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-cols first">
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
	                                                        <!-- /Swap image -->
	                                                        <a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}" class="pav-colorbox btn btn-theme-default cboxElement"><em class="fa fa-plus"></em><span>Ver producto</span></a>
	                                                    </div>
	                                                    <div class="product-meta">
	                                                        <div class="left">
	                                                            <h3 class="name"><a href="{{URL::route('proDetalle',array('slug'=>$producto->slug))}}">{{$producto->pro_nom}}</a></h3>
	                                                            <div class="price">
	                                                                <span class="price-old">$1'200.000</span>
	                                                                <span class="price-new">${{ number_format(App::make('UserController')->getPrice($producto->id_mantis), 0, '', '.') }}</span>
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
	                                                                    <span>Agregar al carro</span>
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
	<script src="{{asset('cot/js/product.js')}}"></script>   
@stop
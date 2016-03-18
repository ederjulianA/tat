<div class="main-header">
                    <div class="container">
                        <!-- TopNav -->
                        <div class="topnav navbar-header">
                            <a class="navbar-toggle down-button" data-toggle="collapse" data-target=".slidedown">
                            <i class="fa fa-angle-down icon-current"></i>
                            </a> 
                        </div>
                        <!-- /TopNav-->
                        <!-- Mobile Menu -->
                        <div class="mobile navbar-header">
                            <a class="navbar-toggle" data-toggle="collapse" href=".navbar-collapse">
                            <i class="fa fa-bars fa-2x"></i>
                            </a> 
                        </div>
                        <!-- /Mobile Menu -->
                        <!-- Menu Start -->
    
                        <nav class="collapse pull-left navbar-collapse menu">
                            <ul class="nav navbar-nav sf-menu">
                                <li>
                                    <a id="current" href="{{URL::route('catalogo')}}">
                                    Catálogo
                                    <span class="sf-sub-indicator">
                                    <i class="fa fa-angle-down "></i>
                                    </span>
                                    </a>
                                    <ul>
                                        <li><a href="" class="sf-with-ul">Sub1 </a></li>
                                        <li><a href="" class="sf-with-ul">Sub2</a></li>
                                        <li><a href="" class="sf-with-ul">Sub3</a></li>
                                    </ul>
                                </li>
                                {{--<li>
                                    <a href="#" class="sf-with-ul">
                                    Ciudado personal 
                                    <span class="sf-sub-indicator">
                                    <i class="fa fa-angle-down "></i>
                                    </span>
                                    </a>
                                    <ul>
                                        <li><a href="shortcodes.html" class="sf-with-ul">Item</a></li>
                                        <li><a href="components.html" class="sf-with-ul">Item</a></li>
                                        <li><a href="icons.html" class="sf-with-ul">Item</a></li>
                                        <li><a href="columns.html" class="sf-with-ul">Item</a></li>
                                        <li><a href="pricing-table.html" class="sf-with-ul">Item</a></li>
                                        <li>
                                            <a href="#" class="sf-with-ul"> 
                                            Tercer Nivel
                                            <span class="sf-sub-indicator pull-right">
                                            <i class="fa fa-angle-right "></i>
                                            </span>
                                            </a>
                                            <ul>
                                                <li><a href="#" class="sf-with-ul">Item</a></li>
                                                <li><a href="#" class="sf-with-ul">Item</a></li>
                                                <li><a href="#" class="sf-with-ul">Item</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>--}}
                                @foreach($menu as $m)
                                    <li>
                                        <a href="#" class="sf-with-ul">
                                    {{$m->men_nom}}
                                        <span class="sf-sub-indicator">
                                        <i class="fa fa-angle-down "></i>
                                        </span>
                                        </a>
                                        <ul>
                                            {{--<li>
                                                <a href="#" class="sf-with-ul"> 
                                                Productos
                                                <span class="sf-sub-indicator pull-right">
                                                <i class="fa fa-angle-right "></i>
                                                </span>
                                                </a>
                                                <ul>
                                                    <li><a href="" class="sf-with-ul">Producto1</a></li>
                                                    <li><a href="" class="sf-with-ul">Producto2</a></li>
                                                    <li><a href="" class="sf-with-ul">Producto3</a></li>
                                                </ul>
                                            </li>--}}

                                            @foreach($m->grupo as $md)
                                                <li><a href="" class="sf-with-ul">Producto1</a></li>
                                            @endforeach
                                            {{--<li><a href="" class="sf-with-ul">Producto2</a></li>
                                            <li><a href="" class="sf-with-ul">Producto3</a></li>
                                            <li>
                                                <a href="#" class="sf-with-ul"> 
                                                Sub nivel
                                                <span class="sf-sub-indicator pull-right">
                                                <i class="fa fa-angle-right "></i>
                                                </span>
                                                </a>
                                                <ul>
                                                    <li><a href="" class="sf-with-ul">Item</a></li>
                                                    <li><a href="" class="sf-with-ul">Item</a></li>
                                                    <li><a href="" class="sf-with-ul">Item</a></li>
                                                    <li><a href="" class="sf-with-ul">Item</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="" class="sf-with-ul">Item</a></li>
                                            <li><a href="" class="sf-with-ul">Item</a></li>--}}
                                        </ul>
                                    </li>
                                @endforeach
                                {{--<li>
                                    <a href="#" class="sf-with-ul">
                                    Frutas y verduras
                                    <span class="sf-sub-indicator">
                                    <i class="fa fa-angle-down "></i>
                                    </span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="#" class="sf-with-ul">
                                            Sub nivel
                                            <span class="sf-sub-indicator pull-right">
                                            <i class="fa fa-angle-right"></i>
                                            </span>
                                            </a>
                                            <ul>
                                                <li><a href="" class="sf-with-ul">Item</a></li>
                                                <li><a href="" class="sf-with-ul">Item</a></li>
                                                <li><a href="" class="sf-with-ul">Item</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#" class="sf-with-ul">
                                            Sub 2
                                            <span class="sf-sub-indicator pull-right">
                                            <i class="fa fa-angle-right"></i>
                                            </span>
                                            </a>
                                            <ul>
                                                <li><a href="" class="sf-with-ul">Item</a></li>
                                                <li><a href="" class="sf-with-ul">Item</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="testimonials.html" class="sf-with-ul">Item</a></li>
                                        <li>
                                            <a href="#" class="sf-with-ul">
                                            Sub 3
                                            <span class="sf-sub-indicator pull-right">
                                            <i class="fa fa-angle-right "></i>
                                            </span>
                                            </a>
                                            <ul>
                                                <li><a href="" class="sf-with-ul">Item</a></li>
                                                <li><a href="" class="sf-with-ul">Item</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="" class="sf-with-ul">Item</a></li>
                                        <li><a href="" class="sf-with-ul">Item</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="sf-with-ul">
                                    Papelería
                                    <span class="sf-sub-indicator">
                                    <i class="fa fa-angle-down "></i>
                                    </span>
                                    </a>
                                    <ul>
                                        <li><a href="" class="sf-with-ul">Item</a></li>
                                        <li><a href="" class="sf-with-ul">Item</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="sf-with-ul">
                                    Hogar
                                    <span class="sf-sub-indicator">
                                    <i class="fa fa-angle-down "></i>
                                    </span>
                                    </a>
                                    <ul>
                                        <li><a href="" class="sf-with-ul">Item</a></li>
                                        <li><a href="" class="sf-with-ul">Item</a></li>
                                    </ul>
                                </li>--}}
                            </ul>
                            <!--  <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 pull-right"> -->
                        </nav>
                        <!-- /Menu --> 
                    </div>
                </div>
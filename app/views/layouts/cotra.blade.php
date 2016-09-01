<!DOCTYPE html>
<!--[if IE 8]>          <html class="ie ie8"> <![endif]-->
<!--[if IE 9]>          <html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->  
<html> 
	<!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Home</title>
        <meta name="Cootracolta shop" content="Tienda de artículos Cootracolta">
        <meta name="autor" content="Megalópolis Company">
        @yield('meta-data')

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:100,200,300,700,800,900' rel='stylesheet' type='text/css'>
        <!-- Library CSS -->
        <link rel="stylesheet" href="{{asset('cot/css/bootstrap.css')}}">
        <link rel="stylesheet" href="{{asset('cot/css/bootstrap-theme.css')}}">
        <link rel="stylesheet" href="{{asset('cot/css/fonts/font-awesome/css/font-awesome.css')}}">
        <link rel="stylesheet" href="{{asset('cot/css/animations.css')}}" media="screen">
        <link rel="stylesheet" href="{{asset('cot/css/superfish.css')}}" media="screen">
        <link rel="stylesheet" href="{{asset('cot/css/revolution-slider/css/settings.css')}}" media="screen">
        <link rel="stylesheet" href="{{asset('cot/css/revolution-slider/css/extralayers.css')}}" media="screen">
        <link rel="stylesheet" href="{{asset('cot/css/prettyPhoto.css')}}" media="screen">
        <!-- Theme CSS -->
        <link rel="stylesheet" href="{{asset('cot/css/style.css')}}">
        <!-- Skin -->
        <link rel="stylesheet" href="{{asset('cot/css/colors/green.css')}}" class="colors">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="{{asset('cot/css/theme-responsive.css')}}">
        <!-- Switcher CSS -->
        <link href="{{asset('cot/css/switcher.css')}}" rel="stylesheet">
        <link href="{{asset('cot/css/spectrum.css')}}" rel="stylesheet">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.0/css/bootstrap-select.min.css">

        

        <link href="{{asset('sweetalert-master/dist/sweetalert.css')}}" rel="stylesheet">
        <!-- Favicons -->
        <link rel="shortcut icon" href="{{asset('cot/img/ico/favicon.ico')}}">
        <link rel="apple-touch-icon" href="{{asset('cot/img/ico/apple-touch-icon.png')}}">
        <link rel="apple-touch-icon" sizes="72x72" href="{{asset('cot/img/ico/apple-touch-icon-72.png')}}">
        <link rel="apple-touch-icon" sizes="114x114" href="{{asset('cot/img/ico/apple-touch-icon-114.png')}}">
        <link rel="apple-touch-icon" sizes="144x144" href="{{asset('cot/img/ico/apple-touch-icon-144.png')}}">
    </head>
    <body class="boxed home">
        <div class="wrap">
            <!-- Header -->
            <header id="header">
              <!-- Header Top Bar -->
                <div class="logo pull-left">
                     <h1>
                        <a href="/">
                        <img class="logoE" src="{{asset('img/cootracolta.jpg')}}" alt="Cootracolta" width="160" height="60">
                        </a>
                    </h1>
                 </div>
                <!-- Header Top Bar -->
                <div class="top-bar">
                    <div class="slidedown collapse">
                        <div class="container">
                            <div class="pull-right">
                                <ul class="social pull-right">
                                    <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                </ul>
                            </div>
                            <div class="phone-login pull-right">
                                @if(Auth::check())
                                    <a href="{{URL::route('micuenta')}}" >{{Auth::user()->email}}</a>
                                    <a href="{{URL::route('logout')}}" ><i class="fa fa-sign-in"></i>Cerrar sesión</a>

                                @else
                                    {{--<a href="{{URL::route('login')}}" data-toggle="modal" data-target="#loginModal"><i class="fa fa-sign-in"></i>Login</a>
                                    <a href="{{URL::route('login')}}" data-toggle="modal" data-target="#registrationModal"><i class="fa fa-edit"></i> Registrarse</a>--}} 
                                    <a href="{{URL::route('login')}}" ><i class="fa fa-sign-in"></i>Login</a>
                                    <a href="{{URL::route('login')}}" ><i class="fa fa-edit"></i> Registrarse</a>
                                @endif
                                
                                <a href="{{URL::route('cart')}}"><i class="fa fa-shopping-cart"></i> Carro de compras</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Header Top Bar -->
                <!-- Main Header -->
                @yield('menu')
                <!-- / Header Principal -->
            </header>
            <!-- /Header --> 
            <!-- Main Section -->
            <section id="main">
            @yield('content')
                    
            </section>
            
            <!-- Footer -->
            <footer id="footer">
                <div class="pattern-overlay">
                    <!-- Footer Top -->
                    <div class="footer-top">
                        <div class="container">
                            <div class="row">
                                <section class="col-lg-3 col-md-3 col-xs-12 col-sm-3 footer-one wow fadeIn">
                                    <h3 class="light">La Cooperativa</h3>
                                    <ul>
                                        <li><a href="" class="sf-with-ul">Nosotros </a></li>
                                        <li><a href="" class="sf-with-ul">Eventos</a></li>
                                        <li><a href="" class="sf-with-ul">Sorteos y ganadores</a></li>
                                        <li><a href="" class="sf-with-ul">Supermercados</a></li>
                                    </ul> 
                                </section>

                                 <section class="col-lg-3 col-md-3 col-xs-12 col-sm-3 footer-one wow fadeIn">
                                    <h3 class="light">Servicios</h3>
                                    <ul>
                                        <li><a href="" class="sf-with-ul">Promociones </a></li>
                                        <li><a href="" class="sf-with-ul">Tarjeta metrolínea</a></li>
                                        <li><a href="" class="sf-with-ul">Asociados</a></li>
                                        <li><a href="" class="sf-with-ul">Convenios</a></li>
                                    </ul> 
                                </section>

                                 <section class="col-lg-3 col-md-3 col-xs-12 col-sm-3 footer-one wow fadeIn">
                                    <h3 class="light">Servicio al cliente</h3>
                                    <ul>
                                        <li><a href="" class="sf-with-ul">Servicios adicionales </a></li>
                                        <li><a href="" class="sf-with-ul">Pedidos</a></li>
                                        <li><a href="" class="sf-with-ul">Preguntas frecuentes</a></li>
                                        <li><a href="" class="sf-with-ul">Términos y condiciones</a></li>
                                    </ul> 
                                </section>

                                <section class="col-lg-3 col-md-3 col-xs-12 col-sm-3 footer-one wow fadeIn">
                                    <h3 class="light">PQR</h3>
                                    <ul>
                                        <li><a href="" class="sf-with-ul">Líneas de contacto</a></li>
                                        <li><a href="" class="sf-with-ul">6889933 - 6774123</a></li>
                                        <li><a href="" class="sf-with-ul">Cootracolta</a></li>
                                        <li><a href="" class="sf-with-ul">Contáctenos</a></li>
                                    </ul> 
                                </section>
                               
                            </div>
                        </div>
                    </div>
                    <!-- /Footer Top --> 
                    <!-- Footer Bottom -->
                    <div class="footer-bottom">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6 ">
                                    <p class="credits">&copy; Copyright 2016 <a href="#">MEGALOPOLIS COMPANY</a>.Todos los derechos reservados. </p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6 ">
                                    <ul class="social social-icons-footer-bottom">
                                        <li class="facebook"><a href="#" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a href="#" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Footer Bottom --> 
                    <!-- /Footer Bottom --> 
                </div>
            </footer>

            <!-- Modals -->
            <section id="modals">
                <!-- Login Modal -->
                <div class="modal login fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h2 class="form-signin-heading modal-title" id="myModalLabel">Login</h2>
                            </div>
                            <form method="post" id="login">
                                <div class="modal-body">
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <input class="form-control" id="username" name="username" type="text" placeholder="Username" value="" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <input class="form-control" type="email" id="email" name="email" placeholder="Email" value="" required>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="modal-footer">
                                    <a href="password-recovery.html" class="pull-left">(¿Olvidaste tu contraseña?)</a>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    <button type="button" class="btn btn-color">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /Login Modal -->
                <!-- Registration Modal -->
                <div class="modal register fade" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="registrationModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h2 class="form-signin-heading modal-title" id="registrationModalLabel">Crear nueva cuenta</h2>
                        </div>
                        <form method="post" id="registration">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <input type="text" value="" class="form-control" placeholder="Nombre">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" value="" class="form-control" placeholder="Apellido">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <input type="text" value="" class="form-control" placeholder="E-mail ">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <input type="password" value="" class="form-control" placeholder="Contraseña">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="password" value="" class="form-control" placeholder="Repetir contraseña">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    <button type="button" class="btn btn-color">Registrarse</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /Registration Modal -->
            </section>
            <!-- Scroll To Top --> 
            <a href="#" class="scrollup"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- /Wrap -->
        <!-- The Scripts -->
        <script src="{{asset('cot/js/jquery.min.js')}}"></script>
        <script src="{{asset('cot/js/jquery-migrate-1.0.0.js')}}"></script>
        <script src="{{asset('cot/js/jquery-ui.js')}}"></script>
        <script src="{{asset('cot/js/bootstrap.js')}}"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.0/js/bootstrap-select.min.js"></script>

        <script src="{{asset('cot/js/revolution-slider/js/jquery.themepunch.plugins.min.js')}}"></script> 
        <script src="{{asset('cot/js/revolution-slider/js/jquery.themepunch.revolution.min.js')}}"></script>
        <script src="{{asset('cot/js/jquery.parallax.js')}}"></script>
        <script src="{{asset('cot/js/jquery.wait.js')}}"></script>
        <script src="{{asset('cot/js/fappear.js')}}"></script> 
        <script src="{{asset('cot/js/modernizr-2.6.2.min.js')}}"></script>
        <script src="{{asset('cot/js/jquery.bxslider.min.js')}}"></script>
        <script src="{{asset('cot/js/jquery.prettyPhoto.js')}}"></script>
        <script src="{{asset('cot/js/superfish.js')}}"></script>
        <script src="{{asset('cot/js/tweetMachine.js')}}"></script>
        <script src="{{asset('cot/js/tytabs.js')}}"></script>
        <script src="{{asset('cot/js/jquery.gmap.min.js')}}"></script>
        <script src="{{asset('cot/js/jquery.sticky.js')}}"></script>
        <script src="{{asset('cot/js/jquery.countTo.js')}}"></script>
        <script src="{{asset('cot/js/jflickrfeed.js')}}"></script>
        <script src="{{asset('cot/js/imagesloaded.pkgd.min.js')}}"></script>
        <script src="{{asset('cot/js/waypoints.min.js')}}"></script>
        <script src="{{asset('cot/js/wow.js')}}"></script>
        <script src="{{asset('cot/js/jquery.fitvids.js')}}"></script>
        <script src="{{asset('cot/js/spectrum.js')}}"></script>
        <script src="{{asset('cot/js/switcher.js')}}"></script>
        <script src="{{asset('cot/js/custom.js')}}"></script>

            <script src="{{asset('sweetalert-master/dist/sweetalert.min.js')}}"></script>
        <script src="{{asset('tat/js/addCart.js')}}"></script>
    <script src="{{asset('tat/js/jquery.numeric.js')}}"></script>
    <script src="{{asset('tat/js/jquery.magnific-popup.min.js')}}"></script>
    
    <script src="{{asset('tat/js/notie.js')}}"></script>
    <script src="{{asset('tat/js/custom.js')}}"></script>
        @yield('scripts')
    </body>
</html>


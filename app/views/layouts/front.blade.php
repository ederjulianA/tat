<!doctype html>
<html lang="en">
<head>

	<meta charset="utf-8">
	<!--[if IE]>
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>TAT Express Shop</title>
	
	<!-- Bootstrap Core CSS -->
	<link href="{{asset('tat/css/bootstrap.min.css')}}" rel="stylesheet">
	
	<!-- Google Web Fonts -->
	<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,700italic,400,300,700" rel="stylesheet" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	
	<!-- CSS Files -->
	<link href="{{asset('tat/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet">
	<link href="{{asset('tat/css/style.css')}}" rel="stylesheet">
	<link href="{{asset('tat/css/responsive.css')}}" rel="stylesheet">
	<link href="{{asset('tat/css/validationJS.css')}}" rel="stylesheet">
	<link href="{{asset('sweetalert-master/dist/sweetalert.css')}}" rel="stylesheet">
	{{--<link rel="stylesheet" type="text/css" href="{{asset('sweetalert-master/dist/sweetalert.css')">--}}
	
	<!--[if lt IE 9]>
		<script src="js/ie8-responsive-file-warning.js"></script>
	<![endif]-->
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/fav-144.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/fav-114.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/fav-72.png">
	<link rel="apple-touch-icon-precomposed" href="images/fav-57.png">
	<link rel="shortcut icon" href="images/fav.png">
	
</head>
<body>
	<!-- Header Section Starts -->
<header id="header-area">
		<!-- Header Top Starts -->
			<div class="header-top">
				<div class="container">
					<!-- Header Links Starts -->
						<div class="col-sm-8 col-xs-12">
							<div class="header-links">
								@include('includes.menuHeader')
								
							</div>
						</div>
					<!-- Header Links Ends -->
					<!-- Currency & Languages Starts -->
						<div class="col-sm-4 col-xs-12">
							<div class="pull-right">
							<!-- Currency Starts -->
								<!--<div class="btn-group">
									<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
										Currency
										<i class="fa fa-caret-down"></i>
									</button>
									<ul class="pull-right dropdown-menu">
										<li><a tabindex="-1" href="#">Pound </a></li>
										<li><a tabindex="-1" href="#">US Dollar</a></li>
										<li><a tabindex="-1" href="#">Euro</a></li>
									</ul>
								</div>-->
							<!-- Currency Ends -->
							<!-- Languages Starts -->
								<!--<div class="btn-group">
									<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
										Language
										<i class="fa fa-caret-down"></i>
									</button>
									<ul class="pull-right dropdown-menu">
										<li>
											<a tabindex="-1" href="#">English</a>
										</li>
										<li>
											<a tabindex="-1" href="#">French</a>
										</li>
									</ul>
								</div>-->
							<!-- Languages Ends -->
							</div>
						</div>
					<!-- Currency & Languages Ends -->
				</div>
			</div>
		<!-- Header Top Ends -->
		<!-- Starts -->
		<div class="container">
			<!-- Main Header Starts -->
				<div class="main-header">
					<div class="row">
					<!-- Logo Starts -->
						<div class="col-md-6">
							<div id="logo">
								{{--<a href="/"><img src="{{asset('tat/images/tat-logo.png')}}" title="Spice Shoppe" alt="Spice Shoppe" class="img-responsive" /></a>--}}
									<a href="/"><img src="http://localhost:8000/tat/images/tat-logo.png" title="Spice Shoppe" alt="Spice Shoppe" class="img-responsive" /></a>
							</div>
						</div>
					<!-- Logo Starts -->
					<!-- Search Starts -->
						<div class="col-md-3">
						<form method="get" action="{{URL::route('buscador',array('f'=>'p','o'=>'asc'))}}">
							<div id="search">
								<div class="input-group">
										
										 <input type="text" class="form-control input-lg" placeholder="Buscar" name="keyword" value="" required>
									
									 
									  <span class="input-group-btn">
										<button type="submit" class="btn btn-lg" type="button">
											<i class="fa fa-search"></i>
										</button>
									  </span>
									 
								</div>
							</div>
						</form> 		
						</div>
					<!-- Search Ends -->
					<!-- Shopping Cart Starts -->
						<div class="col-md-3">
							@yield('cart-items')
							
						</div>
					<!-- Shopping Cart Ends -->
					</div>
				</div>
			<!-- Main Header Ends -->
			<!-- Main Menu Starts -->
				<nav id="main-menu" class="navbar" role="navigation">
				<!-- Nav Header Starts -->
					<div class="navbar-header">
						<button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-cat-collapse">
							<span class="sr-only">Toggle Navigation</span>
							<i class="fa fa-bars"></i>
						</button>
					</div>
				<!-- Nav Header Ends -->
				<!-- Navbar Cat collapse Starts -->
					<div class="collapse navbar-collapse navbar-cat-collapse">
						@include('includes.nav')
						
					</div>
				<!-- Navbar Cat collapse Ends -->
				</nav>
			<!-- Main Menu Ends -->
			</div>
		<!-- Ends -->
</header>
	@yield('slider')
	<!-- Header Section Ends -->
	<!-- Main Container Starts -->
		<div id="main-container" class="container">
				@yield('content')
		<!-- Content Ends -->
		</div>
	<!-- Main Container Ends -->
	<!-- Footer Section Starts -->
		<footer id="footer-area">
		<!-- Footer Links Starts -->
			<div class="footer-links">
			<!-- Container Starts -->
				<div class="container">
					<!-- Information Links Starts -->
						<div class="col-md-2 col-sm-6">
							<h5>Información</h5>
							<ul>
								<li><a href="http://tatexpress.com.co/?page_id=2">Sobre Nosotros</a></li>
								<li><a href="http://tatexpress.com.co/?page_id=4062">Noticias</a></li>
								<li><a href="http://tatexpress.com.co/?page_id=4076">Vídeos</a></li>
							</ul>
						</div>
					<!-- Information Links Ends -->
					<!-- My Account Links Starts -->
						<div class="col-md-2 col-sm-6">
							<h5>Mi cuenta</h5>
							<ul>
								<li><a href="{{URL::route('cart')}}">Mis órdenes</a></li>
								<li><a href="#">Mi Perfil</a></li>	
								
							</ul>
						</div>
					<!-- My Account Links Ends -->					
					<!-- Customer Service Links Starts -->
					<!--	<div class="col-md-2 col-sm-6">
							<h5>Servicios</h5>
							<ul>
								<li><a href="contact.html">Contact Us</a></li>
								<li><a href="#">Returns</a></li>
								
							</ul> 
						</div> -->
					<!-- Customer Service Links Ends -->
					<!-- Follow Us Links Starts -->
					<!--	<div class="col-md-2 col-sm-6">
							<h5>Follow Us</h5>
							<ul>
								<li><a href="#">Facebook</a></li>
								<li><a href="#">Twitter</a></li>
								<li><a href="#">RSS</a></li>
								<li><a href="#">YouTube</a></li>
							</ul>
						</div> -->
					<!-- Follow Us Links Ends -->
					<!-- Contact Us Starts -->
					<!--	<div class="col-md-4 col-sm-12 last">
							<h5>Contáctanos</h5>
							<ul>
								<li>TAT Express</li>
								<li>
									1247 LB Nagar Road, Hyderabad, Telangana - 35
								</li>
								<li>
									Email: <a href="#">info@demolink.com</a>
								</li>								
							</ul>
							<h4 class="lead">
								Tel: <span>1(234) 567-9842</span>
							</h4>
						</div> -->
					<!-- Contact Us Ends -->
				</div>
			<!-- Container Ends -->
			</div>
		<!-- Footer Links Ends -->
		<!-- Copyright Area Starts -->
			<div class="copyright">
			<!-- Container Starts -->
				<div class="container">
				<!-- Starts -->
					<p class="pull-left">
						&nbsp; 2014 TAT Express <a href="http://www.tatexpress.com.co">TAT</a>
					</p>
				<!-- Ends -->
				<!-- Payment Gateway Links Starts -->
					<ul class="pull-right list-inline">
						<li>
							<img src="images/payment-icon/cirrus.png" alt="PaymentGateway" />
						</li>
						
					</ul>
				<!-- Payment Gateway Links Ends -->
				</div>
			<!-- Container Ends -->
			</div>
		<!-- Copyright Area Ends -->
		</footer>
	<!-- Footer Section Ends -->
	<!-- JavaScript Files -->
	<script src="{{asset('tat/js/jquery-1.11.1.min.js')}}"></script>
	<script src="{{asset('tat/js/jquery-migrate-1.2.1.min.js')}}"></script>	
	<script src="{{asset('tat/js/bootstrap.min.js')}}"></script>
	<script src="{{asset('tat/js/bootstrap-hover-dropdown.min.js')}}"></script>
    <script src="{{asset('tat/js/jquery.magnific-popup.min.js')}}"></script>
    <script src="{{asset('sweetalert-master/dist/sweetalert.min.js')}}"></script>
    <script src="{{asset('tat/js/notie.js')}}"></script>
	<script src="{{asset('tat/js/custom.js')}}"></script>
	<script src="{{asset('tat/js/addCart.js')}}"></script>
	<script src="{{asset('tat/js/jquery.numeric.js')}}"></script>
	<script src="{{asset('tat/js/jquery.notie.js')}}"></script>
	<script src="{{asset('tat/js/Sync.js')}}"></script>
	
	@yield('ajax-val')
</body>
</html>
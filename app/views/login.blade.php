@extends('layouts.front')

@section('cart-items')
	@include('includes.cart')
	
@stop

@section('content')
	<!-- Breadcrumb Starts -->
			<ol class="breadcrumb">
				<li><a href="/">Home</a></li>
				<li class="active">Registro</li>
			</ol>

					 @if(Session::has('message-alert'))
				<div class="row">
					<div class="col-md-5">
						 

			            <div class="alert alert-warning alert-dismissable">
			              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			              <strong>Mensaje</strong> {{Session::get('message-alert')}}
			            </div>

			            <!--<p class="mensajes-flash" style="" data-dismiss="alert"id="mensaje-flash"> {{Session::get('message-alert')}}
			                
			            </p>-->
			        
						
					</div>
					
				</div>
			@endif
			
		<!-- Breadcrumb Ends -->
		<!-- Main Heading Starts -->
			<h2 class="main-heading text-center">
				Inicia sesión o crea una cuenta nueva
			</h2>
		<!-- Main Heading Ends -->
		<!-- Login Form Section Starts -->
			<section class="login-area">
				<div class="row">
					<div class="col-sm-6">
					<!-- Login Panel Starts -->
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">Login</h3>
							</div>
							<div class="panel-body">
								<p>
									Por favor inicia sesión usando tu cuenta
								</p>
							<!-- Login Form Starts -->
								<form class="form-inline" role="form" method="post" action="{{URL::route('postLogin')}}">
									<div class="form-group">
										<label class="sr-only" for="exampleInputEmail2">Email</label>
										
										{{ Form::text('email','',array('class'=>'form-control','name'=>'email','placeholder'=>'Email','id'=>'exampleInputEmail2')) }}
											{{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
										</div>
									</div>
									<div class="form-group">
										<label class="sr-only" for="exampleInputPassword2">Contraseña</label>
										<input type="password" name="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
									</div>
									<button type="submit" class="btn btn-warning">
										Login
									</button>
								</form>
							<!-- Login Form Ends -->
					
							</div>
						</div>
					<!-- Login Panel Ends -->
					</div>
					<div class="col-sm-6">
					<!-- Account Panel Starts -->
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Crear Cuenta nueva
								</h3>
							</div>
							<div class="panel-body">
								<p>
									Al estar registrado en TAT shop, te permite procesar tus pedidos de forma rapida
								</p>
								<a href="{{URL::route('register')}}" class="btn btn-warning">
									Registro
								</a>
							</div>
						</div>
					<!-- Account Panel Ends -->
					<!-- Guest Checkout Panel Starts -->
						<!--<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Checkout as Guest
								</h3>
							</div>
							<div class="panel-body">
								<p>
									Checkout as a guest instead!
								</p>
								<button class="btn btn-warning">As Guest</button>
							</div>
						</div>-->
					<!-- Guest Checkout Panel Ends -->
					</div>
				</div>
			</section>
		<!-- Login Form Section Ends -->
		</div>
@stop
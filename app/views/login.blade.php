@extends('layouts.front')

@section('cart-items')
	@include('includes.cart')
	
@stop

@section('content')

	<style type="text/css" media="screen">

		.frmEde{
			margin: 10px auto;
		}
		.frmEde input {
			width: 90%;
		}
		
	</style>
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
			<div class="row">
				<div class="col-md-4">
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">Login</h3>
							</div>
							<div class="panel-body">
								<p>
									Ingresa con tus credenciales
								</p>

							<form class="form-inline" role="form" method="post" action="{{URL::route('postLogin')}}">
									<div class="form-group frmEde">
										<label class="sr-only" for="email">Email</label>
										 	
												{{ Form::text('email','',array('class'=>'form-control','name'=>'email','placeholder'=>'Email','id'=>'email')) }}
													{{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
												
									</div>
									<br>

									<div class="form-group frmEde">
										<label class="sr-only" for="exampleInputPassword2">Contraseña</label>
										<input type="password" name="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
									</div>
									<br>

									<div class="form-group frmEde">
										<button type="submit" class="btn btn-warning">
										Login
									</button>
									</div>	
							</form>	
							</div>
						</div>	
				</div>
				<div class="col-md-4">
					    <div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">Crear cuenta</h3>
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
				</div>
				<div class="col-md-4">
							<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">Olvido contraseña ?</h3>
							</div>
						</div>	
				</div>
			</div>
		<!-- Login Form Section Ends -->
		{{--</div>--}}
@stop
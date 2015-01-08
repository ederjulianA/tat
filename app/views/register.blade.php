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
		<!-- Breadcrumb Ends -->
		<!-- Main Heading Starts -->
			<h2 class="main-heading text-center">
				Registro <br />
				<span>Crear cuenta nueva</span>
			</h2>
		<!-- Main Heading Ends -->
		<!-- Registration Section Starts -->
			<section class="registration-area">
				<div class="row">
					<div class="col-sm-6">
					<!-- Registration Block Starts -->
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">Información Personal</h3>
							</div>
							<div class="panel-body">
							<!-- Registration Form Starts -->
								<form class="form-horizontal" role="form" method="post" action="/register/new/user">
								<!-- Personal Information Starts -->
									
									<div class="form-group">
										<label for="inputEmail" class="col-sm-3 control-label">Email :</label>
										<div class="col-sm-9">
											<!--<input type="email" class="form-control" id="inputEmail" placeholder="Email">-->
											{{ Form::email('email','',array('class'=>'form-control','name'=>'email','placeholder'=>'Email')) }}
											{{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
										</div>
									</div>
								
								
						
									<h3 class="panel-heading inner">
										Seguridad
									</h3>
								<!-- Password Area Starts -->
									<div class="form-group">
										<label for="inputPassword" class="col-sm-3 control-label">Contraseña :</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" name="password" id="inputPassword" placeholder="******">
											{{ $errors->first('password','<p class="alert alert-danger">:message</p>') }}
										</div>
									</div>
									<div class="form-group">
										<label for="inputRePassword" class="col-sm-3 control-label">Re-Contaseña :</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" name="password_confirmation" id="inputRePassword" placeholder="******">
											{{ $errors->first('password_confirmation','<p class="alert alert-danger">:message</p>') }}
										</div>
									</div>
								
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
											<div class="checkbox">
												<label>
													<input type="checkbox" name="terminos"> He leído y acepto los términos y condiciones de servicio 

													{{ $errors->first('terminos','<p class="alert alert-danger">:message</p>') }}
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
											<button type="submit" class="btn btn-warning">
												Crear cuenta 
											</button>
										</div>
									</div>
								<!-- Password Area Ends -->
								</form>
							<!-- Registration Form Starts -->
							</div>							
						</div>
					<!-- Registration Block Ends -->
					</div>
					<div class="col-sm-6">
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
					<!-- Conditions Panel Starts -->
						<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Condiciones
								</h3>
							</div>
							<div class="panel-body">
								<p>
								La información que registras en este formulario se utiliza para notificar los eventos correspondientes a los pedidos que realices. También se usuará como medio de contacto para dar a conocer novedades y promociones que pueden ser de tu interés.
								</p>
								
							</div>
						</div>
					<!-- Conditions Panel Ends -->
					</div>
				</div>
			</section>
		<!-- Registration Section Ends -->
@stop
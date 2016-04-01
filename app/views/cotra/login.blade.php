@extends('layouts.cotra')

@section('content')
	  <!-- Main Content -->
                <div class="content margin-top60 margin-bottom60">
                    <div class="container">
                        <div class="row">
                        @if(Session::has('message-alert'))
                <div class="row">
                    
                         

                        <div class="alert alert-warning alert-dismissable">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                          <strong>Mensaje</strong> {{Session::get('message-alert')}}
                        </div>

                        <!--<p class="mensajes-flash" style="" data-dismiss="alert"id="mensaje-flash"> {{Session::get('message-alert')}}
                            
                        </p>-->
                
                    
                </div>
            @endif
                            <!-- Login -->
                            <div class="featured-boxes login">
                                <!-- Login -->
                                <div class="col-md-6">
                                    <div class="featured-box featured-box-secundary default info-content">
                                        <h2 class="form-signin-heading">Login</h2>
                                        <div class="box-content ">
                                            <form action="{{URL::route('postLogin')}}"  id="siginin" method="post">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            <input type="text" value="" name="email"class="form-control" placeholder="Username or E-mail Address">
                                                            {{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            <input type="password" value="" name="password" class="form-control" placeholder="Password">
                                                            <a class="pull-right" href="#">(¿Perdiste tu contraseña?)</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <span class="remember-box checkbox">
                                                        <label for="rememberme">
                                                        <input type="checkbox" id="rememberme" name="rememberme">Recuérdame
                                                        </label>
                                                        </span>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input type="submit" value="Login" class="btn btn-color push-bottom" data-loading-text="Loading...">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Login -->
                                <!-- Registration -->
                                <div class="col-md-6">
                                    <div class="featured-box featured-box-secundary default info-content">
                                        <h2 class="form-signin-heading">Crear una cuentaaa</h2>
                                        <div class="box-content">
                                            <form  id="signup" method="post" action="/register/new/user">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-6">
                                                            {{ Form::text('nombre','',array('class'=>'form-control','name'=>'nombre','placeholder'=>'nombre')) }}
											{{ $errors->first('nombre','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                        <div class="col-md-6">
                                                            {{ Form::text('apellido','',array('class'=>'form-control','name'=>'apellido','placeholder'=>'apellido')) }}
											{{ $errors->first('apellido','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            {{ Form::text('NitSec','',array('class'=>'form-control','name'=>'NitSec','placeholder'=>'Cedula')) }}
											{{ $errors->first('NitSec','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            {{ Form::text('telefono','',array('class'=>'form-control','name'=>'telefono','placeholder'=>'telefono')) }}
											{{ $errors->first('telefono','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                    </div>



                                                </div>


                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            {{ Form::text('direccion','',array('class'=>'form-control','name'=>'direccion','placeholder'=>'direccion')) }}
											{{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                    </div>

                                                    	

                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            {{ Form::email('email','',array('class'=>'form-control','name'=>'email','placeholder'=>'Email')) }}
											{{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-6">
                                                            <input type="password" class="form-control" name="password" id="inputPassword" placeholder="******">
											{{ $errors->first('password','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input type="password" class="form-control" name="password_confirmation" id="inputRePassword" placeholder="******">
											{{ $errors->first('password_confirmation','<p class="alert alert-danger">:message</p>') }}
                                                        </div>
                                                    </div>

                                                    <input type="checkbox" name="terminos"> He leído y acepto los términos y condiciones de servicio 

													{{ $errors->first('terminos','<p class="alert alert-danger">:message</p>') }}
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 pull-right">
                                                        <input type="submit" value="Registrarse" class="btn btn-color push-bottom" data-loading-text="Loading...">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Registration -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Main Content -->
            </section>
            <!-- /Main Section -->
@stop
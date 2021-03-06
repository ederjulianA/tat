@extends('layouts.cotra')

@section('content')
	  <!-- Main Content -->
                <style type="text/css">
                .errorE{
                    -webkit-box-shadow: 4px 6px 65px 3px rgba(237,0,0,1);
-moz-box-shadow: 4px 6px 65px 3px rgba(237,0,0,1);
box-shadow: 4px 6px 65px 3px rgba(237,0,0,1);
                }
                </style>
                <input type="hidden" id="urlValMail" value="{{URL::route('urlValMail')}}">
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
                                        <h2 class="form-signin-heading">Crear una cuenta</h2>
                                        <div class="box-content">
                                            {{--<form  id="FormNewUser" method="post" action="/register/new/user">--}}
                                            <form  id="FormNewUser" method="post" >
                                            <input type="hidden" id="newUserAjax" value="{{URL::route('newUserAjax')}}">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-6">
                                                            <label>Nombre:</label>
                                                            {{ Form::text('nombre','',array('class'=>'form-control','id'=>'nombre','name'=>'nombre','placeholder'=>'nombre')) }}
											{{ $errors->first('nombre','<p class="alert alert-danger">:message</p>') }}
                                             <p id="_nombre" class=""></p>
                                                        </div>
                                                        <div class="col-md-6">
                                                        <label>Apellido:</label>
                                                            {{ Form::text('apellido','',array('class'=>'form-control','id'=>'apellido','name'=>'apellido','placeholder'=>'apellido')) }}
											{{ $errors->first('apellido','<p class="alert alert-danger">:message</p>') }}
                                             <p id="_apellido" class=""></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                        <label>Cédula:</label>
                                                            {{ Form::text('NitSec','',array('class'=>'form-control','name'=>'NitSec','id'=>'nit','placeholder'=>'Cedula')) }}
											{{ $errors->first('NitSec','<p class="alert alert-danger">:message</p>') }}
                                                    <p id="_NitSec" class=""></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                        <label>Telefono:</label>
                                                            {{ Form::text('telefono','',array('class'=>'form-control','name'=>'telefono','placeholder'=>'telefono','id'=>'telefono')) }}
											{{ $errors->first('telefono','<p class="alert alert-danger">:message</p>') }}
                                            <p id="_telefono" class=""></p>
                                                        </div>
                                                    </div>



                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                        <label>Departamento:</label>
                                                            <select class="selectpicker form-control" id="selDep" data-live-search="true">
                                                              
                                                            </select>

                                            {{ $errors->first('selDep','<p class="alert alert-danger">:message</p>') }}
                                            <p id="_selDep" class=""></p>
                                                        </div>
                                                    </div>

                                                        

                                                </div>

                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            <label>Ciudad:</label>
                                                            <select class="selectpicker form-control" id="selCiu" data-live-search="true">
                                                              
                                                            </select>

                                            {{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
                                                            <p id="_selCiu" class=""></p>
                                                        </div>
                                                    </div>

                                                        

                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                        <label>Dirección:</label>
                                                            {{ Form::text('direccion','',array('class'=>'form-control','name'=>'direccion','placeholder'=>'direccion','id'=>'direccion')) }}
											{{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
                                             <p id="_direccion" class=""></p>

                                                        </div>
                                                    </div>

                                                    	

                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                        <label>Email:</label>
                                                            {{ Form::email('email','',array('class'=>'form-control','name'=>'email','placeholder'=>'Email','id'=>'email')) }}
											{{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
                                             <p id="_email" class=""></p>
                                           
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-md-6">
                                                            <label>Contraseña:</label>
                                                            <input type="password" class="form-control" name="password" id="password" placeholder="******">
											{{ $errors->first('password','<p class="alert alert-danger">:message</p>') }}
                                            <p id="_password" class=""></p>
                                                        </div>
                                                        <div class="col-md-6">
                                                        <label>Confirmar contraseña:</label>
                                                            <input type="password" class="form-control" name="password_confirmation" id="password_rep" placeholder="******">
											{{ $errors->first('password_confirmation','<p class="alert alert-danger">:message</p>') }}
                                             <p id="_password_rep" class=""></p>
                                                        </div>
                                                    </div>

                                                    <input type="checkbox" name="terminos" id="terminos"> He leído y acepto los términos y condiciones de servicio 

													{{ $errors->first('terminos','<p class="alert alert-danger">:message</p>') }}
                                                    <p id="_terminos" class=""></p>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 pull-right">
                                                        <input type="button" value="Registrarse" id="btnNewUser2" class="btn btn-color push-bottom" data-loading-text="Loading...">
                                                        <a href="" id="btnMan">Mantis </a>
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

            <style type="text/css" media="screen">
                .errorE{
                    border: 1px solid red;
                    color: red;
                }
                
            </style>
@stop

@section('scripts')
    <script src="{{asset('tat/js/RegisterUser.js')}}"></script>
    <script src="{{asset('tat/js/loadBarrios.js')}}"></script>
    
    

@stop  
@extends('layouts.cotra')


@section('menu')
	@include('includes.cotracolta.pri.menu')
@stop

@section('content')
	<div class="wrap">
       
            <!-- Main Content -->
                <div class="content margin-top60 margin-bottom60">
                    <div class="container">
                        <div class="row">
                            <!-- My Order Table -->
                            <div class="col-sm-9 col-md-9 col-lg-9">
                                <div class="my-account">
                                    
                                    <div class="bottom-padding">
                                        <div class="title-box">
                                            <h3>Mis Direcciones</h3>
                                        </div>
                                     
                                        <!-- /Table  -->
                                    </div>
                                    {{--<div class="title-box">
                                        <h2 class="title">Información de la cuenta</h2>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 info-box">
                                            <h3 class="subtitle">Información de contacto</h3>
                                            <p>
                                                Mr. Cliente<br>
                                                mr-cliente@mail.com<br>
                                                <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Cambiar contraseña</a>
                                            </p>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h3 class="subtitle">Direcciones</h3>
                                            <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Editar direcciones</a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-sm-6 col-md-6">
                                            <h3 class="subtitle">Editar dirección de envío</h3>
                                            <address>
                                                Mr. Cliente<br>
                                                Dirección<br>
                                                Bucaramanga, Santander<br>
                                                Colombia<br>
                                                <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Editar</a>
                                            </address>
                                        </div>
                                    </div>--}}
                                </div>
                            </div>
                            <!-- /My Order Table -->
                            <!-- Sidebar -->
                                @include('includes.cotracolta.pri.sidebar')
                            <!-- /Sidebar -->
                        </div>
                    </div>
                </div>
                <!-- Main Content -->
    
            <!-- Footer -->
         


@stop
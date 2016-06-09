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
                                        <h3 class="hello">Hola, Eder!</h3>
                                        <p>Contenido de bienvenida a mi cuenta.</p>
                                    </div>
                                    <div class="bottom-padding">
                                        <div class="title-box">
                                            <h3>Mis órdenes</h3>
                                        </div>
                                        <!-- Table  -->
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-responsive text-left my-orders-table">
                                                <thead>
                                                    <tr class="first last">
                                                        <th>#</th>
                                                        <th>Fecha</th>
                                                        
                                                        <th><span class="nobr">Total de la orden</span></th>
                                                        <th>Estado</th>
                                                        <th class="text-center">¿Qué quieres hacer?</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach($pedidos as $pedido)
                                                    
                                                        <tr>
                                                            <td>{{$pedido->id}}</td>
                                                            <td>{{$pedido->created_at}}</td>
                                                           
                                                            <td><span class="price">${{number_format($pedido->total_compra, 0, '', '.')}}</span></td>
                                                            <td class="text-primary"><em>{{$pedido->nom_est}}</em></td>
                                                            <td class="text-center last">
                                                                <div class="btn-group">
                                                                    <a href="/micuenta/orden/{{$pedido->id}}" class="btn btn-color">Ver orden</a>
                                                                    <a href="#" class="btn btn-default">Re ordenar</a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    @endforeach    
                                                    {{--<tr>
                                                        <td>100000022</td>
                                                        <td>4/30/14</td>
                                                        <td>Mr. Cliente</td>
                                                        <td><span class="price">$1,306.84</span></td>
                                                        <td class="text-primary"><em>Nuevo</em></td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-color">Ver orden</a>
                                                                <a href="#" class="btn btn-default">Re ordenar</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>100000022</td>
                                                        <td>4/30/14</td>
                                                        <td>Mr. Cliente</td>
                                                        <td><span class="price">$1,306.84</span></td>
                                                        <td class="text-primary"><em>Cancelado</em></td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-color">Ver orden</a>
                                                                <a href="#" class="btn btn-default">Re ordenar</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>100000019</td>
                                                        <td>3/02/14</td>
                                                        <td>Mr. Cliente</td>
                                                        <td><span class="price">$1105.02</span></td>
                                                        <td class="text-warning"><em>Pendiente</em></td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-color">Ver orden</a>
                                                                <a href="#" class="btn btn-default">Re ordenar</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>100000018</td>
                                                        <td>3/02/14</td>
                                                        <td>Mr. Cliente</td>
                                                        <td><span class="price">$202.50</span></td>
                                                        <td class="text-color"><em>Terminado</em></td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-color">Ver orden</a>
                                                                <a href="#" class="btn btn-default">Re ordenar</a>
                                                            </div>
                                                        </td>
                                                    </tr>--}}
                                                </tbody>
                                            </table>

                                            {{$pedidos->links()}}
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
                            <div id="sidebar" class="sidebar col-sm-3 col-md-3 col-lg-3">
                                <div class="widget">
                                    <h3>Mi cuenta</h3>
                                    <!-- menu-->
                                    <div id="sidebar-nav">
                                        <ul class="sidebar-nav">
                                            <li class="active">
                                                <a href="my-account.html"><i class="fa fa-gears item-icon"></i>Mis órdenes</a>
                                            </li>
                                            <li>
                                                <a href="my-account-information.html"><i class="fa fa-user item-icon"></i>Información de la cuenta</a>
                                            </li>
                                            <li>
                                                <a href="my-address.html"><i class="fa fa-pencil-square-o item-icon"></i>Direcciones</a>
                                            </li>
                                            <li>
                                                <a href="my-orders.html"><i class="fa fa-shopping-cart item-icon"></i>Mis órdenes</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- /menu-->
                                </div>
                            </div>
                            <!-- /Sidebar -->
                        </div>
                    </div>
                </div>
                <!-- Main Content -->
    
            <!-- Footer -->
         


@stop
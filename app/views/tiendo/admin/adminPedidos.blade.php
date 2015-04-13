@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('titulo1')
  Lista de pedidos
@stop

@section('content')
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
  <div class="contenedor">
    
  
    <table class="table">
      <thead>
        <th>Id pedido</th>
        <th>Valor Pedido</th>
        <th>Cliente</th>
        <th>Estado</th>
        <th>Confirmar</th>
        <th>Detalle</th>
      </thead>
      <tbody>
        @foreach($pedidos as $pedido)
          <tr>
            <td>{{$pedido->id}}</td>
            <td>${{number_format($pedido->total_compra, 0, '', '.')}}</td>
            <td>{{$pedido->nombre}} {{$pedido->apellido}}</td>
            <td>
              @if($pedido->estado_id == 1)
                <span class="label label-danger" id="est-{{$pedido->id}}">  {{$pedido->nom_est}}</span>
              @else
                <span class="label label-info" id="est-{{$pedido->id}}">  {{$pedido->nom_est}}</span>

              @endif
              
            </td>
            <td>
              {{Form::checkbox('conf', $pedido->conf, $pedido->conf, array('class' => 'conf','data'=>$pedido->id,'id'=>'conf-'.$pedido->id))}}
             

              </td>
            <td><a href="/admin/pedido/{{$pedido->id}}" class="btn btn-success">Ver</a></td>
          </tr>
        @endforeach
      </tbody>
      
    </table>
  </div>  
@stop
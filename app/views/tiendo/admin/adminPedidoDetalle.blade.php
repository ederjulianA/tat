@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop

@section('titulo1')
  DETALLE PEDIDO
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
  <div class="row">
      <div class="col-md-12">
        <div class="panel panel-smart">
          <div class="panel-heading">
                <h3 class="panel-title">
                  Orden No : {{$pedido->id}}
                </h3>
          </div>
          <div class="panel-body">
            <table class="table table-responsive">
              <th>Id</th>
              <th>Detalle</th>
              <th>Cantidad</th>
              <th>Vlor Unitario</th>
              <th>IVA</th>
              <th>Valor Total</th>
              @foreach($items as $item)
                <tr>
                  <td>{{$item->id_producto}}</td>
                  <td>{{$item->nombre}}</td>
                  <td>{{$item->cantidad}}</td>
                  <td>${{number_format($item->valor_unitario, 0, '', '.')}}</td>
                  <td>{{$item->iva}}</td>
                  <td>${{number_format($item->valor_total, 0, '', '.')}}</td>
                </tr>
              @endforeach
            </table>

          </div>
        </div>
        <div class="panel-footer">
          <div class="row">
            <div class="col-md-4">
              Numero de Items: {{$pedido->num_items}}<br>
              Tipo de entrega: {{ Funciones::tipoPedido($pedido->tipo_compra)}} 
              
            </div>
            <div class="col-md-4">
              ENVIO : <STRONG>${{number_format($pedido->vlr_envio, 0, '', '.')}}</STRONG><br>
              TOTAL COMPRA : <strong> ${{number_format($pedido->total_compra, 0, '', '.')}}</strong>
              
            </div>
            <div class="col-md-4">
              ESTADO DEL PEDIDO:<br> 
              {{Funciones::getEstado($pedido->estado_id)}}<br>
              @if($pedido->estado_id == 1)
              <form method="post" action="{{URL::route('postConfPedido')}}">
                <input type="hidden" name="pedido_id" value="{{$pedido->id}}">
                <input type="submit" class="btn btn-success btn-lg" value="Confirmar pedido">
              </form>
              @else

              @endif
            </div>
            
          </div>

          
        </div>
        
      </div>
      
   </div>

   <div class="row">
      <div class="col-md-12">
          <div class="panel panel-smart">
          <div class="panel-heading">
                <h3 class="panel-title">
                  Datos del Usuario
                </h3>
          </div>
          <div class="panel-body">
            <table class="table table-responsive">
              <th>Id</th>
              <th>Nombre</th>
              <th>email</th>
              <th>Barrio</th>
              <th>Dirección</th>
              <th>Telefono</th>
              <tr>
                <td>{{$pedido->id}}</td>
                <td>{{$pedido->nombre}} {{$pedido->apellido}}</td>
                <td>{{$pedido->email}}</td>
                <td>{{$pedido->bar_nom}}</td>
                <td>{{$pedido->direccion}}</td>
                <td>{{$pedido->telefono}}</td>


              </tr>
            
            </table>

          </div>
        </div>
      </div>
     
   </div>
@stop
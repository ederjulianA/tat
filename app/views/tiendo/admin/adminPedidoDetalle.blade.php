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
              <th colspan="" rowspan="" headers="" scope="">Acciones</th>
              <tbody id="contenedor-productos">
              @foreach($items as $item)
                
                  <tr id="fila-prod-{{$item->id_producto}}">
                    <td>{{$item->id_producto}}</td>
                    <td>{{$item->nombre}}</td>
                    <td id="can_pro-{{$item->id_producto}}">{{$item->cantidad}}</td>
                    <td>${{number_format($item->valor_unitario, 0, '', '.')}}</td>
                    <td>{{$item->iva}}</td>
                    <td id="val_total-{{$item->id_producto}}">${{number_format($item->valor_total, 0, '', '.')}}</td>
                    @if($pedido->estado_id > 1)
                      <td colspan="" rowspan="" headers=""> <a>Eliminar</a></td>
                    @else
                    <td colspan="" rowspan="" headers=""><a href="{{$item->id_producto}}" title="" class="btn-eli-item" id="eliminar-{{$item->id_producto}}" >Eliminar</a></td>
                    @endif
                    
                    
                  </tr>
                
              @endforeach
               </tbody> 
            </table>

            <!--<a href="" title="" class="btn btn-info" data-toggle="modal" data-target="#modalAddItems">Agregar Item</a>-->
            @if($pedido->estado_id > 1)
              <span class="alert alert-warning">El pedido ya ha sido confirmado</span>
              <a href="{{URL::route('pedidopdf',array('id'=>$pedido->id))}} "target="_blank" title="">Generar PDF</a>
            @else
              <a href="" title="" id="loadProd" class="btn btn-info">Agregar Item</a>
            @endif
            
            <!--<a href="" title="" id="loadProdApi" class="btn btn-info">Productos</a>-->
            <input type="hidden" id="urlLoadProd" value="{{URL::route('ajaxLoadProductos')}}">
            <input type="hidden" id="urlAddProd" value="{{URL::route('urlAddProd')}}">
            <input type="hidden" id="urlDeleteProd" value="{{URL::route('urlDeleteProd')}}">
            
            <input type="hidden" id="idPedido" value="{{$pedido->id}}">

            @include('includes/modals/items')




          </div>
        </div>
        <div class="panel-footer">
          <div class="row">
            <div class="col-md-4">
              Numero de Items: <span id="num_items">{{$pedido->num_items}}<span><br>
              
            
              
            </div>
            <div class="col-md-4">
              ENVIO : <STRONG>${{number_format($pedido->vlr_envio, 0, '', '.')}}</STRONG><br>
              TOTAL COMPRA : <strong id="total_compra"> ${{number_format($pedido->total_compra, 0, '', '.')}}</strong>
              <p id="tipo_entrega">Tipo de entrega: {{$pedido->nom_metodo}}  </p>
              
            </div>
            <div class="col-md-4">
              ESTADO DEL PEDIDO:<br> 
              <span class="label label-danger"> {{$pedido->nom_est}}</span>
              <br>
              @if($pedido->estado_id == 1)
              <form method="post" action="{{URL::route('postConfPedido')}}">
                <input type="hidden" name="pedido_id" id="pedido_id" value="{{$pedido->id}}">
                <input type="submit" class="btn btn-success btn-lg" value="Confirmar pedido">
              </form>
              @endif

              @if($pedido->estado_id == 2)
                <input type="hidden" id="urlReparto" value="{{URL::route('urlReparto')}}">
                 <input type="hidden" name="pedido_id" id="pedido_id" value="{{$pedido->id}}">
                <a href="#" title="" id="btnReparto" class="btn btn-warning">Confirmar pedido en reparto</a>
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

@section('scripts')
  <script src="{{asset('tat/js/loads.js')}}"></script>
@stop
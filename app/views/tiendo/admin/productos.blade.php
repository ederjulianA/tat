@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('titulo1')
  Productos
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
    
  <a href="" title="" id="loadProdApi" class="btn btn-info"> Sincronizar Productos</a>
  <input type="hidden" id="urlSync" value="{{URL::route('urlSync')}}">
    <table class="table">
      <thead>
        <th>Id producto</th>
        <th>Nombre</th>
        
        <th>Acciones</th>
      </thead>
      <tbody>
        @foreach($productos as $pro)
          <tr>
            <td>{{$pro->id}}</td>
            
            <td>{{$pro->pro_nom}} </td>
          
          
            <td><a href="/admin/articulo/{{$pro->id}}" class="btn btn-success">Editar Descripción</a></td>
          </tr>
        @endforeach
      </tbody>
      
    </table>
  </div>  
@stop

@section('scripts')
  <script src="{{asset('tat/js/loads.js')}}"></script>
@stop
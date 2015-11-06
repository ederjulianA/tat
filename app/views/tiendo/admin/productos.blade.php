@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('titulo1')
  Productos
@stop

@section('content')
<input type="hidden" id="urlSeaCod" value="{{URL::route('urlSeaCod')}}">
  <input type="hidden" id="urlSync" value="{{URL::route('urlSync')}}">
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
    <div class="ajax2">
      
    </div>
  <!--<a href="" title="" id="loadProdApi" class="btn btn-info"> Sincronizar Productos</a>-->
  <a href="{{URL::route('mantisSync')}}"class="btn btn-info"  title="">Sincronizar Productos</a>
  <div>
    <p>Total de productos: {{$numPros}}</p>
      <div class="container">
        <div class="row">
            <div class="col-md-4">
                 <div class="form-group">
                    <label> Artcod</label>
                    <input type="text" class="form-control filters" id="seaCod">
                    
                 </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                    <label> Nombre</label>
                    <input type="text" class="form-control filters" id="seaNom">
                    
                 </div>
            </div>
            <div class="col-md-4">
              aa
            </div>
          
        </div>
      </div>
    
  </div>
  
    <table class="table">
      <thead>
        <th>Id producto</th>
        <th>ArtCod</th>
        <th>Nombre</th>
        
        <th>Acciones</th>
      </thead>
      <tbody id="cont-pro">
        @foreach($productos as $pro)
          <tr>
            
            <td>{{$pro->id}}</td>
            <td>{{$pro->id_mantis}}</td>
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
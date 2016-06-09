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
  {{--<a href="{{URL::route('mantisSync')}}"class="btn btn-info"  title="">Sincronizar Productos</a>--}}
  <div>
    {{--<p>Total de productos: {{$numPros}}</p>--}}
      <div class="container">
        <div class="row">
          <form method="get" action="{{URL::route('adminProductos')}}">
            <div class="col-md-4">
                 <div class="form-group">
                    <label> Artcod</label>
                    <input type="text" class="form-control filters" value="{{Input::get('ArtCod')}}" id="seaCod" name="ArtCod">
                    
                 </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                    <label> Nombre</label>
                    <input type="text" class="form-control filters" value="{{Input::get('ArtNom')}}" id="seaNom" name="ArtNom">
                    
                 </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <input type="submit" class="btn btn-info" value="Buscar">
               </div> 
            </div>
          </for>  
          
        </div>
      </div>
    
  </div>
  {{--<div class="row conte">
    
  </div>--}}
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
     {{$productos->appends(array('ArtCod' => Input::get('ArtCod'),'ArtNom'=>Input::get('ArtNom')))->links()}}
  </div>  {{--Div contenedor--}}
@stop

@section('scripts')
  {{--<script src="{{asset('tat/js/loads.js')}}"></script>--}}
@stop
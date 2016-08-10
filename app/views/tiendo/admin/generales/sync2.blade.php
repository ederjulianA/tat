@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop



@section('titulo1')
  TIPOS DE ENTREGA
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
  <div class="container">
      <div class="jumbotron">
          <h1 id="tSync">Sincronizar </h1>
       
         <p> Para que la sincronización se realice de forma correcta  debes hacerlo en el siguiente orden: </br> <strong>Familia </strong>-<strong> Sub grupo </strong>-<strong> grupo</strong> y finalmente sincronizar <strong>Articulos</strong></p>
      </div>

       <div class="row">
        <a href="#"class="btn btn-info btn-lg sync"  title="" id="loadFamilias">Sincronizar Familia ({{$AllFam}} Registros)</a>
        <a href="#"class="btn btn-success btn-lg sync" title="">Sincronizar Subgrupo ({{$AllSubG}} Registros)</a>
        <a href="#"class="btn btn-warning btn-lg sync" title="" id="loadGrupos" >Sincronizar Grupo ({{$AllGru}} Registros)</a>
        <a href="#"class="btn btn-danger btn-lg sync" title=""id="loadTestPro">Sincronizar Articulos ({{$AllArt}} Registros)</a>
        
         <input type="hidden" id="urlTestPro" value="{{URL::route('urlTestPro')}}">
                <input type="hidden" id="urlTestSavePro" value="{{URL::route('urlTestSavePro')}}">


                <input type="hidden" id="urlSaveGrupos" value="{{URL::route('urlSaveGrupos')}}">
                <input type="hidden" id="urlSaveFamilias" value="{{URL::route('urlSaveFamilias')}}">
      </div>
  </div>
 

@stop

@section('scripts')
  <script src="{{asset('tat/js/adminTipEnt.js')}}"></script>
  <script src="{{asset('tat/js/Sync.js')}}"></script>
  <script src="{{asset('tat/js/Cate.js')}}"></script>

@stop
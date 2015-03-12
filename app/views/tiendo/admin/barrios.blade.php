@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('titulo1')
  <h1>BARRIOS</h1>
@stop
<style type="text/css">

  
</style>
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

    <!--<div class="cont-busc">
      <div class="formB">
             <form method="get" action="{{URL::route('searchBarrio')}}">
                   <input type="text" id="bar_nom" name="bar_nom">
                   <button type="submit" class="btn btn-info" id="">Buscar Barrio</button>
                </form> 
        
      </div>
      
    </div>-->

    <div class="row">
        <div class="col-md-12">
          
          <h2>Buscar barrio por nombre</h2>
            <div class="form-group has-success has-feedback">
                <form method="get" class="form-horizontal" action="{{URL::route('searchBarrio')}}">
                <div class="form-group">
                    <label for="bar_nom" class="col-sm-3 control-label">Nombre del barrio :</label>
                      <div class="col-sm-6">
                       <input type="text" id="bar_nom" name="bar_nom" class="form-control">
                       <input type="hidden" id="urlBarriosVajax" value="{{URL::route('urlBarriosVajax')}}">
                        <!-- <select name="sel_ciudad" id="sel_ciudad" >

                            <option value="0">Todas</option>
                            @foreach($ciudades as $ciu)
                              <option value="{{$ciu->id}}">{{$ciu->ciu_nom}}</option>
                           @endforeach
                         
                         </select>-->
                      </div> 
                </div>
                <div class="btn-footer">
                  <button type="submit" class="btn-ok" id="">Buscar Barrio <i class="fa fa-sign-out"></i></button>
                  <button href="#" class="btn-borrar" id="btn_borrar_dias">Borrar todos los días de visitas <i class="fa fa-exclamation-triangle"></i></button>
                </div>
                   
                </form> 
               
            </div>
           
        </div>  
      
    </div>

    <div class="row">
      <div class="col-md-12">
 

          <table class="table">
              <th>
                Barrio
              </th>
              @foreach($d as $dia)
                <th>
                  {{$dia->dia_nom}}
                </th>
              @endforeach
              <tbody id="contenedor_barrios">
               
              
              @foreach($b as $ba)
                <tr>
                  <td>
                    {{$ba->bar_nom}}
                  </td>
                       @foreach($d as $dia)
                          <td>
                           {{Form::checkbox($dia->dia_nom, Funciones::getCheck($dia->id,$ba->id) , Funciones::getCheck($dia->id,$ba->id), array('class' => Funciones::classDia($dia->id,$ba->id),'data'=>$dia->id,'id'=>'dia-'.$dia->id.'-'.$ba->id,'dataBarrio'=>$ba->id))}}
                          </td>
                        @endforeach
                </tr>
              @endforeach
              </tbody>
            
          </table>
        
      </div>
      
    </div>

<div class="modal signUpContent fade" id="ModalEliminar" tabindex="-1" role="dialog" >
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header modalHeader">
        <button type="button" id="closeModal" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h3 class="modal-title-site text-center" > ALERTA </h3>
      </div>
      <div class="modal-body">
        <div class="info-item">
          <h2>Si le da click a continuar se eliminaran los días de visita asignados</h2>
          <h4>
            desea continuar ???
          </h4>
        </div>
      
        
      </div>
      <div class="modal-footer">
        <a href="#"id="btn_conf_eli" class="btn btn-info">Continuar</a> -- <a href="#" class="btn btn-danger" id="btn_canc_eli">Cancelar</a>
        
      </div>
    </div>
    <!-- /.modal-content --> 
    
  </div>
  <!-- /.modal-dialog --> 
  
</div>
<!-- /.Modal Login --> 
     
@stop

@section('estilos')
<link rel="stylesheet" href="{{asset('tat/css/barrios.css')}}">
@stop
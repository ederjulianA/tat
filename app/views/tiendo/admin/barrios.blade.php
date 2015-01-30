@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('titulo1')
  <h1>BARRIOS</h1>
@stop
<style type="text/css">
  
  .item{
    text-align: center;
    padding: 5px;
    box-shadow: 1px 2px 2px rgba(0,0,0,.5);
  }
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

    <div class="row">
        <div class="col-md-12">
          
          <h2>Buscar barrio por nombre</h2>
            <div class="form-group has-success has-feedback">
                <form method="get" action="{{URL::route('searchBarrio')}}">
                   <input type="text" id="bar_nom" name="bar_nom">
                   <button type="submit" class="btn btn-info" id="">Buscar Barrio</button>
                </form> 
               <a href="#" class="btn btn-danger" id="btn_borrar_dias">Borrar todos los días de visitas</a>
            </div>
            <div class="row">
              <div class="col-md-5">
                <h3>Resultados</h3>
                <div class="r_ajax" id="r_ajax">
                  
                </div>
              </div>

              <div class="col-md-7">
                
              </div>
              

              
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
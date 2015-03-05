@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('titulo1')
  <h1>BARRIOS</h1>
@stop
<style type="text/css">

  #btn-volver{
    text-decoration: none;
    background-color: #AEAEAE;
    border-bottom: 3px solid #818181;
    color: #fff;
    margin: 5px;
    font-weight: bold;
    padding: .2em 1em;
    font-size: 20px;
    border-radius: 3px;
  }
  #btn-editar{
    text-decoration: none;
    background-color: #ff4842;
    border-bottom: 3px solid #d0272a;
    color: #fff;
    font-weight: bold;
    margin: 5px;
    padding: .3em 1em;
    font-size: 20px;
    border-radius: 3px;
  }
  
  .item{
    text-align: center;
    padding: 5px;
    box-shadow: 1px 2px 2px rgba(0,0,0,.5);
  }
  .cont-busc{
    width: 80%;
    margin: 0 auto;
    padding: 5px;
    max-width: 100%;
  }
  .formB{
    width: 90%;
  }
  .formB input {
    width: 60%;
  }
  .formB button {
    width: 25%;
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
                <form method="get" action="{{URL::route('searchBarrio')}}">
                   <input type="text" id="bar_nom" name="bar_nom">
                   <input type="hidden" id="urlBarriosVajax" value="{{URL::route('urlBarriosVajax')}}">
                  <!-- <select name="sel_ciudad" id="sel_ciudad" >

                      <option value="0">Todas</option>
                      @foreach($ciudades as $ciu)
                        <option value="{{$ciu->id}}">{{$ciu->ciu_nom}}</option>
                     @endforeach
                   
                   </select>-->
                   <button type="submit" class="btn btn-info" id="">Buscar Barrio</button>
                </form> 
               <a href="#" class="btn btn-danger" id="btn_borrar_dias">Borrar todos los días de visitas</a>
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
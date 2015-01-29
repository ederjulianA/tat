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

    <div class="row">
        <div class="col-md-12">
          
          <h2>Buscar barrio por nombre</h2>
            <div class="form-group has-success has-feedback">
                 <input type="text" id="bar_nom">
                 <button type="button" class="btn btn-info" id="btn_b_barrio">Buscar Barrio</button>
               
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
     
@stop
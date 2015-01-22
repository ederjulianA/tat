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
    <!--<div class="container">
         <div class="row">
            @foreach($barrios as $barrio)
              <div class="col-md-4 item">
                <h2>{{$barrio->bar_nom}}</h2>
                <P>
                  <form method="post" action="{{URL::route('addDia')}}">
                  {{ Form::select('ndia', $dias,['class'=>'Ndia']) }}                  
                  <input type="hidden" name="barrio_id" value="{{$barrio->id}}">
                  <input type="submit" class="btn btn-success" value="Agregar Dia">
                 </form>
                </P>

                <p>
                  <h2>Dias de visita</h2>

                  <ul>
                    
                  
                    @foreach($barrio->dias as $dia)
                      <li>{{$dia->dia_nom}} -



                      <form method="post" action="{{URL::route('deleteDay')}}">
                          <input type="hidden" name="dia_id" value="{{$dia->id}}">
                          <input type="hidden" name="barrio_id" value="{{$barrio->id}}">
                          <input type="submit" class="" value="Eliminar Dia">
                       </form> -</li>

                    @endforeach
                  </ul>  
                </p>
                
              </div>

             @endforeach 


      </div>
    </div>-->

    <div class="row">
      <div class="col-md-12">
          <!--<table class="table">
              <th>
                Barrio
              </th>
              <th>
                Lun
              </th>
              <th>
                Mar
              </th>
              <th>
                Mier
              </th>
              <th>
                Jue
              </th>
              <th>
                Vie
              </th>
              <th>
                Sab
              </th>
              <th>
                Dom
              </th>

              
              @foreach($b as $barrio)
                <tr>
                  <td>{{$barrio->bar_nom}}</td>
                  <td>
                    {{Form::checkbox('lun', $barrio->lunes, $barrio->lunes, array('class' => 'conf','data'=>$barrio->id,'id'=>'conf-'.$barrio->id))}}
                  </td>
                </tr>
              @endforeach
            
          </table>-->

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
     
@stop
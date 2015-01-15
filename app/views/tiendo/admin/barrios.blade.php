@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('titulo1')
  BARRIOS
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
    
  
    <div class="row">
        <div class="col-md-12">
             <div class="panel panel-smart">
          <div class="panel-heading">
                <h3 class="panel-title">
                  Asignar dias de visita a os barrios
                </h3>
          </div>
          <div class="panel-body">
          @foreach($barrios as $barrio)
            <div class="barrioItm">
                <h2>{{$barrio->bar_nom}} 
                  <form method="post" action="{{URL::route('addDia')}}">
                  {{ Form::select('ndia', $dias,['class'=>'Ndia']) }}
                    <input type="hidden" name="barrio_id" value="{{$barrio->id}}">
                    <input type="submit" class="btn btn-success" value="Agregar Dia">
                  </form>
                </h2>
                <div class="diaV">
                  <ul>
                    @foreach($barrio->dias as $dia)
                     
                      <li>  {{$dia->dia_nom}}---
                        <form method="post" action="{{URL::route('deleteDay')}}">
                          <input type="hidden" name="dia_id" value="{{$dia->id}}">
                          <input type="hidden" name="barrio_id" value="{{$barrio->id}}">
                          <input type="submit" class="btn btn-danger" value="Eliminar Dia">
                        </form>
                      </li>
                      
                    @endforeach 
                 </ul>
                  
                </div>
                  
                
            </div>
          @endforeach 
            

          </div>
        </div>
          
        </div>
      
  
    </div>
  </div>  
@stop
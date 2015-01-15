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
                  Asignar dias de visita a los barrios
                </h3>
          </div>
          <div class="panel-body"> 
          <table class="table table-responsive">
                <tr>
                  <th><h2>Barrios</h2></th>
                  <th><h2>Días</h2></th>
                  <th><h2>Agendar</h2></th>
                  <th><h2>Días Agendados</h2></th>
                  <th><h2>Eliminar día agendado</h2></th>
                </tr>
                @foreach($barrios as $barrio)
                <tr>
                  <td><h3>{{$barrio->bar_nom}}</h3></td>
                
            <!--<div class="barrioItm"> 
                <h2>{{$barrio->bar_nom}} -->

                  <form method="post" action="{{URL::route('addDia')}}">
                  <td>{{ Form::select('ndia', $dias,['class'=>'Ndia']) }}</td>                  
                  <td><input type="hidden" name="barrio_id" value="{{$barrio->id}}">
                  <input type="submit" class="btn btn-success" value="Agregar Dia"></td>
                  </form>
    
                    <div class="diaV">
                  
                      @foreach($barrio->dias as $dia)
                     
                      <td><h3>{{$dia->dia_nom}}</h3></td> 

                       <form method="post" action="{{URL::route('deleteDay')}}">
                          <input type="hidden" name="dia_id" value="{{$dia->id}}">
                          <input type="hidden" name="barrio_id" value="{{$barrio->id}}">
                          <td><input type="submit" class="btn btn-danger" value="Eliminar Dia"></td>
                       </form>
                      </li>
                      @endforeach
                    </tr>            
                    </div>
                  @endforeach  
              </table>
                                
            </div>
           
          </div>
        </div>
          
        </div>
      
  
    </div>
  </div>  
@stop
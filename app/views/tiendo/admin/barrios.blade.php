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
    <div class="container">
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
    </div>
     
@stop
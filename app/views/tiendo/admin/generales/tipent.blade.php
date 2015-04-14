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
    <h1>Tipos de Entrega</h1>
        <p>
          <table class="table">
          <tr>
            <th colspan="" rowspan="" headers="" scope="">id</th>
            <th colspan="" rowspan="" headers="" scope="">Tipo entrega</th>
            <th colspan="" rowspan="" headers="" scope="">Tiempo de entrega</th>
            <th colspan="" rowspan="" headers="" scope="">Valor</th>
            <th colspan="" rowspan="" headers="" scope="">Acción</th>

           </tr> 
            <tbody id="con-tipent">
              @foreach($envios as $envio)
              <tr id="fila-{{$envio->id}}">
                <td>{{$envio->id}}</td>
                <td>{{$envio->nom_metodo}}</td>
                <td>{{$envio->tiempo_entrega}}</td>
                <td>{{number_format($envio->valor, 0, '', '.')}}</td>
                <td colspan="" rowspan="" headers=""><a href="{{$envio->id}}" title="" class="btn btn-info tipos" id="tipenv-{{$envio->id}}">Eliminar</a></td>
               </tr> 
              @endforeach
              
            </tbody>
          </table>

          <table class="table">
            <caption>Crear un nuevo tipo de entrega</caption>
            <thead>
            <input type="hidden" id="urlTipEnvDelete" value="{{URL::route('urlTipEnvDelete')}}">
            <form id="formTipEnv" method="post" action="{{URL::route('urlTipEnv')}}">
              <tr>
                <th></th>
                <th colspan="" rowspan="" headers="" scope=""> <input type="text" class="form-control" name="nom_metodo" id="nom_metodo" placeholder="Nombre del tipo de envio"></th>
                <th colspan="" rowspan="" headers="" scope=""> <input type="text" class="form-control"name="tiempo_entrega" id="tiempo_entrega" placeholder="Tiempo de entrega"></th>
                <th colspan="" rowspan="" headers="" scope=""> <input type="number" class="form-control" name="valor" id="valor" placeholder="valor del envio $"></th>
              </tr>
              
            </thead>
           
          </table>
        </p>
        <p><button type="submit" class="btn btn-primary btn-lg" href="#" role="button">Crear</a></button>
        <!--en este div mostramos el preloader-->
            <div style='margin: 10px 0px 0px 300px' class='before'></div>   
            <!--en este los errores del formulario--> 
            <div class='errors_form'></div>
            <!--en este el mensaje de registro correcto-->
            <div style='display: none' class='success_message alert-box success'></div>    
            {{Form::token()}} 
        </form>
        
      </div>
    
  
 
  </div>  
@stop

@section('scripts')
  <script src="{{asset('tat/js/adminTipEnt.js')}}"></script>
@stop
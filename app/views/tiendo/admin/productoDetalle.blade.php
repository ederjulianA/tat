@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('titulo1')
  Detalle Art. {{$producto->id}}
@stop

@section('content')
<script type="text/javascript">
  
</script>
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
  .contenedor{
    max-width: 100%;
    width: 95%;
    position: relative;
    margin: 10px auto;
    background-color: #fff;
    border: 1px solid #333;
    border-radius: 5px;
    text-align: center;
    padding: 10px;
  }
  .contenedor h2 {
    font-size: 30px;
    font-weight: bold;
    margin-bottom: 10px;
  }
  .contenedor p {
    text-align: left;
    letter-spacing: 1px;
    font-size: 20px;
    padding: 10px;
  }

  .ajaxR {
    border:.5px solid #F08521;
    position: absolute;
    width: 250px;
    font-size: 20px;
    font-weight: bold;
    text-shadow: 2px 2px 1px rgba(0,0,0,.4);
    color: #fff;
    background-color: #f90;
    padding: 5px;
    display: none;
  }
</style>
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
    <div class="ajaxR">
      Producto actualizado
      
    </div>
    <h2>{{$producto->pro_nom}}</h2>
    <p>
      A continuación podrás editar la descripción del artículo seleccionado
    </p>
    <hr>
    <div class="form-editar">
      <form>
        <textarea id="input" name="input">{{$producto->descripcion}}</textarea>
        <input type="hidden" id="id_prod" value="{{$producto->id}}">
      </form>
      <div class="footer-editar">
        <a href="/admin/productos" id="btn-volver">Volver</a>
        <a href="" id="btn-editar">Guardar Cambios</a>
        
      </div>
    </div>
  
 
  </div>  
@stop

@section('scripts')
  <script src="{{asset('tat/cleditor/jquery.cleditor.min.js')}}"></script> <!-- Charts & Graphs -->
@stop
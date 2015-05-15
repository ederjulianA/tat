@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop



@section('titulo1')
  Promociones
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
    
      
      <div class="row">
          <div class="col-md-5">
            <h2>Promociones</h2>
              <form method="post" enctype="multipart/form-data" action="{{URL::route('postNewPromo')}}">
                  <div class="form-group">
                    <label for="titulo">Titulo Promoción</label>
                    <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Titulo descripción" required>
                  </div>
                  <div class="form-group">
                    <label for="valor">Valor de la Promoción</label>
                    <input type="text" class="form-control" id="valor" name="valor" placeholder="Valor promoción" required>
                  </div>
                  <div class="form-group">
                    <label for="desc">Descripción Promo</label>
                    <textarea name="desc" class="form-control" required></textarea>
                  </div>
                  <div class="form-group">
                    <label for="imgP">Imagen Promocion</label>
                    <input type="file" id="imgP" name="imgP" required>
                    <p class="help-block">Example block-level help text here.</p>
                  </div>
                  <!--<div class="checkbox">
                    <label>
                      <input type="checkbox"> Check me out
                    </label>
                  </div>-->
                  <button type="submit" class="btn btn-default">Crear</button>
                </form>
          </div>

          <div class="col-md-7">
            <h2>Tus Promociones</h2>

                <div class="row">
                  @foreach($promos as $promo)
                  <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                      <img src="{{asset($promo->imgC)}}" alt="...">
                      <div class="caption">
                        <h3>{{$promo->titulo}}</h3>
                        
                        <p><a href="" class="btn btn-primary" role="button">Editar</a> <a href="{{$promo->id}}" id="btnDeletePromo" class="btn btn-default" role="button">Eliminar</a></p>
                      </div>
                    </div>
                  </div>

                  @endforeach

                  
                </div>

                  
            
          </div>

        
      </div>
      
    
  
 
  </div> 
</div>


<!-- MODAL PARA CONFIRMAR EL EVENTO DE BORRAR LA PROMOCIÓN-->
<!-- Modal -->
<div class="modal fade" id="ModalDelPromo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Eliminar Promoción</h4>
      </div>
      <div class="modal-body">
        Desea eliminar ésta promoción ?
        <input type="hidden" id="idPromo" value="">

        <div class="before">
          
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" id="confDelete"  class="btn btn-primary">Eliminar</button>
      </div>
    </div>
  </div>
</div>
@stop

@section('scripts')
  <script src="{{asset('tat/js/adminTipEnt.js')}}"></script>
@stop
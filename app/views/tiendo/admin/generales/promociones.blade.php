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
                        
                        <p><a href="#" class="btn btn-primary" role="button">Editar</a> <a href="#" class="btn btn-default" role="button">Eliminar</a></p>
                      </div>
                    </div>
                  </div>

                  @endforeach

                  
                </div>

                  
            
          </div>

        
      </div>
      
    
  
 
  </div> 
</div>
@stop

@section('scripts')
  <script src="{{asset('tat/js/adminTipEnt.js')}}"></script>
@stop
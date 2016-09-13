@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop

<style type="text/css">
  .contenedor
  {
    max-width: 100%;
    width: 80%;
    margin: 0 auto;
    text-align: center;
  }

  .pedidoItem{
    max-width: 100%;
    width: 90%;
    margin: 5% auto;
    border-bottom: 2px solid #415A75;
    background-color: #648CB7;
    color: #fff;
  }
  .pedidoItem h4, .pedidoItemRuta h4  {
    font-weight: bold;
    color: #fff;
    text-shadow: 1px 2px 2px rgba(0,0,0,.5);
  }
  .pedidoItemRuta {
     max-width: 100%;
    width: 90%;
    margin: 5% auto;
    border-bottom: 2px solid #971E30;
    background-color: #BB2138;
    color: #fff;
  }

</style>

@section('titulo1')
  Banners
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
      <div class="row">

          <div class="col-md-4">
            <div class="container">
                    {{ Form::open(['route'=>'addBanner','method'=>'POST','role'=>'form','files'=>true]) }}
                      <div class="form-group">
                          <label> Titulo: <input type="text"class="form-control" name="titulo" value=""required></label>
                          {{ $errors->first('titulo','<p class="alert alert-danger">:message</p>') }}
                      </div>
                      <div class="form-group">
                          <label> Posición: <input type="number"class="form-control" name="pos" value=""required></label>
                      </div>
                      <div class="form-group">
                          <label> Activo: <input type="checkbox"class="" name="est" value=""></label>
                      </div>
                      <div class="form-group">
                          <label> Imagen (1920x658): <input type="file"class="" name="img" value=""></label>
                      </div>

                      <input type="submit" class="btn btn-primary"name="btnAddBner" value="Agregar banner">
               {{ Form::close()}}
            </div>
              
          </div>
        
      </div>
      
    </div>
 
@stop
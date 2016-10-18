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

    <div class="container" ng-controller="banCtrl">
      {{--<div class="row">

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



        
          <div class=" col-md-8"  ng-repeat="b in bans">
            <div class="thumbnail">
              <img src="/@{{b.img}}" alt="@{{b.titulo}}" height="200px" width="auto">
              <div class="caption">
                <h3>@{{b.titulo}}</h3>
                <p>
                  <input type="hidden" value="@{{b.id}}" ng-model="b.idBan">
                  <input checked="@{{b.activo}}"  ng-model="act" type="checkbox" >
                  <br>
                  <input type="number" value="@{{b.pos}}">
                </p>
                <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
              </div>
            </div>
          </div>
      
      </div>--}}
      <div class="row">

      <div class="col-md-4">

              <div class="widget wred">
                <div class="widget-head">
                  <div class="pull-left">Agregar nuevo banner</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">
                    
                    <h5>Agregar</h5>
                    <div class="container">
                    {{ Form::open(['route'=>'addBanner','method'=>'POST','role'=>'form','files'=>true]) }}
                      <div class="form-group">
                          <label> Titulo: <input type="text"class="form-control" name="titulo" value=""required></label>
                          {{ $errors->first('titulo','<p class="alert alert-danger">:message</p>') }}
                      </div>
                      <div class="form-group">
                          <label> Posición: <input type="number"class="form-control" name="pos" value=""required></label>
                      </div>
                      {{--<div class="form-group">
                          <label> Activo: <input type="checkbox"class="" name="est" value=""></label>
                      </div>--}}
                      <div class="form-group">
                          <label> Imagen (1920x658): <input type="file"class="" name="img" value=""></label>
                      </div>

                      <input type="submit" class="btn btn-primary"name="btnAddBner" value="Agregar banner">
               {{ Form::close()}}
            </div>
                   

 

                                                     
                    <hr />


                   {{--}} <h5>Modal</h5>
                   
                    <a href="#myModal" class="btn btn-info" data-toggle="modal">Launch demo modal</a>--}}
                     
                    <!-- Modal -->
                    {{--<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Modal title</h4>
                      </div>
                      <div class="modal-body">
                        <p>One fine body…</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                      </div>
                    </div>
          </div>
          </div>--}}
                    <hr />


                  </div>
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
              </div>  

            </div>
            <div class="col-md-8">

              <div class="widget wviolet">
                <div class="widget-head">
                  <div class="pull-left">Mis banners  </div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">
                  <input type="hidden" value="{{URL::route('activo')}}" id="UrlActivo">
                  @foreach($bans as $b)
                  <div class="banitem">
                    <h5>{{$b->titulo}}</h5>

                       <div class="thumbnail">
                          <img src="{{asset($b->img)}}" alt="{{$b->titulo}}" height="100%" width="auto">
                          <div class="caption">
                            <h3></h3>
                            <p>
                              <input type="hidden" value="{{$b->id}}">
                              <label>Activo: </label>

                              {{ Form::checkbox('activo', $b->activo, $b->activo, ['class' => 'cb-act','id'=>'act-'.$b->id,'data'=>$b->id]) }}
                              

                              
                             <br>
                              <input type="number" value="{{$b->pos}}" class="pos-act" id="pos-{{$b->id}}" data="{{$b->id}}">
                            </p>
                            <p><a href="#" class="btn btn-primary btnActBan"data="{{$b->id}}" role="button">Actualizar</a> <a href="#modal-{{$b->id}}" class="btn btn-default"data-toggle="modal" role="button">Button</a></p>
                          </div>
                        </div>
                     
                    <hr />
                  </div>



                  <div id="modal-{{$b->id}}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">{{$b->titulo}}</h4>
                      </div>
                      <div class="modal-body">
                        <p> Desea eliminar este banner de la tienda ?</p>
                      </div>
                      <div class="modal-footer">
                        <form action="{{URL::route('delBan')}}" method="post">
                        <input type="hidden" name="id" value="{{$b->id}}">
                        <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                        </form>
                      </div>
                    </div>
          </div>
          </div>

                  @endforeach
                    

                 


        
       
 





                  </div>{{--end pad--}}
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
              </div>                

            </div>

          </div>
      
    </div>
 
@stop

@section('scripts')
  <script src="{{asset('tat/js/angular.min.js')}}"></script> <!-- Charts & Graphs -->
        <script src="{{asset('tat/js/app2.js')}}"></script>
        <script src="{{asset('tat/js/tat.js')}}"></script>
@stop
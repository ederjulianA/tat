@extends('layouts.cotra')


@section('menu')
	@include('includes.cotracolta.pri.menu')
@stop

@section('content')
	<div class="wrap">
       
            <!-- Main Content -->
                <div class="content margin-top60 margin-bottom60">
                    <div class="container">
                        <div class="row">
                            <!-- My Order Table -->
                            <div class="col-sm-9 col-md-9 col-lg-9">
                                <div class="my-account">

                                    <div class="col-sm-6 col-md-6">
                                            <h3 class="subtitle">Mis direcciones</h3>
                                            <button type="button" class=" btn btn-color" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><i class="fa fa-pencil"></i>Open modal for @mdo</button>
                                            
                                        </div>

                                     <div class="col-sm-6 col-md-6">
                                        
                                   
                                    <div class="row">
                                     
                                        
                                        <div class="clearfix"></div>
                                        @if($dir)
                                            @foreach($dir as $d)
                                            <div class="col-sm-6 col-md-6">
                                                <h3 class="subtitle">{{$d->dir}}</h3>
                                                <address>
                                                    {{$d->contacto}}<br>
                                                    
                                                    Bucaramanga, Santander<br>
                                                    Colombia<br>
                                                    <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Editar</a>
                                                </address>
                                            </div>
                                            @endforeach
                                        @else
                                        @endif
                                    </div>
                                     </div>   
                                    
                                    {{--<div class="bottom-padding">
                                        <div class="title-box">
                                            <h3>Mis Direccioness</h3>
                                        </div>
                                     
                                        <!-- /Table  -->
                                    </div>
                                    <div class="title-box">
                                        <h2 class="title">Información de la cuenta</h2>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 info-box">
                                            <h3 class="subtitle">Información de contacto</h3>
                                            <p>
                                                Mr. Cliente<br>
                                                mr-cliente@mail.com<br>
                                                <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Cambiar contraseña</a>
                                            </p>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <h3 class="subtitle">Agregar</h3>
                                            <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Editar direcciones</a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-sm-6 col-md-6">
                                            <h3 class="subtitle">Editar dirección de envío</h3>
                                            <address>
                                                Mr. Cliente<br>
                                                Dirección<br>
                                                Bucaramanga, Santander<br>
                                                Colombia<br>
                                                <a href="#" class="btn btn-color padding-top10"><i class="fa fa-pencil"></i> Editar</a>
                                            </address>
                                        </div>
                                    </div>--}}
                                </div>
                            </div>
                            <!-- /My Order Table -->
                            <!-- Sidebar -->
                                @include('includes.cotracolta.pri.sidebar')
                            <!-- /Sidebar -->
                        </div>
                    </div>
                </div>
                <!-- Main Content -->
    
            <!-- Footer -->
         
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Nueva dirección</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="{{URL::route('postNewAddress')}}">
        <div class="row">
          <div class="col-md-6">
              <div class="form-group">
                <label for="recipient-name" class="control-label">Departamento:</label>
                <select class="selectpicker form-control"name="selDep" id="selDep" data-live-search="true" required>
                </select>
               </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
            <label for="recipient-name" class="control-label">Ciudad:</label>
            <select class="selectpicker form-control" name="selCiu" id="selCiu" data-live-search="true" required>
            </select>
          </div>
          </div>
        </div>

        <div class="row">   
            <div class="col-md-8">
              <div class="form-group">
                <label for="recipient-name" class="control-label">Contacto:</label>
                <input type="text" class="form-control" name="contacto" required>
               </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <label for="recipient-name" class="control-label">Telefono:</label>
                <input type="text" class="form-control" name="tel" required>
               </div>
            </div>
        </div>
          
          
          <div class="form-group">
            <label for="message-text" class="control-label">Dirección:</label>
            <input type="text" class="form-control" name="dir">
          </div>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-color">Guardar</button>
      </div>

      </form>
    </div>
  </div>
</div>

@stop

@section('scripts')
    
    <script src="{{asset('tat/js/loadBarrios.js')}}"></script>
    
    

@stop 
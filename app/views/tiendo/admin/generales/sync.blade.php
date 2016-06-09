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
         <h1 id="tSync">Sincronizar </h1>
         <p> Para que la sincronización se realice de forma correcta  debes hacerlo en el siguiente orden: </br> <strong>Familia </strong>-<strong> Sub grupo </strong>-<strong> grupo</strong> y finalmente sincronizar <strong>Articulos</strong></p>


       @if($para)
        <form method="post" action="{{URL::route('adminServerEdit')}}">
          <div class="row">
              <div class="col-md-6">
                  <h3>CONEXIÓN ERP</h3>
                  <div class="form-group">
                    <label>IP del Servidor</label>
                    <input type="text" name="ip"class="form-control" value="{{$para->ip}}"required>
                  </div>
                  <div class="form-group">
                    <label>Nombre de la base de datos</label>
                    <input type="text" name="db"class="form-control" value="{{$para->db}}"required>
                  </div>

                  <div class="form-group">
                    <label>Usuario1</label>
                    <input type="text" name="user" class="form-control" value="{{$para->user}}"required>
                  </div>

                  <div class="form-group">
                    <label>Contraseña</label>
                    <input type="text" name="pass"class="form-control" value="{{$para->pass}}"required>
                  </div>

                  <div class="form-group">
                    <label>Url Imagenes</label>
                    <input type="text" name="urlImg"class="form-control" value="{{$para->urlImg}}"required>
                  </div>
                  <div>
                    <input type="hidden" name="idPar"value="{{$para->id}}">
                    <button type="submit" class="btn btn-success btn-lg">ACTUALIZAR PARAMETROS DE CONEXIÓN</button>
                  </div>
              </div>
         </form>      
              <div class="col-md-6">
                <h2>Probar conexion al erp</h2>
                <form action="{{URL::route('testConn')}}" method="post" accept-charset="utf-8">
                  <button type="submit" class="btn btn-success btn-lg">PROBAR CONEXION</button>
                  
                </form>
                
  {{--<div class='progress-bar' role='progressbar'  aria-valuemin='0' id='pbar' aria-valuemax='100' style='width:0%;'>10%</div></div>--}}

                <a href="#" id="loadTestPro" >Articulos</a>
                <a href="#" id="loadGrupos" >Grupos</a>
                <a href="#" id="loadFamilias" >Familias</a><br>
                <a href="{{URL::route('setPostPrueba')}}">prueba</a><br>
                <form action="{{URL::route('pruebamail')}}" method="post" accept-charset="utf-8">
                  <input type="submit">
                </form>

                <input type="hidden" id="urlTestPro" value="{{URL::route('urlTestPro')}}">
                <input type="hidden" id="urlTestSavePro" value="{{URL::route('urlTestSavePro')}}">


                <input type="hidden" id="urlSaveGrupos" value="{{URL::route('urlSaveGrupos')}}">
                <input type="hidden" id="urlSaveFamilias" value="{{URL::route('urlSaveFamilias')}}">
                
              </div>
          </div>
         
       @else


      <div class="row">
         <form method="post" action="{{URL::route('adminServer')}}">
              <div class="col-md-6">
                  <h3>CONEXIÓN ERP</h3>
                  <div class="form-group">
                    <label>IP del Servidor</label>
                    <input type="text" name="ip"class="form-control" required>
                  </div>
                  <div class="form-group">
                    <label>Nombre de la base de datos</label>
                    <input type="text" name="db" class="form-control" required>
                  </div>

                  <div class="form-group">
                    <label>Usuario</label>
                    <input type="text" name="user" class="form-control" required>
                  </div>

                  <div class="form-group">
                    <label>Contraseña</label>
                    <input type="text" name="pass"class="form-control" required>
                  </div>

                  <div class="form-group">
                    <label>Url Imagenes</label>
                    <input type="text" name="urlImg" class="form-control" required>
                  </div>

                  <div>
                    <button type="submit" class="btn btn-warning btn-lg">ENVIAR</button>
                  </div>
              </div>
           </form>   
          </div>

       @endif
        
      </div>
      <div class="row">
        <a href="{{URL::route('syncFamiliaMantis')}}"class="btn btn-info btn-lg sync" title="">Sincronizar Familia ({{$AllFam}} Registros)</a>
        <a href="{{URL::route('syncCateMantis')}}"class="btn btn-success btn-lg sync" title="">Sincronizar Subgrupo ({{$AllSubG}} Registros)</a>
        <a href="{{URL::route('syncGrupoMantis')}}"class="btn btn-warning btn-lg sync" title="">Sincronizar Grupo ({{$AllGru}} Registros)</a>
        <a href="{{URL::route('mantisSync')}}"class="btn btn-danger btn-lg sync" title="">Sincronizar Articulos ({{$AllArt}} Registros)</a>
        
      </div>
    
  
 
  </div>  

@stop

@section('scripts')
  <script src="{{asset('tat/js/adminTipEnt.js')}}"></script>
  <script src="{{asset('tat/js/Sync.js')}}"></script>
  <script src="{{asset('tat/js/Cate.js')}}"></script>

@stop
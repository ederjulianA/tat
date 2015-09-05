<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Revisa y confirma tus datos
								</h3>
							</div>
							<div class="panel-body">
								

								<form class="form-horizontal" role="form" method="post" action="{{URL::route('postUpdateData')}}">
										<div class="form-group">
											<label for="email" class="col-sm-3 control-label">Nombre :</label>
											<div class="col-sm-9">
											
												{{ Form::text('nombre',$datos->nombre,array('class'=>'form-control','name'=>'nombre','placeholder'=>'')) }}
												{{ $errors->first('nombre','<p class="alert alert-danger">:message</p>') }}
												<input type="hidden" id="NitSec" value="{{Auth::user()->NitSec}}">
											</div>
										</div>

										<div class="form-group">
											<label for="apeelido" class="col-sm-3 control-label">Apellido:</label>
											<div class="col-sm-9">
												{{ Form::text('apellido',$datos->apellido,array('class'=>'form-control','name'=>'apellido','placeholder'=>'')) }}
												{{ $errors->first('apellido','<p class="alert alert-danger">:message</p>') }}
											</div>
											
										</div>
										<div class="form-group">
											<label for="apeelido" class="col-sm-3 control-label">CC o NIT:</label>
											<div class="col-sm-9">
												{{ Form::text('nit',$datos->cedula,array('class'=>'form-control','name'=>'nit','placeholder'=>'')) }}
												{{ $errors->first('nit','<p class="alert alert-danger">:message</p>') }}
											</div>
											
										</div>

										<div class="form-group">
											<label for="apeelido" class="col-sm-3 control-label">Nombre Negocio:</label>
											<div class="col-sm-9">
												{{ Form::text('nom_neg',$datos->nombre_negocio,array('class'=>'form-control','name'=>'nom_neg','placeholder'=>'')) }}
												{{ $errors->first('nom_neg','<p class="alert alert-danger">:message</p>') }}
											</div>
											
										</div>
										<div class="form-group">
											<label for="direccion" class="col-sm-3 control-label">Ciudad:</label>
											<div class="col-sm-9">
												{{ Form::select('ciudad_id', $ciudades, $datos->ciudad, ['class'=>'form-control','id'=>'ciudad_id']) }}
												<!--<a id="d_entrega">Consultar dias de entrega </a>-->
												{{ $errors->first('ciudad_id','<p class="alert alert-danger">:message</p>') }}
												
											</div>

										</div>

										<div class="form-group">
											<label for="direccion" class="col-sm-3 control-label">Barrio:</label>
											<div class="col-sm-9">
												{{ Form::select('barrio_id', $barrios,$datos->barrio_id,['class'=>'form-control','id'=>'barrio_id']) }}
												<!--<a id="d_entrega">Consultar dias de entrega </a>-->
												{{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
												<div class="diasVis">
														<h4>Dias de Entrega</h4>
														<ul id="ulDiasV">
															
														</ul>
													
												</div>
												<input type="hidden" id="urlBarriosAjax" value="{{ URL::route('urlBarriosAjax')}}">
											</div>

										</div>

										<div class="form-group">
											<label for="direccion" class="col-sm-3 control-label">Canal:</label>
											<div class="col-sm-9">
												{{ Form::select('canal_id', $canales, $datos->canal, ['class'=>'form-control','id'=>'canal_id']) }}
												<!--<a id="d_entrega">Consultar dias de entrega </a>-->
												{{ $errors->first('canal_id','<p class="alert alert-danger">:message</p>') }}
												
											</div>

										</div>

										<div class="form-group">
											<label for="direccion" class="col-sm-3 control-label">Dirección:</label>
											<div class="col-sm-9">
												{{ Form::text('direccion',$datos->direccion,array('class'=>'form-control','name'=>'direccion','placeholder'=>'')) }}
												{{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>


										<div class="form-group">
											<label for="telefono" class="col-sm-3 control-label">Telefono:</label>
											<div class="col-sm-9">
												{{ Form::text('telefono',$datos->telefono,array('class'=>'form-control','name'=>'telefono','placeholder'=>'')) }}
												{{ $errors->first('telefono','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>


										<div class="form-group">
											<label for="comentarios" class="col-sm-3 control-label">Comentarios:</label>
											<div class="col-sm-9">
												{{ Form::textarea('comentarios',$datos->comentarios,array('class'=>'form-control','name'=>'comentarios','placeholder'=>'')) }}
												{{ $errors->first('comentarios','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>

										<button type="submit" class="btn btn-warning">Actualizar Datos</button>	
								</form>
								<hr />
							
								
								
							</div>
					</div>

					<!--##########################MODAL CARGAR DIAS DE ENTREGA-->

					<div class="modal signUpContent fade" id="ModalDias" tabindex="-1" role="dialog" >
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header modalHeader">
        <button type="button" id="closeModal" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h3 class="modal-title-site text-center" > DIAS DE ENTREGA PARA EL BARRIO <br><span id="nom_barrio"></span></h3>
      </div>
      <div class="modal-body" id="con_dias">

      	
      
        
      </div>
      <div class="modal-footer">
      	
        
      </div>
    </div>
    <!-- /.modal-content --> 
    
  </div>
  <!-- /.modal-dialog --> 
  
</div>
<!-- /.Modal Login --> 
@section('ajax-val')
<!--<script src="{{asset('tat/js/val-ajax-datos.js')}}"></script>-->
		<script src="{{asset('tat/js/loadBarrios.js')}}"></script>
		
@stop
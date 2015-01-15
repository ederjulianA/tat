<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Ingresa Tus datos de Envio
								</h3>
							</div>
							<div class="panel-body">
								

								<form class="form-horizontal" role="form" method="post" action="{{URL::route('postUpdateData')}}">
										<div class="form-group">
											<label for="email" class="col-sm-3 control-label">Nombre :</label>
											<div class="col-sm-9">
											
												{{ Form::text('nombre','',array('class'=>'form-control','name'=>'nombre','placeholder'=>'')) }}
												{{ $errors->first('nombre','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>

										<div class="form-group">
											<label for="apeelido" class="col-sm-3 control-label">Apellido:</label>
											<div class="col-sm-9">
												{{ Form::text('apellido','',array('class'=>'form-control','name'=>'apellido','placeholder'=>'')) }}
												{{ $errors->first('apellido','<p class="alert alert-danger">:message</p>') }}
											</div>
											
										</div>

										<div class="form-group">
											<label for="direccion" class="col-sm-3 control-label">Barrio:</label>
											<div class="col-sm-9">
												{{ Form::select('barrio_id', $barrios,['class'=>'form-control']) }}
												<a id="d_entrega">Consultar dias de entrega </a>
												{{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
											</div>

										</div>

										<div class="form-group">
											<label for="direccion" class="col-sm-3 control-label">Dirección:</label>
											<div class="col-sm-9">
												{{ Form::text('direccion','',array('class'=>'form-control','name'=>'direccion','placeholder'=>'')) }}
												{{ $errors->first('direccion','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>


										<div class="form-group">
											<label for="telefono" class="col-sm-3 control-label">Telefono:</label>
											<div class="col-sm-9">
												{{ Form::text('telefono','',array('class'=>'form-control','name'=>'telefono','placeholder'=>'')) }}
												{{ $errors->first('telefono','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>


										<div class="form-group">
											<label for="comentarios" class="col-sm-3 control-label">Comentarios:</label>
											<div class="col-sm-9">
												{{ Form::textarea('comentarios','',array('class'=>'form-control','name'=>'comentarios','placeholder'=>'')) }}
												{{ $errors->first('comentarios','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>

										<button type="submit" class="btn btn-warning">Actualizar Datos</button>	
								</form>
								<hr />
							
								
								
							</div>
					</div>
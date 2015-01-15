<div class="panel panel-smart">
							<div class="panel-heading">
								<h3 class="panel-title">
									Crear cuenta 
								</h3>
							</div>
							<div class="panel-body">
								

								<form class="form-horizontal" role="form" method="post" action="{{URL::route('postLoginCheckout')}}">
										<div class="form-group">
											<label for="email" class="col-sm-3 control-label">Email :</label>
											<div class="col-sm-9">
											
												{{ Form::email('email','',array('class'=>'form-control','name'=>'email','placeholder'=>'ejemplo@ejemplo.com')) }}
												{{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>

										<div class="form-group">
											<label for="password" class="col-sm-3 control-label">Contraseña :</label>
											<div class="col-sm-9">
												<input type="password" name="password" class="form-control" placeholder="******">
												{{ $errors->first('password','<p class="alert alert-danger">:message</p>') }}
											</div>
											
										</div>


										<div class="form-group">
											<label for="password" class="col-sm-3 control-label">Contraseña repite:</label>
											<div class="col-sm-9">
												<input type="password" name="password_confirmation" class="form-control" placeholder="******">
												{{ $errors->first('password_confirmation','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>

										<button type="submit" class="btn btn-warning">Registrarme</button> o <a href="" class="btn btn-info"data-toggle="modal" data-target="#ModalLogin">Inicia Sesión</a>	
								</form>
								<hr />
							
								
								<div class="text-uppercase clearfix" id="msg-ajax">
									
								</div>
							</div>
			</div>


			<!-- MODAL LOGIN    -->



			<!-- Modal -->
<div class="modal fade" id="ModalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Inicia Sesión</h4>
      </div>
      <div class="modal-body">
       	<form method="post" action="{{URL::route('postLogin')}}">
       		<div class="form-group">
											<label for="email" class=" control-label">Email :</label>
											<div class="">
											
												{{ Form::email('email','',array('class'=>'form-control','name'=>'email','placeholder'=>'ejemplo@ejemplo.com')) }}
												{{ $errors->first('email','<p class="alert alert-danger">:message</p>') }}
											</div>
										</div>

										<div class="form-group">
											<label for="password" class=" control-label">Contraseña :</label>
											<div class="">
												<input type="password" name="password" class="form-control" placeholder="******">
												{{ $errors->first('password','<p class="alert alert-danger">:message</p>') }}
											</div>
											
										</div>		
										
											
						
											
			
       	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
      </div>
      </form>
    </div>
  </div>
</div>
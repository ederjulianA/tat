 	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  {{ HTML::script('AdminJs/url-tienda.js')}}

  @if (Session::has('message-alert'))
                    <span class="label label-danger">Credenciales no válidas</span>

  @endif


  @if ($errors->any())
    <div class="alert alert-danger">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      <strong>Por favor corrige los siguentes errores:</strong>
      <ul>
      @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
      @endforeach
      </ul>
    </div>
  @endif

{{ Form::open(array('url' => 'register', 'method' => 'POST','novalidate'))}}
	<div class="info-empresa">
		<h2>Información de la empresa</h2>
		<div>
			{{ Form::label('name', 'Nombre de la empresa', array('class' => 'foo', 'id'=>'name'))}}
			{{ Form::text('name', '', array('id' => 'titulo'))}}
			
		</div>

		<div>
			{{ Form::label('email', 'Email', array('class' => 'foo'))}}
			{{ Form::email('email', '', array())}}
		</div>

		<div>
			{{ Form::label('password','Contraseña' , array())}}
			{{ Form::password('password', array('placeholder' => '******'))}}
		</div>

		<div>
			{{ Form::submit('Registrar!', array('class' => 'name'))}}
		</div>
		
	</div>

{{ Form::close()}}
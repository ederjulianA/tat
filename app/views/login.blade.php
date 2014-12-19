<h1>LOGIN</h1>

{{Form::open(array('url' => 'postLogin', 'method' => 'POST'))}}

	<div>
		{{ Form::label('email', 'Tu email de registro')}}
		{{ Form::email('email','',array())}}
	</div>

	<div>
		{{ Form::label('password', 'Tu contraseña')}}
		{{ Form::password('password')}}
	</div>
	<div>
		{{ Form::checkbox('remember');}}
	</div>
	<div>
		<input type="submit" value="login">
	</div>
{{ Form::close()}}
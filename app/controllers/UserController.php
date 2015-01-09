<?php

class UserController extends BaseController {


	public function postNewUser()
	{
		$validator = Validator::make(Input::all(),
				array(
						'email' 		    => 'required|email|unique:users',
						'password'		    => 'required|alpha_num|min:6|confirmed',
						
						'terminos'			=> 'accepted',
					

					)
			);


		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Errores en el formulario')->withErrors($validator->messages());
		}

		$user = new User;
		$user->email  		= Input::get('email');
		$user->password  	= Hash::make(Input::get('password'));
		$user->admin 		= 0;
		$user->condiciones 	= true;

		if($user->save())
		{
			return Redirect::to('/')->with('message-alert','Gracias Por registrarte');
		}
	}

	public function postUpdateData()
	{

				$datos = Shipping::where('user_id','=',Auth::user()->id)->first();
				if($datos)
				{
						$datos->nombre = Input::get('nombre');
				$datos->apellido = Input::get('apellido');
				$datos->barrio_id = Input::get('barrio_id');
				$datos->direccion = Input::get('direccion');
				$datos->telefono = Input::get('telefono');
				$datos->comentarios = Input::get('comentarios');
					if($datos->save())
					{
						return Redirect::back()->with('message-alert','Se han actualizado tus datos');
					}	
				dd('actualizado');
				}

				$ship = new Shipping;
				$ship->user_id = Auth::user()->id;
				$ship->nombre = Input::get('nombre');
				$ship->apellido = Input::get('apellido');
				$ship->barrio_id = Input::get('barrio_id');
				$ship->direccion = Input::get('direccion');
				$ship->telefono = Input::get('telefono');
				$ship->comentarios = Input::get('comentarios');
					if($ship->save())
					{
						return Redirect::back()->with('message-alert','Se han creado tus datos');
					}
		

		
	}

	public function postLoginCheckout()
	{
		$validator = Validator::make(Input::all(),
				array(
						'email' 		    => 'required|email|unique:users',
						'password'		    => 'required|alpha_num|min:6|confirmed',
						
					

					)
			);


		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Errores en el formulario')->withErrors($validator->messages());
		}

		$user = new User;
		$user->email  		= Input::get('email');
		$user->password  	= Hash::make(Input::get('password'));
		$user->admin 		= 0;
		$user->condiciones 	= true;

		if($user->save())
		{
						  $remember = (Input::has('remember')) ? true : false;
				//creamos la sesion del usuario
				$auth = Auth::attempt(array(
						'email'  => $user->email,
						'password' => Input::get('password'),
						'active' => 1
					), $remember);

				if($auth){
					if(Auth::user()->admin != 1)

						{
						return Redirect::back();

						}
						else {
							return Redirect::intended('admin');
						}
				}else{
					return Redirect::route('login')
				->with('message-alert', 'El email o la contraseña no coinciden, o la cuenta no esta activada');
				}
		}
	}


	
}
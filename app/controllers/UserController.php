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


	
}
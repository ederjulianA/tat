<?php

class HomeController extends BaseController {


	protected $producto;
	protected $cat;

	public function __construct(Producto $producto, Categoria $cat)
	{
		$this->producto = $producto;
		$this->cat = $cat;
	}


	public function getIndex()
	{
		$productos	= $this->producto->getSome();
		$categorias =   $this->cat->getAllCat();
		return View::make('index')->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());
	}

	public function getRegistger()
	{
		$categorias =   $this->cat->getAllCat();
		return View::make('register')->with('categorias',$categorias)->with('products', Cart::contents());
	}

	

	public function getLogin()
	{
		$categorias =   $this->cat->getAllCat();
		return View::make('login')->with('categorias',$categorias)->with('products', Cart::contents());
	}

	public function postLogin()
	{
		//GENERAMOS LAS REGLAS DE VALIDACIÓN PARA EL LOGIN
		$validator = Validator::make(Input::all(),array(

					'email' => 'required|email',
					'password' => 'required'
				)

			);
			//VERIFICAMOS QUE FALLE O NO LA VALIDACIÓN DE LAS REGLAS
			if($validator->fails()){

				//redirigimos al usuario al log in
				return Redirect::back()->withInput()->with('message-alert','Errores en el formulario')->withErrors($validator->messages());
			}else{
				
				
				  $remember = (Input::has('remember')) ? true : false;
				//creamos la sesion del usuario
				$auth = Auth::attempt(array(
						'email'  => Input::get('email'),
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

			return Redirect::route('login')
				->with('message-alert', 'Hubo un problema en el inicio de sesión ');
	}



	public function logout()
	{
		Auth::logout();
		Cart::destroy();
		return Redirect::to('/')->with('message-alert','Has Cerrado Sesión');
	}


	//FUNCIÓN PARA CREAR UNA NUEVA TIENDA
	public function postRegister()
	{
		//CREAMOS LAS REGLAS DE VALIDACIÓN PARA LA PETICÓN POST ENVIADA POR EL USUARIO
		$validator = Validator::make(Input::all(),
				array(
						'name' 		=> 'required|unique:empresas,nombre_publico',
						'email' 	=> 'required|email|unique:users,email',
						'password'	=> 'required|min:6'
					)
			);


		//VALIDAMOS SI LA PETICIÓN PASÓ LOS FILTROS DE VALIDACIÓN ANTERIORES
		if($validator->fails())
		{
			return Redirect::to('/register')
			->withErrors($validator)
			->withInput()
			->with('message-alert','Algo salio mal, porfavor verifica');
		}

		$user = new User;
		$user->email = Input::get('email');
		$user->password = Hash::make(Input::get('password'));
		$user->active = 1;

		$user->save();

		$empresa = new Empresa;
		$empresa->user_id = $user->id;
		$empresa->nombre_publico = Input::get('name');
		$empresa->logo = "img/empresas/logos/default.jpg";

		if($empresa->save())
		{
			return Redirect::to('/login')->with('message-alert','Has Creado tu empresa. Por favor inicia sesión.');
		}else{
			return Redirect::to('/register')->with('message-alert', 'Intentalo nuevamente');
		}


	}

}

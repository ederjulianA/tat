<?php

class HomeController extends BaseController {


	protected $producto;
	protected $cat;
	protected $grupo;
	protected $promo;
	public function __construct(Producto $producto, Categoria $cat, Grupo $grupo,Promo $promo)
	{
		$this->producto = $producto;
		$this->cat = $cat;
		$this->grupo = $grupo;
		$this->promo = $promo;
	}


	public function getPayUr()

	{
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		$products = Cart::contents();
		return View::make('PayRes.payu',compact('grupos','categorias','products'));
	}


	public function response(Request $request)
    {   
        $ApiKey = "6u39nqhq8ftd0hlvnjfs66eh8c";
        $merchant_id = $_REQUEST['merchantId'];
        $referenceCode = $_REQUEST['referenceCode'];
        $TX_VALUE = $_REQUEST['TX_VALUE'];
        $New_value = number_format($TX_VALUE, 1, '.', '');
        $currency = $_REQUEST['currency'];
        $transactionState = $_REQUEST['transactionState'];
        $firma_cadena = "$ApiKey~$merchant_id~$referenceCode~$New_value~$currency~$transactionState";
        $firmacreada = md5($firma_cadena);
        $firma = $_REQUEST['signature'];
        $reference_pol = $_REQUEST['reference_pol'];
        $cus = $_REQUEST['cus'];
        $extra1 = $_REQUEST['description'];
        $pseBank = $_REQUEST['pseBank'];
        $lapPaymentMethod = $_REQUEST['lapPaymentMethod'];
        $transactionId = $_REQUEST['transactionId'];
        return view('');
    }


	public function confirmation()
	{
		if (isset($_REQUEST['response_code_pol']) && isset($_REQUEST['value'])){
			$ApiKey = "6u39nqhq8ftd0hlvnjfs66eh8c";
        	

			$response_code_pol = $_REQUEST['response_code_pol'];
			$value = $_REQUEST['value'];
			$ip  = $_POST['ip'];
			$currency = $_POST['currency'];
			$sign = $_POST['sign'];
			$additional_value = $_POST['additional_value'];
			$state_pol = $_POST['state_pol'];
			$reference_sale = $_POST['reference_sale'];

		}else{
			
			$response_code_pol ="eder";
			$value = "jdjdjdjd93939e";
			$ip ="5858585858";
			$currency = "COOOP";
			$sign ="ksksksksksksksksksksksks";
			$additional_value = "29292929292";
			$state_pol = "statepol";
			$reference_sale = "ref sel";

		}

		//$user = new DatosPago;
		$nd   = new DatosPago;
		$nd->sign = $sign;
		$nd->new_sign = "kfkffjfjfjfjfjfk";
		$nd->response_code_pol = $response_code_pol;
		$nd->value = $value;
		$nd->additional_value = $additional_value;
		$nd->ApiKey = "jdnckndncd";
		$nd->merchant_id = "fkkfkfkf";
		$nd->reference_sale = $reference_sale;
		$nd->currency =$currency;
		$nd->state_pol = $state_pol;
		$nd->ip = $ip;
		if($nd->save())
		{
			dd("guardó");
		}else{
			dd("no se guardó");
		}
		

	}

	public function converter()
	{
		$amount = 1;
		$amount = urlencode($amount);
  		//$from_Currency = urlencode($from_Currency);
  		//$to_Currency = urlencode($to_Currency);
  		//$get = file_get_contents("https://www.google.com/finance/converter?a=$amount&from=$from_Currency&to=$to_Currency");
  		$get = file_get_contents("https://www.google.com/finance/converter?a=$amount&from=USD&to=COP&meta=ei%3DJQfLVvmZFJeSecb4loAH");
  		

  		$get = explode("<span class=bld>",$get);
  		$get = explode("</span>",$get[1]);  
  		$converted_amount = preg_replace("/[^0-9\.]/", null, $get[0]);
  		$converted_amount = (float)$converted_amount;
  		dd($converted_amount);
	}


	public function androidDetalle()
	{
		if(!isset($_REQUEST['idmantis']))
		{
			$idmantis = '000276';
			//$tipo  ="listaaaaaa";
		}else{
			$idmantis = $_REQUEST['idmantis'];
			//$tipo     = $_REQUEST['name'];


		}


			$productos = DB::table('productos as p')
							->select(
									'p.pro_nom',
									'p.precio',
									'p.img',
									'p.id_mantis')->where('p.id_mantis','=',$idmantis)->get();

							
			/*$ti = new Tipopago();
							$ti->TipPagNom = $tipo;
							$ti->save();*/

							return Response::json($productos);
	}


	public function android()
	{
		/*if (isset($_POST['data']) and isset($_POST['info']))
		{
			$dato = $_POST['data'];
			$info = $_POST['info'];
			echo $data."\n".$info;
		}else
		{
			echo"NOTHING TO SHOW";
		}*/

		if(!isset($_REQUEST['precio']))
		{
			$precio = 100000;
			$tipo  ="defectooooo";
			
		}else{
					$precio = $_REQUEST['precio'];
					$tipo     = $_REQUEST['name'];
					
		}
		$productos = DB::table('productos as p')
							->select(
									'p.pro_nom',
									'p.precio',
									'p.img',
									'p.id_mantis'
								)->orderBy(DB::raw('RAND()'))->where('p.precio','<=',$precio)->get();

							//dd($productos);

							$ti = new Tipopago();
							$ti->TipPagNom = $tipo;
							$ti->save();


							

							return Response::json($productos);
		
	}

	public function androidUsers()
	{
		/*$users = DB::table('users as u')->join('compra as c','u.id','=','c.user_id')->select('u.email','c.total_compra')->sum('c.total_compra');*/
		$users = User::leftJoin('compra', 'compra.user_id', '=', 'users.id')
   ->selectRaw('users.email, sum(compra.total_compra) as total_compra')
   ->orderBy('total_compra', 'desc')
   ->get();

   //dd($users);



		return Response::json($users);
	}


	public function getIndex()
	{
		
		
			
		/*$productos			= 	$this->producto->getSome();
		//$promo      		=   $this->promo->getPromo();
		$grupos 			=   $this->grupo->getAllGrupos();
		$categorias 		= 	$this->cat->getAllCat();
		return View::make('index')->with('grupos',$grupos)->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());*/

		$productos 	=	$this->producto->getSome();
		/*foreach($productos as $p){
			dd($p);
		}*/
		$promo      =   $this->promo->getPromo();
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias = $this->cat->getAllCat();
		return View::make('index')->with('grupos',$grupos)->with('categorias',$categorias)->with('promo',$promo)->with('productos',$productos)->with('products', Cart::contents());
	}

	public function getRegistger()
	{
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		return View::make('register')->with('grupos',$grupos)->with('categorias',$categorias)->with('products', Cart::contents());
	}

	

	public function getLogin()
	{
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		return View::make('login')->with('grupos',$grupos)->with('categorias',$categorias)->with('products', Cart::contents());
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

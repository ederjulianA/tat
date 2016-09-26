<?php

class HomeController extends BaseController {


	protected $producto;
	protected $cat;
	protected $grupo;
	protected $promo;

	protected $conn;
	protected $server;
	protected $db;
	protected $user;
	protected $pass;
	protected $urlMantis;
	public function __construct(Producto $producto, Categoria $cat, Grupo $grupo,Promo $promo, Conn $conn)
	{
		$this->producto = $producto;
		$this->cat = $cat;
		$this->grupo = $grupo;
		$this->promo = $promo;

		$this->conn         = $conn;
		$this->server       = $this->conn->getServer();
		$this->user         = $this->conn->getUser();
		$this->pass         = $this->conn->getPass();
		$this->db           = $this->conn->getDb();
		$this->urlMantis       = $this->conn->getUrlImg();
	}

	


	public function getPayUr()

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
		$extra1 = $_REQUEST['extra1'];
		$extra2 = $_REQUEST['extra2'];
		$pseBank = $_REQUEST['pseBank'];
		$lapPaymentMethod = $_REQUEST['lapPaymentMethod'];
		$transactionId = $_REQUEST['transactionId'];




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



     
if($_SERVER['REQUEST_METHOD']=='POST'){
    
    $state_pol = $_POST["state_pol"];
    $response_code_pol = $_POST["response_code_pol"];
    $risk = $_POST["risk"];
    $reference_sale = $_POST["reference_sale"];
    $payment_method_type = $_POST["payment_method_type"];
    $value = $_POST["value"];
    $currency = $_POST["currency"];
    $test = $_POST["test"];
    $ip = $_POST["ip"];
    $nickname_buyer = $_POST["nickname_buyer"];
    $description = $_POST["description"];
    $extra1      = $_POST["extra1"];
    $extra2      = $_POST["extra2"];
    $sign= $_POST["sign"];


    
    $content  = "Informacion de confirmacion".PHP_EOL;
    $content .= "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-".PHP_EOL;
    $content .= "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-".PHP_EOL;
    $content .= "Estado de la transaccion: ".$state_pol.PHP_EOL;
    $content .= "Codigo de respuesta de PayU: ".$response_code_pol.PHP_EOL;
    $content .= "Riesgo de la transaccion: ".$risk.PHP_EOL;
    $content .= "Referencia de la venta: ".$reference_sale.PHP_EOL;
    $content .= "Tipo de medio de pago: ".$payment_method_type.PHP_EOL;
    $content .= "Valor de la compra: ".$value.PHP_EOL;
    $content .= "Moneda de la transaccion: ".$currency.PHP_EOL;
    $content .= "IP del comprador: ".$ip.PHP_EOL;
    $content .= "Nombre corto del comprador: ".$nickname_buyer.PHP_EOL;
    $content .= "Descripcion de la compra: ".$description.PHP_EOL;
    $content .= "¿Estamos haciendo pruebas? ".$test.PHP_EOL;

    $nd   = new DatosPago;
		$nd->sign = $sign;
		$nd->user_id = $extra1;
		$nd->new_sign = "djsjdjdjdjdj";
		$nd->response_code_pol = $response_code_pol;
		$nd->value = $value;
		$nd->additional_value = "aditinal value";
		$nd->ApiKey = "jdnckndncd";
		$nd->merchant_id = "fkkfkfkf";
		$nd->reference_sale = "jajajaj";
		$nd->currency =$currency;
		$nd->state_pol = $state_pol;
		$nd->ip = $ip;
		if($np->save())
		{
			http_response_code(200);
		}
    
    /*$fp = fopen($_SERVER['DOCUMENT_ROOT'] . "/infoConfirmacion".$reference_sale.".txt","wb");
    fwrite($fp,$content);
    fclose($fp);*/
    
    
/*    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-disposition: attachment; filename=archivos.txt');
    header('Content-Length: '.strlen($content));
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    header('Expires: 0');
    header('Pragma: public');
    echo $content;
    exit;*/
}
    }


	public function confirmation()
	{
		if($_SERVER['REQUEST_METHOD']=='POST'){
    
    $state_pol = $_POST["state_pol"];
    $response_code_pol = $_POST["response_code_pol"];
    $risk = $_POST["risk"];
    $reference_sale = $_POST["reference_sale"];
    $payment_method_type = $_POST["payment_method_type"];
    $value = $_POST["value"];
    $currency = $_POST["currency"];
    $test = $_POST["test"];
    $ip = $_POST["ip"];
    $nickname_buyer = $_POST["nickname_buyer"];
    $description = $_POST["description"];
    $extra1      = $_POST["extra1"];

    $extra2      = $_POST["extra2"];
    
    $content  = "Informacion de confirmacion".PHP_EOL;
    $content .= "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-".PHP_EOL;
    $content .= "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-".PHP_EOL;
    $content .= "Estado de la transaccion: ".$state_pol.PHP_EOL;
    $content .= "Codigo de respuesta de PayU: ".$response_code_pol.PHP_EOL;
    $content .= "Riesgo de la transaccion: ".$risk.PHP_EOL;
    $content .= "Referencia de la venta: ".$reference_sale.PHP_EOL;
    $content .= "Tipo de medio de pago: ".$payment_method_type.PHP_EOL;
    $content .= "Valor de la compra: ".$value.PHP_EOL;
    $content .= "Moneda de la transaccion: ".$currency.PHP_EOL;
    $content .= "IP del comprador: ".$ip.PHP_EOL;
    $content .= "Nombre corto del comprador: ".$nickname_buyer.PHP_EOL;
    $content .= "Descripcion de la compra: ".$description.PHP_EOL;
    $content .= "¿Estamos haciendo pruebas? ".$test.PHP_EOL;


   
    
    $fp = fopen($_SERVER['DOCUMENT_ROOT'] . "/infoConfirmacion".$reference_sale.".txt","wb");
    fwrite($fp,$content);
    fclose($fp);
     
	
	$compra = new Compra;
					$compra->user_id 	= $extra1;
					$compra->totalCart  =   $value;
					$compra->total_compra  =  $value;
					$compra->num_items  =   $extra2;
					$compra->tipo_compra = 	2;
					$compra->vlr_envio   =  1000;
					$compra->save();

	 http_response_code(200);
				
					
	
                                      



    
    
/*    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-disposition: attachment; filename=archivos.txt');
    header('Content-Length: '.strlen($content));
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    header('Expires: 0');
    header('Pragma: public');
    echo $content;
    exit;*/
		
	}else{
		$citems = Cart::contents();
						foreach ($citems as $item) {
					$citem = new Ite;

					//$citem->compra_id 			=	$compra->id;

	   			 	$citem->id_producto			=	$item->id;
	   			 	$citem->nombre 				=	$item->name;
	   			 	$citem->valor_unitario 		=	$item->price;
	   			 	$citem->image               =   $item->image;
	   			 	$citem->iva 				=	$item->tax;
	   			 	$citem->cantidad 			= 	$item->quantity;
	   			 	$citem->valor_total			=	$item->total();
	   			 	var_dump($citem);

	}
}


}


	public function payucon2()
	{
		Cart::destroy();
	}

	public function guardar()
	{
		$compra = new Compra;
					$compra->user_id 	=	Auth::user()->id;
					$compra->totalCart  =   $data['totalCart'];
					$compra->total_compra  =  $data['total_compra'];
					$compra->num_items  =   $data['totalItems'];
					$compra->tipo_compra = 	$data['tipo_compra'];
					$compra->vlr_envio   =  $data['vlr_envio_a'];
			if($compra->save())
			{
				foreach (Cart::contents() as $item) {
					$citem = new Ite;
					$citem->compra_id 			=	$compra->id;

	   			 	$citem->id_producto			=	$item->id;
	   			 	$citem->nombre 				=	$item->name;
	   			 	$citem->valor_unitario 		=	$item->price;
	   			 	$citem->image               =   $item->image;
	   			 	$citem->iva 				=	$item->tax;
	   			 	$citem->cantidad 			= 	$item->quantity;
	   			 	$citem->valor_total			=	$item->total();

	   			 	$citem->save();

				}
				
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
  		 return round($converted_amount,2);
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
		$menu       = Menu::all();
		$bans       = Banner::where('activo','=',1)->orderBy('pos','asc')->get();

		
		return View::make('cotra.index',compact('bans'))->with('grupos',$grupos)->with('menu',$menu)->with('categorias',$categorias)->with('promo',$promo)->with('productos',$productos)->with('products', Cart::contents());
	}

	public function getRegistger()
	{
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		$menu       = Menu::all();
		return View::make('cotra.login')->with('grupos',$grupos)->with('categorias',$categorias)->with('products', Cart::contents());
	}

	

	public function getLogin()
	{
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		$menu    = Menu::all();
		return View::make('cotra.login')->with('menu',$menu)->with('grupos',$grupos)->with('categorias',$categorias)->with('products', Cart::contents());
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
					return Redirect::back()
				->with('message-alert', 'El email o la contraseña no coinciden, o la cuenta no esta activada');
				}


			}

			return Redirect::back()
				->with('message-alert', 'Hubo un problema en el inicio de sesión ');
	}



	public function logout()
	{
		Auth::logout();
		Cart::destroy();
		return Redirect::to('/')->with('message-alert','Has Cerrado Sesión');
	}


	//FUNCIÓN PARA CREAR UNA NUEVA TIENDA
	/*public function postRegister()
	{
		
		$validator = Validator::make(Input::all(),
				array(
						'name' 		=> 'required|unique:empresas,nombre_publico',
						'email' 	=> 'required|email|unique:users,email',
						'password'	=> 'required|min:6'
					)
			);


		
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


	}*/

}

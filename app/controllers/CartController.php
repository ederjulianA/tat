<?php

use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\ExecutePayment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Transaction;


class CartController extends BaseController {



	protected $producto;
	protected $cat;
	protected $barrio;
	protected $grupo;
	 private $_api_context;
	protected $envios;

	protected $conn;
	protected $server;
	protected $db;
	protected $user;
	protected $pass;
	protected $urlMantis;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio,Grupo $grupo, Envio $envios, Conn $conn)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->grupo 		= $grupo;
		$this->envios   	= $envios;

		$this->conn         = $conn;
		$this->server       = $this->conn->getServer();
		$this->user         = $this->conn->getUser();
		$this->pass         = $this->conn->getPass();
		$this->db           = $this->conn->getDb();
		$this->urlMantis       = $this->conn->getUrlImg();


		// setup PayPal api context
        $paypal_conf = Config::get('paypal');
        $this->_api_context = new ApiContext(new OAuthTokenCredential($paypal_conf['client_id'], $paypal_conf['secret']));
        $this->_api_context->setConfig($paypal_conf['settings']);
	}
	public function getLoadPayment()
	{
		$envi  = $this->envios->getEnvios();

		return View::make('load.paypal',compact('envi'));
	}

	public function getLoadPaymentU()
	{
		$envi  = $this->envios->getEnvios();

		return View::make('load.payu',compact('envi'));
	}

	public function getCart()
	{
		$categorias =   $this->cat->getAllCat();
		$grupos 		=   $this->grupo->getAllGrupos();

		$menu       = Menu::all();
		return View::make('cotra.carrito')->with('menu',$menu)->with('grupos',$grupos)->with('categorias',$categorias)->with('products', Cart::contents());
	}

	public function getCheckout()
	{
		if(!Cart::contents())
		{
			return Redirect::to('/cart')->with('message-alert','No hay Items en tu pedido');
		}
		$categorias =   $this->cat->getAllCat();
		$barrios 	=	$this->barrio->getAllBarrios();
		$ciudades 	= 	$this->barrio->getAllCities();
		$canales    =  	$this->barrio->getAllCanales();
		$grupos 	=   $this->grupo->getAllGrupos();
		$pagos   	= 	Mpagos::all();
		$envi       = $this->envios->getEnvios();
		$datos = NULL;
		$menu = Menu::all();
			
		if(Auth::check())
		{
			$user = User::where('id','=',Auth::user()->id)->first();
			$dat = Shipping::where('user_id','=',Auth::user()->id)->first();
			

			$datos = DB::table('user_datos as ud')->join('barrios as b','ud.barrio_id','=','b.id')
												  ->join('canales as c' ,'ud.canal','=', 'c.id')
												  ->join('ciudades as ci','ud.ciudad','=','ci.id')
					->select(
					'ud.barrio_id',
					'b.bar_nom AS barrioNombre',
					'ci.ciu_nom',
					'c.can_nom',
					'ud.direccion',
					'ud.nombre',
					'ud.apellido',
					'ud.cedula',
					'ud.nombre_negocio',
					'ud.ciudad',
					'ud.canal',
					'ud.telefono',
					'ud.comentarios'
				)->where('ud.user_id','=',Auth::user()->id)->first();
					
			return View::make('cotra.checkout')->with('envi',$envi)->with('menu',$menu)->with('pagos',$pagos)->with('grupos',$grupos)->with('barrios',$barrios)->with('canales',$canales)->with('ciudades',$ciudades)->with('datos',$datos)->with('categorias',$categorias)->with('products', Cart::contents());
		}
		

		return View::make('cotra.checkout')->with('envi',$envi)->with('menu',$menu)->with('pagos',$pagos)->with('grupos',$grupos)->with('datos',$datos)->with('barrios',$barrios)->with('categorias',$categorias)->with('products', Cart::contents());
		
	}

	public function postPedido()
	{

		$compra = new Compra;
		$compra->user_id 	=	Auth::user()->id;
		$compra->totalCart  =   Input::get('totalCart');
		$compra->total_compra  =   Input::get('total_compra');
		$compra->num_items  =   Input::get('totalItems');
		$compra->tipo_compra = 	Input::get('tipo_compra');
		$compra->vlr_envio   =  Input::get('vlr_envio_a');
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
				Cart::destroy();

				return Redirect::to('/micuenta')->with('message-alert','Se ha hecho la solicitud de tu pedido exitosamente');
				

			}

		dd($compra);

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



	public function addToCart()
	{
		$validator = Validator::make(Input::all(),
				array(
						'cantidad' => 'required|integer',
						'id_producto' => 'required|integer'
					)
			);

		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Ingresa Valores Validos')->withErrors($validator->messages());
		}

		$producto = Producto::where('id','=',Input::get('id_producto'))->first();
		if($producto->count())
		{
			 if($producto->cantidad > 0 && Input::get('cantidad') <= $producto->cantidad)
			 {
			 			 Cart::insert(array(
				'id'=>$producto->id,
				'name' => $producto->pro_nom,
				'price' => $producto->precio,
				'quantity' => Input::get('cantidad'),
				'tax'	=>$producto->por_iva,
				'conIva'=> $producto->precio + (($producto->precio * $producto->por_iva)/100),
				'ArtSec'=> $producto->ArtSec,
				'image' => $producto->img
			));
			 			 return Redirect::back()->with('message-alert','Se ha agregado el producto a tu pedido');
			 }
			 else
			 {
			 	return Redirect::back()->with('message-alert','La cantidad Solicitada no esta disponible');
			 }
		}
	}

	public function updateItem()
	{
		$identifier = Input::get('identifier');
		$validator = Validator::make(Input::all(),
				array(
						'cantidad' => 'required|integer',
						'id_producto' => 'required|integer',
						'identifier'	=>	'required'
					)
			);

		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Ingresa Valores Validos')->withErrors($validator->messages());
		}

		$producto = Producto::where('id','=',Input::get('id_producto'))->first();
		if($producto->count())
		{
			 if($producto->cantidad > 0 && Input::get('cantidad') <= $producto->cantidad && Input::get('cantidad') > 0)
			 {
			 			$item = Cart::item($identifier);
			 			$nuevaCantidad = Input::get('cantidad');
			 			$item->quantity = $nuevaCantidad;
			 			 return Redirect::back()->with('message-alert','Se ha actualizado el producto');
			 }
			 else
			 {
			 	return Redirect::back()->with('message-alert','La cantidad Solicitada no esta disponible');
			 }
		}
	}

	public function getRemoveitem($identifier)
	{
		$item = Cart::item($identifier);
		$item->remove();
		return Redirect::back()->with('message-alert','Se ha eliminado el producto de tu pedido');
	}







	


	


public function pedMantis()
{


}
//181.225.65.155---erpweb1108 ---sa---Colombia$2015

}
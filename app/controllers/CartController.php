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

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio,Grupo $grupo, Envio $envios)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->grupo 		= $grupo;
		$this->envios   	= $envios;


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
		return View::make('cart')->with('grupos',$grupos)->with('categorias',$categorias)->with('products', Cart::contents());
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
		$datos = NULL;
			
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
					
			return View::make('checkout')->with('pagos',$pagos)->with('grupos',$grupos)->with('barrios',$barrios)->with('canales',$canales)->with('ciudades',$ciudades)->with('datos',$datos)->with('categorias',$categorias)->with('products', Cart::contents());
		}
		

		return View::make('checkout')->with('pagos',$pagos)->with('grupos',$grupos)->with('datos',$datos)->with('barrios',$barrios)->with('categorias',$categorias)->with('products', Cart::contents());
		
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




	public function postPayment()
{
	$data = Input::all();
	Session::put('data', $data);
	
    

    $payer = new Payer();
    $payer->setPaymentMethod('paypal');
    //$totItems =  array();

    $dollar = 2896.19	;
    $x = 0;
    foreach (Cart::contents() as $i) {
    	
    	$precio = (($i->price*(1+($i->tax/100))) /$dollar);

    	$pre = round($precio,2);
    	//dd($pre);
    	//$x = $x+$pre;
    	$val = (Int)trim($i->quantity);
    	
    	$x  += ($val*$pre);

    	$item = new Item();
    	 $item->setName($i->name) // item name
        ->setCurrency('USD')
        //->setQuantity($val)
        ->setQuantity($val)
        ->setPrice($pre); // unit price

       
        
        $totItems[] = $item;
    }
    
    //dd($totItems);
    

    

    // add item to list
    
   
    //dd($item_list);

     /* $item_1 = new Item();
    $item_1->setName('Item 1') // item name
        ->setCurrency('USD')
        ->setQuantity(2)
        ->setPrice('15'); // unit price
        dd($item_1);
    $item_2 = new Item();
    $item_2->setName('Item 2')
        ->setCurrency('USD')
        ->setQuantity(4)
        ->setPrice('7');

    $item_3 = new Item();
    $item_3->setName('Item 3')
        ->setCurrency('USD')
        ->setQuantity(1)
        ->setPrice('20');

    // add item to list
    $item_list = new ItemList();
    $item_list->setItems(array($item_1, $item_2, $item_3));*/
    //dd($item_list);
    $item_list = new ItemList();
    $item_list->setItems($totItems);
    $totCart = Cart::total();
    $totDol  = ($x);
   


    $t = round($totDol,2);
    //dd($t);
   // dd('totItems: '.$x.'totCart: '.$t);
    $amount = new Amount();
    $amount->setCurrency('USD')
        ->setTotal($x);
        
    $transaction = new Transaction();
    $transaction->setAmount($amount)
        ->setItemList($item_list)
        ->setDescription('Your transaction description');

    $redirect_urls = new RedirectUrls();
    $redirect_urls->setReturnUrl(URL::route('payment.status'))
        ->setCancelUrl(URL::route('payment.status'));

    $payment = new Payment();
    $payment->setIntent('Sale')
        ->setPayer($payer)
        ->setRedirectUrls($redirect_urls)
        ->setTransactions(array($transaction));

    try {
        $payment->create($this->_api_context);
    } catch (\PayPal\Exception\PPConnectionException $ex) {
        if (\Config::get('app.debug')) {
            echo "Exception: " . $ex->getMessage() . PHP_EOL;
            $err_data = json_decode($ex->getData(), true);
            exit;
        } else {
            die('Some error occur, sorry for inconvenient');
        }
    }

    foreach($payment->getLinks() as $link) {
        if($link->getRel() == 'approval_url') {
            $redirect_url = $link->getHref();
            break;
        }
    }

    // add payment ID to session
    Session::put('paypal_payment_id', $payment->getId());

    if(isset($redirect_url)) {
        // redirect to paypal
        return Redirect::away($redirect_url);
    }

    return Redirect::route('cart')
        ->with('message-alert', 'Unknown error occurred');
}



	


	public function getPaymentStatus()
{
    // Get the payment ID before session clear
    $payment_id = Session::get('paypal_payment_id');
    $data       = Session::get('data');
    //dd($data['totalCart']);

    // clear the session payment ID
    Session::forget('paypal_payment_id');

    if (empty(Input::get('PayerID')) || empty(Input::get('token'))) {
        return Redirect::route('cart')
            ->with('error', 'Payment failed');
    }

    $payment = Payment::get($payment_id, $this->_api_context);

    // PaymentExecution object includes information necessary 
    // to execute a PayPal account payment. 
    // The payer_id is added to the request query parameters
    // when the user is redirected from paypal back to your site
    $execution = new PaymentExecution();
    $execution->setPayerId(Input::get('PayerID'));

    //Execute the payment
    $result = $payment->execute($execution, $this->_api_context);

    //echo '<pre>';print_r($result);echo '</pre>';exit; // DEBUG RESULT, remove it later

    if ($result->getState() == 'approved') { // payment made
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
				Cart::destroy();
				Session::forget('data');

				
				return Redirect::route('micuenta')
            ->with('message-alert', 'Payment success');

			}

        
    }
    return Redirect::route('cart')
        ->with('message-alert', 'Payment failed');
}


}
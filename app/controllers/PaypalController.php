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


class PaypalController extends BaseController {



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

public function postPaymentAgain2()
{
    dd("HOLA");
}

public function postPaymentAgain()
{
    $data = Input::all();
    Session::put('data', $data);
    
   $dollar = App::make('HomeController')->converter();

    
    //$dollar = 3300    ;
    $x = 0;
    $valorEnvio = Input::get('vlr_envio_a');
    $nVlrEnvvio  = round(($valorEnvio/$dollar),2);
    //dd($nVlrEnvvio);

    $payer = new Payer();
    $payer->setPaymentMethod('paypal');
    //$totItems =  array();

    $compra = Compra::where('id','=',Input::get('id'))->first();
    $items = Ite::where('compra_id','=',Input::get('id'))->get();
  
    
    foreach ($items as $i) {
        
        $precio = (($i->valor_unitario*(1+($i->iva/100))) /$dollar);

        $pre = round($precio,2);
        //dd($pre);
        //$x = $x+$pre;
        $val = (Int)trim($i->cantidad);
        
        $x  += ($val*$pre);

        $item = new Item();
         $item->setName($i->nombre) // item name
        ->setCurrency('USD')
        //->setQuantity($val)
        ->setQuantity($val)
        ->setPrice($pre); // unit price

      // dd($item);
        
        $totItems[] = $item;
    }

    $item1 = new Item();
    $item1->setName('Envio') // item name
        ->setCurrency('USD')
        ->setQuantity(1)
        ->setPrice($nVlrEnvvio);

        $totItems[] = $item1;
        

        $x = round(($x+$nVlrEnvvio),2);
 
    

    

    $item_list = new ItemList();
    //$item_list->setItems($totItems);
    $item_list->setItems($totItems);
    //dd($item_list);
    $totCart = $compra->total_compra;
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
        ->setDescription('Compra en TAT Shop');

    $redirect_urls = new RedirectUrls();
    $redirect_urls->setReturnUrl(URL::route('payment.statusAgain'))
        ->setCancelUrl(URL::route('payment.statusAgain'));

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




	public function postPayment()
{
	$data = Input::all();
	Session::put('data', $data);
   $dollar = App::make('HomeController')->converter();

	
	//$dollar = 3300	;
    $x = 0;
    $valorEnvio = Input::get('vlr_envio_a');
    $nVlrEnvvio  = round(($valorEnvio/$dollar),2);
    //dd($nVlrEnvvio);

    $payer = new Payer();
    $payer->setPaymentMethod('paypal');
    //$totItems =  array();

    
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

      // dd($item);
        
        $totItems[] = $item;
    }

    $item1 = new Item();
    $item1->setName('Envio') // item name
        ->setCurrency('USD')
        ->setQuantity(1)
        ->setPrice($nVlrEnvvio);

        $totItems[] = $item1;
        

        $x = round(($x+$nVlrEnvvio),2);
        //dd($x);
    
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
    //$item_list->setItems($totItems);
    $item_list->setItems($totItems);
    //dd($item_list);
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
        ->setDescription('Compra en TAT Shop');

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



	
   
 public function getPaymentStatusAgain()
    {
         // Get the payment ID before session clear
    $payment_id = Session::get('paypal_payment_id');
    $data       = Session::get('data');
    //dd($data['totalCart']);

    // clear the session payment ID
    Session::forget('paypal_payment_id');
    $payerID  = trim(Input::get('PayerID'));
    $token    = trim(Input::get('token'));

    if (empty($payerID) || empty($token)) {
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



            $NitIde = urlencode(Auth::user()->NitSec);
            $id_pedido = urlencode('PED-WEB-'.date('Ymd-Hms'));
                                                //dd($id_pedido,$SecNum,$NitSec);
            $totalCompra =  urlencode($data['totalCart']);
            $CotFecEd = urlencode(date("d-m-y"));
            //dd($NitIde);


            /*$cont = file_get_contents("http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/setPrueba2.php?NitIde=$NitIde&id_pedido=$id_pedido&totalCompra=$totalCompra&CotFecEd=$CotFecEd");*/
            $cont = file_get_contents("http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/setPrueba2.php?NitIde=$NitIde&id_pedido=$id_pedido&totalCompra=$totalCompra&CotFecEd=$CotFecEd");
            
            if($cont == true)
            {
                $compra = Compra::where('id','=',$data['id'])->first();
                $items = Ite::where('compra_id','=',$data['id'])->get();

                $num = 1;
                foreach ($items as $item) {   
                                                                            
                  $artsec = urlencode($item->ArtSec);

                  $price  = urlencode($item->valor_unitario);
                  $CotArtNom = urlencode($item->nombre);
                  $uni    = urlencode($item->cantidad);
                  $CotSubPrecio = urlencode($item->valor_total);  
                  $SecNum      = trim($cont);
                  $SecNum2 = str_replace('"', '', $SecNum);
                  $SecNum2 = urlencode($SecNum2);

                  /*$cont2 = file_get_contents("http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/setPruebaDetalle.php?artsec=$artsec&price=$price&CotArtNom=$CotArtNom&uni=$uni&CotSubPrecio=$CotSubPrecio&num=$num&SecNum=$SecNum2&NitIde=$NitIde"); */
                  $cont2 = file_get_contents("http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/setPruebaDetalle.php?artsec=$artsec&price=$price&CotArtNom=$CotArtNom&uni=$uni&CotSubPrecio=$CotSubPrecio&num=$num&SecNum=$SecNum2&NitIde=$NitIde"); 
                  $num++;

                  
                
                }


             //GUARDAR EN BASE DE DATOS TIENDO.

                $compra->estado_id =2;
                $compra->save();
                $items = Ite::where('compra_id','=',$compra->id)->get();
                        $user = User::where('id','=',Auth::user()->id)->first();
                        $email = $user->email;
                        $datos = Shipping::where('user_id','=',$user->id)->first();
                        $destinatario = $datos->nombre." ".$datos->apellido;
                        Mail::send('emails.compras.c1', array('compra'=>$compra, 'items'=>$items,'email'=>$email,'destinatario'=>$destinatario), function($message) use ($compra,$items,$destinatario,$email){
                        $message->to($email, $destinatario)->subject('Compra en Cootracolta');
                    });
                        Cart::destroy();
                        Session::forget('data');

                         return Redirect::route('micuenta')
                    ->with('message-alert', 'Compra finalizada');
             
                     dd("done");

            }
            else{
                dd("not done");
            }

        
    }//SI EL PAGO FUE APROVADO POR PAYPAL
    return Redirect::route('cart')
        ->with('message-alert', 'Error en el pago');
    }

//##################################################################PAYAGAIN

    public function getPaymentStatus()
{
    // Get the payment ID before session clear
    $payment_id = Session::get('paypal_payment_id');
    $data       = Session::get('data');
    //dd($data['totalCart']);

    // clear the session payment ID
    Session::forget('paypal_payment_id');
    $payerID  = trim(Input::get('PayerID'));
    $token    = trim(Input::get('token'));

    if (empty($payerID) || empty($token)) {
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



            $NitIde = urlencode(Auth::user()->NitSec);
            $id_pedido = urlencode('PED-WEB-'.date('Ymd-Hms'));
                                                //dd($id_pedido,$SecNum,$NitSec);
            $totalCompra =  urlencode($data['totalCart']);
            $CotFecEd = urlencode(date("d-m-y"));
            //dd($NitIde);


            /*$cont = file_get_contents("http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/setPrueba2.php?NitIde=$NitIde&id_pedido=$id_pedido&totalCompra=$totalCompra&CotFecEd=$CotFecEd");*/
            $cont = file_get_contents("http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/setPrueba2.php?NitIde=$NitIde&id_pedido=$id_pedido&totalCompra=$totalCompra&CotFecEd=$CotFecEd");

            
            if($cont == true)
            {

                $num = 1;
                foreach (Cart::contents() as $item) {   
                                                                            
                  $artsec = urlencode($item->ArtSec);

                  $price  = urlencode($item->price);
                  $CotArtNom = urlencode($item->name);
                  $uni    = urlencode($item->quantity);
                  $CotSubPrecio = urlencode(Cart::total(false));  
                  $SecNum      = trim($cont);
                  $SecNum2 = str_replace('"', '', $SecNum);
                  $SecNum2 = urlencode($SecNum2);

                 /* $cont2 = file_get_contents("http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/setPruebaDetalle.php?artsec=$artsec&price=$price&CotArtNom=$CotArtNom&uni=$uni&CotSubPrecio=$CotSubPrecio&num=$num&SecNum=$SecNum2&NitIde=$NitIde"); */
                 $cont2 = file_get_contents("http://192.168.0.241:8086/WEBSOMIC/EDER/TV8/setPruebaDetalle.php?artsec=$artsec&price=$price&CotArtNom=$CotArtNom&uni=$uni&CotSubPrecio=$CotSubPrecio&num=$num&SecNum=$SecNum2&NitIde=$NitIde");
                  $num++;

                  
                
                }


             //GUARDAR EN BASE DE DATOS TIENDO.


                $compra = new Compra;
                $compra->user_id    =   Auth::user()->id;
                $compra->totalCart  =   $data['totalCart'];
                $compra->total_compra  =  $data['total_compra'];
                $compra->num_items  =   $data['totalItems'];
                $compra->tipo_compra =  $data['tipo_compra'];
                $compra->vlr_envio   =  $data['vlr_envio_a'];
                $compra->tipo_compra = 2;
                $compra->estado_id   = 2;

                    if($compra->save())
                    {
                        foreach (Cart::contents() as $item) {
                            $citem = new Ite;
                            $citem->compra_id           =   $compra->id;

                            $citem->id_producto         =   $item->id;
                            $citem->nombre              =   $item->name;
                            $citem->valor_unitario      =   $item->price;
                            $citem->image               =   $item->image;
                            $citem->iva                 =   $item->tax;
                            $citem->valIva              =   $item->valIva;
                            $citem->cantidad            =   $item->quantity;
                            $citem->valor_total         =   $item->total();

                            $citem->save();

                        }
                        $items = Ite::where('compra_id','=',$compra->id)->get();
                          $user = User::where('id','=',Auth::user()->id)->first();
                        $email = $user->email;
                        $datos = Shipping::where('user_id','=',$user->id)->first();
                        $destinatario = $datos->nombre." ".$datos->apellido;
                        Mail::send('emails.compras.c1', array('compra'=>$compra, 'items'=>$items,'email'=>$email,'destinatario'=>$destinatario), function($message) use ($compra,$items,$destinatario,$email){
                        $message->to($email, $destinatario)->subject('Compra en Cootracolta');
                    });
                        Cart::destroy();
                        Session::forget('data');
                        

                         
                        //Mail::send('emails.auth.compra', array('compra'=>$compra, 'items'=>$items, /*URL::route('mega-perfil')*/), function($message) use ($compra,$items){
                           //     $message->to(Auth::user()->email, 'Comprador')->subject('Compra cootracolta');
                            //});
                        return Redirect::route('micuenta')
                    ->with('message-alert', 'Compra finalizada');

                    }
                     dd("done");

            }
            else{
                dd("not done");
            }

        
    }//SI EL PAGO FUE APROVADO POR PAYPAL
    return Redirect::route('cart')
        ->with('message-alert', 'Error en el pago');
}





public function paymentNoMantis()
{
	// Get the payment ID before session clear
    $payment_id = Session::get('paypal_payment_id');
    $data       = Session::get('data');
    //dd($data['totalCart']);

    // clear the session payment ID
    Session::forget('paypal_payment_id');
    $payerID  = trim(Input::get('PayerID'));
    $token    = trim(Input::get('token'));

    if (empty($payerID) || empty($token)) {
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




    	


    	/*---------------------------------------------------*/


    	$compra = new Compra;
		$compra->user_id 	=	Auth::user()->id;
		$compra->totalCart  =   $data['totalCart'];
		$compra->total_compra  =  $data['total_compra'];
		$compra->num_items  =   $data['totalItems'];
		$compra->tipo_compra = 	$data['tipo_compra'];
		$compra->vlr_envio   =  $data['vlr_envio_a'];
        $compra->tipo_compra = 2;
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
                    $citem->valIva              =   $item->valIva;
	   			 	$citem->cantidad 			= 	$item->quantity;
	   			 	$citem->valor_total			=	$item->total();

	   			 	$citem->save();

				}
                  $items = Cart::contents();
                        $user = User::where('id','=',Auth::user()->id)->first();
                        $email = $user->email;
                        $datos = Shipping::where('user_id','=',$user->id)->first();
                        $destinatario = $datos->nombre." ".$datos->apellido;
                        Mail::send('emails.compras.c1', array('compra'=>$compra, 'items'=>$items,'email'=>$email,'destinatario'=>$destinatario), function($message) use ($compra,$items,$destinatario,$email){
                        $message->to($email, $destinatario)->subject('Compra en contracolta');
                    });
				Cart::destroy();
				Session::forget('data');

				
				return Redirect::route('micuenta')
            ->with('message-alert', 'Payment success');

			}

        
    }//SI EL PAGO FUE APROVADO POR PAYPAL
    return Redirect::route('cart')
        ->with('message-alert', 'Payment failed');
}


public function pedMantis()
{


}


}
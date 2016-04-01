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








	public function postPayment()
{
	$data = Input::all();
	Session::put('data', $data);
	
	$dollar = 3300	;
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




    	if ($conn_access = odbc_connect ( "Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
			 $ssql = "select * from Secuencia where SecCod='PEDIDO'"; 
			if($rs_access = odbc_exec ($conn_access, $ssql)){ 
						while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$SecNum = $info['SecNum'];
					   			
								}// END WHILE############################
									$NitIde = Auth::user()->NitSec;
									$ssql2 = "select n.NitIde,n.NitSec, c.Vencod From Nit n
inner join ClientesVendedores c on c.NitSec = n.NitSec
where n.NitIde = '$NitIde'";
									if($rs_access = odbc_exec($conn_access, $ssql2)){ 
												while ($info2 = odbc_fetch_array($rs_access)) {
					 		  
					   							$NitSec = $info2['NitSec'];
					   							$Vencod = $info2['Vencod'];
					   			
												}// END WHILE############################
												$id_pedido = 'PED-WEB-'.date('Ymd-Hms');
												//dd($id_pedido,$SecNum,$NitSec);
												$totalCompra =  $data['totalCart'];
                                                $CotFecEd = date("d-m-y");
												
												$ssql3 ="INSERT INTO Cotizaciones1(CotTip,CotSec,TipCod,EmpCod,CotFecha,CotObs,CotUsuCod,CotCliConPag,CotSecConCon,CotLisPreCod,CotSubVenCod,CotSubNitSec,CotSubCliSec,CotNum,CotSumCot,BodSucCCSec,CotEst,CotSubCotSec,AnuFueSec,CotAnuObs,CotEstado)
                   								 VALUES('P','$SecNum','PED',1,'$CotFecEd','miobs','admin',1/*cliConPag*/,1/*numItems*/,1/*lisprecod*/,$Vencod/*vencod*/,'$NitSec'/*nitsec*/,1/*clisec*/,'$id_pedido','$totalCompra',1/*BODsUCCSEC*/,2/*CotEst*/,NULL,NULL,NULL,'A')";

                   								 if($rs_access = odbc_exec($conn_access, $ssql3)){ 
                   								 		$ssql4 = "UPDATE Secuencia SET SecNum=SecNum+1 where SecCod='PEDIDO'";
                   								 		if($rs_access = odbc_exec($conn_access, $ssql4)){
$num = 1;
foreach (Cart::contents() as $item) {   
					               								 			
                  $artSec = $item->ArtSec;
                  $price  = $item->price;
                  $CotArtNom = $item->name;
                  $uni    = $item->quantity ;
                  $CotSubPrecio = Cart::total(false);								 			
  $ssql5 = "insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec
,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,
CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,
CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva,CotSubPrecio)
values('P','$SecNum',$num,'N',$artSec/*ArtSec*/,1 /*ArtEmb*/,'S/L','1999-01-01 00:00:00.000',0.000000,$uni/*CotArtUni*/,0.00,0.00,0.00,0.00,0.00000,
(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec='$artSec'),
'$price'/*CotArtPrecio*/,0.00000,0.00000,0.00000,0.00000,0.00000,isnull((select lisprecod from clientes where nitsec='$NitSec' and clisec=1),0)
,(select top 1 PreArtCod from ArtPre where artsec=$artSec),1/*Bodega*/,0,0,'A',0,0.00000,1.00000,'$CotArtNom',0.00000
,(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artSec),'$CotSubPrecio')
";
															if($rs_access = odbc_exec($conn_access, $ssql5)){

																$num = $num +1;
															}


														}//end for each Cart
                   								 	}

                   								 }//END SSQL3
									}//end if ssql2


					 
			}//END IF SSQL############################
		}// END IF SQL CONN


    	/*---------------------------------------------------*/


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

        
    }//SI EL PAGO FUE APROVADO POR PAYPAL
    return Redirect::route('cart')
        ->with('message-alert', 'Payment failed');
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

        
    }//SI EL PAGO FUE APROVADO POR PAYPAL
    return Redirect::route('cart')
        ->with('message-alert', 'Payment failed');
}


public function pedMantis()
{


}


}
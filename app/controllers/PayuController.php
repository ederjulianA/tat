<?php
	class PayuController extends BaseController {


				public function conf()
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
				     
	
					/*$compra = new Compra;
					$compra->user_id 	= $extra1;
					$compra->totalCart  =   $value;
					$compra->total_compra  =  $value;
					$compra->num_items  =   $extra2;
					$compra->tipo_compra = 	2;
					$compra->vlr_envio   =  1000;
					$compra->save();*/

	 				http_response_code(200);
				
					
	
         
		
			}

	}
?>
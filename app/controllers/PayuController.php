<?php
	class PayuController extends BaseController {

		public function payu4()
		{
				$host = "localhost";
				$user = "root";
				$bd = "tat";
				$pass = "eder4EVER";
				$port = 3306;
				$n = "7be671283be0a61794db311183716f38";
				
				$conexion = mysqli_connect($host, $user, $pass, $bd, $port);
				$sql = "UPDATE compra SET pay_status = 2 WHERE llave = '$n'";
				$result = mysqli_query($conexion, $sql);
		}

		public function conFac()
		{
			$ApiKey = "4Vj8eK4rloUd272L48hsrarnUA";
        	
			
			$response_code_pol 			= $_REQUEST['response_code_pol'];
			$value 						= $_REQUEST['value'];
			$ip  						= $_POST['ip'];
			$currency 					= $_POST['currency'];
			$sign 						= $_POST['sign'];
			$additional_value 			= $_POST['additional_value'];
			$state_pol 					= $_POST['state_pol'];
			$reference_sale 			= $_POST['reference_sale'];
			$New_value 	 				= number_format($value, 1, '.', '');
			$firma_cadena 				= "$ApiKey~508029~$reference_sale~$New_value~$currency~$state_pol";
        	$firmacreada 				= md5($firma_cadena);
        	//$email 						= "ederalvarez2091057@gmail.com";
			$empresa		 			= "Megalopolis Inc.";
			$asesor 					="ederAAAA";
			$aliado 					="Eder A";
			$email                      = $_REQUEST['email_buyer'];
			$valor 						= 10000;
			$user_id                    = $_REQUEST['extra1'];

			if ($state_pol == 4)
			{
				$compra = Compra::where('llave','=',$reference_sale)->first();
				$compra->estado_id = 2;
				$compra->pay_status = 1;

				if($compra->save())
				{
					$user = User::where('id','=',$user_id)->first();
					$NitIde = urlencode($user->NitSec);
		            $id_pedido = urlencode('PED-WEB-'.date('Ymd-Hms'));
		                                                //dd($id_pedido,$SecNum,$NitSec);
		            $totalCompra =  urlencode($compra->total_compra);
		            $CotFecEd = urlencode(date("d-m-y"));
					/*$cont = file_get_contents("http://190.156.239.253:8086/websomic/EDER/TV8/setPrueba2.php?NitIde=$NitIde&id_pedido=$id_pedido&totalCompra=$totalCompra&CotFecEd=$CotFecEd");*/
					$cont = file_get_contents("http://190.156.239.253:8086/websomic/EDER/TV8/Factura.php?NitIde=$NitIde&id_pedido=$id_pedido&totalCompra=$totalCompra&CotFecEd=$CotFecEd");
					$items = Ite::where('compra_id','=',$compra->id)->get();
					
						if($cont == true)
				            {

				                $num = 1;
				                foreach ($items as $item) {   
				                                                                            
				                  $artsec = urlencode($item->ArtSec);

				                  $price  = urlencode($item->valor_unitario);
				                  $CotArtNom = urlencode($item->nombre);
				                  $uni    = urlencode($item->cantidad);
				                  $CotSubPrecio = urlencode($item->valor_total);  
				                  $SecNum      = trim($cont);
				                  $SecNum2 = str_replace('"', '', $SecNum);
				                  $FacSec = urlencode($SecNum2);

				                 /* $cont2 = file_get_contents("http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/setPruebaDetalle.php?artsec=$artsec&price=$price&CotArtNom=$CotArtNom&uni=$uni&CotSubPrecio=$CotSubPrecio&num=$num&SecNum=$SecNum2&NitIde=$NitIde"); */
				                 $cont2 = file_get_contents("http://190.156.239.253:8086/websomic/EDER/TV8/Kardex.php?artsec=$artsec&price=$price&CotArtNom=$CotArtNom&uni=$uni&CotSubPrecio=$CotSubPrecio&num=$num&FacSec=$FacSec&NitIde=$NitIde");
				                  $num++;

				                  
				                
				                }
				            }else{
				            	dd("ERROR CONECTANDO ERP");
				            }

							$datos = Shipping::where('user_id','=',$user->id)->first();
                        	$destinatario = $datos->nombre." ".$datos->apellido;
							Mail::send('emails.compras.com', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"compra"=>$compra,"items"=>$items,"user"=>$user,"destinatario"=>$destinatario/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$compra,$asesor,$aliado,$items,$user,$destinatario){
								$message->to($email, $destinatario)->subject('Compra cotracolta');
							});
								/*$items = Ite::where('compra_id','=',$compra->id)->get();
		                        $user = User::where('id','=',Auth::user()->id)->first();
		                        $email = $user->email;
		                        $datos = Shipping::where('user_id','=',$user->id)->first();
		                        $destinatario = $datos->nombre." ".$datos->apellido;
		                        Mail::send('emails.compras.c1', array('compra'=>$compra, 'items'=>$items,'email'=>$email,'destinatario'=>$destinatario), function($message) use ($compra,$items,$destinatario,$email){
		                        $message->to($email, $destinatario)->subject('Compra en Cootracolta');
		                    });*/
				}else
				{
					Mail::send('emails.auth.noti', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"valor"=>$valor/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$valor,$asesor,$aliado){
						$message->to($email, $aliado)->subject('Compra rechazada');
					});
				}
			}
		}

		public function conf3()
		{
			$ApiKey = "4Vj8eK4rloUd272L48hsrarnUA";
        	
			
			$response_code_pol 			= $_REQUEST['response_code_pol'];
			$value 						= $_REQUEST['value'];
			$ip  						= $_POST['ip'];
			$currency 					= $_POST['currency'];
			$sign 						= $_POST['sign'];
			$additional_value 			= $_POST['additional_value'];
			$state_pol 					= $_POST['state_pol'];
			$reference_sale 			= $_POST['reference_sale'];
			$New_value 	 				= number_format($value, 1, '.', '');
			$firma_cadena 				= "$ApiKey~508029~$reference_sale~$New_value~$currency~$state_pol";
        	$firmacreada 				= md5($firma_cadena);
        	//$email 						= "ederalvarez2091057@gmail.com";
			$empresa		 			= "Megalopolis Inc.";
			$asesor 					="ederAAAA";
			$aliado 					="Eder A";
			$email                      = $_REQUEST['email_buyer'];
			$valor 						= 10000;
			$user_id                    = $_REQUEST['extra1'];

			if ($state_pol == 4)
			{
				$compra = Compra::where('llave','=',$reference_sale)->first();
				$compra->estado_id = 2;
				$compra->pay_status = 1;

				if($compra->save())
				{
					$user = User::where('id','=',$user_id)->first();
					$NitIde = urlencode($user->NitSec);
		            $id_pedido = urlencode('PED-WEB-'.date('Ymd-Hms'));
		                                                //dd($id_pedido,$SecNum,$NitSec);
		            $totalCompra =  urlencode($compra->total_compra);
		            $CotFecEd = urlencode(date("d-m-y"));
					$cont = file_get_contents("http://190.156.239.253:8086/websomic/EDER/TV8/setPrueba2.php?NitIde=$NitIde&id_pedido=$id_pedido&totalCompra=$totalCompra&CotFecEd=$CotFecEd");
					$items = Ite::where('compra_id','=',$compra->id)->get();
					
						if($cont == true)
				            {

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

				                 /* $cont2 = file_get_contents("http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/setPruebaDetalle.php?artsec=$artsec&price=$price&CotArtNom=$CotArtNom&uni=$uni&CotSubPrecio=$CotSubPrecio&num=$num&SecNum=$SecNum2&NitIde=$NitIde"); */
				                 $cont2 = file_get_contents("http://190.156.239.253:8086/websomic/EDER/TV8/setPruebaDetalle.php?artsec=$artsec&price=$price&CotArtNom=$CotArtNom&uni=$uni&CotSubPrecio=$CotSubPrecio&num=$num&SecNum=$SecNum2&NitIde=$NitIde");
				                  $num++;

				                  
				                
				                }
				            }else{
				            	dd("ERROR CONECTANDO ERP");
				            }

							$datos = Shipping::where('user_id','=',$user->id)->first();
                        	$destinatario = $datos->nombre." ".$datos->apellido;
							Mail::send('emails.compras.c1', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"compra"=>$compra,"items"=>$items,"user"=>$user,"destinatario"=>$destinatario/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$compra,$asesor,$aliado,$items,$user,$destinatario){
								$message->to($email, $destinatario)->subject('Compra cotracolta');
							});
								/*$items = Ite::where('compra_id','=',$compra->id)->get();
		                        $user = User::where('id','=',Auth::user()->id)->first();
		                        $email = $user->email;
		                        $datos = Shipping::where('user_id','=',$user->id)->first();
		                        $destinatario = $datos->nombre." ".$datos->apellido;
		                        Mail::send('emails.compras.c1', array('compra'=>$compra, 'items'=>$items,'email'=>$email,'destinatario'=>$destinatario), function($message) use ($compra,$items,$destinatario,$email){
		                        $message->to($email, $destinatario)->subject('Compra en Cootracolta');
		                    });*/
				}else
				{
					Mail::send('emails.auth.noti', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"valor"=>$valor/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$valor,$asesor,$aliado){
						$message->to($email, $aliado)->subject('Compra rechazada');
					});
				}
			}
		}

			
		public function conf2(){

			$ApiKey = "6u39nqhq8ftd0hlvnjfs66eh8c";
        	
			
			$response_code_pol 			= $_REQUEST['response_code_pol'];
			$value 						= $_REQUEST['value'];
			$ip  						= $_POST['ip'];
			$currency 					= $_POST['currency'];
			$sign 						= $_POST['sign'];
			$additional_value 			= $_POST['additional_value'];
			$state_pol 					= $_POST['state_pol'];
			$reference_sale 			= $_POST['reference_sale'];
			$New_value 	 				= number_format($value, 1, '.', '');
			$firma_cadena 				= "$ApiKey~500238~$reference_sale~$New_value~$currency~$state_pol";
        	$firmacreada 				= md5($firma_cadena);
        	$email 						= "ederalvarez2091057@gmail.com";
			$empresa		 			= "Megalopolis Inc.";
			$asesor 					="ederAAAA";
			$aliado 					="Eder A";
			$valor 						= 10000;
			

			if ($state_pol == 4)
			{
				$host 			= "localhost";
				$user 			= "root";
				$bd 			= "tat";
				$pass 			= "eder4EVER";
				$port 			= 3306;
				$nf 			="00923674cac1994875f5e8d53e3a49d8";
				$conexion 		= mysqli_connect($host, $user, $pass, $bd, $port);
				$sql 			= "UPDATE compra SET pay_status = 1 WHERE llave ='$reference_sale'";
				$sql2 			= "INSERT INTO prueba (mensaje) VALUES('$reference_sale')";
				$result 		= mysqli_query($conexion, $sql);
				$result2		= mysqli_query($conexion, $sql2);

				$NitIde 		= urlencode($_REQUEST['extra1']);
           		$id_pedido 		= urlencode('PED-WEB-'.date('Ymd-Hms'));
                                                //dd($id_pedido,$SecNum,$NitSec);
           		$totalCompra 	= urlencode($New_value);
            	$CotFecEd 		= urlencode(date("d-m-y"));
				$cont 			= file_get_contents("http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/setPrueba2.php?NitIde=$NitIde&id_pedido=$id_pedido&totalCompra=$totalCompra&CotFecEd=$CotFecEd");

				if($cont)
				{
					Mail::send('emails.auth.noti', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"valor"=>$valor/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$valor,$asesor,$aliado){
						$message->to($email, $aliado)->subject('Compra aprobada');
					});
				}
			
				
			}else{
				Mail::send('emails.auth.noti', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"valor"=>$valor/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$valor,$asesor,$aliado){
						$message->to($email, $aliado)->subject('Compra rechazada');
					});
			}
			//return View::make('PayRes.payupost');
			//App::make('UserController')->getItems();
			

		}



		public function items()
		{
			$email = "ederalvarez2091057@gmail.com";
			$empresa = "Megalopolis Inc.";
			$asesor ="ederAAAA";
			$aliado ="Eder A";
			$valor   = 10000;
			$compra = new Compra;
					$compra->user_id 	= 3;
					$compra->totalCart  =   1000;
					$compra->total_compra  =  1000;
					$compra->num_items  =   1;
					$compra->tipo_compra = 	2;
					$compra->vlr_envio   =  2000;
					$compra->save();
					

               /* foreach ($its as $item) {
                		Mail::send('emails.auth.noti', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"valor"=>$valor, function($message) use ($email,$empresa,$valor,$asesor,$aliado){
						$message->to($email, $aliado)->subject('Compra tiendo');
							});
                	

								$citem = new Ite;                
			                    $citem->compra_id           =   $compra->id;

			                    $citem->id_producto         =   $item->id;
			                    $citem->nombre              =   $item->name;
			                    $citem->valor_unitario      =   $item->price;
			                    $citem->image               =   $item->image;
			                    $citem->iva                 =   $item->tax;
			                    $citem->cantidad            =   $item->quantity;
			                    $citem->valor_total         =   $item->total();
			                 

			                    $citem->save();

                }*/
					
		}

	}
?>
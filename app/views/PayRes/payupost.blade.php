<?php
	$v = Cart::contents();

	//dd($v[0]);

	$email = "ederalvarez2091057@gmail.com";
			$empresa = "Payupost Inc.";
			$asesor ="post";
			$aliado ="Eder post";
			$valor   = 10000;
			$compra = new Compra;
					$compra->user_id 	= 3;
					$compra->totalCart  =   87878;
					$compra->total_compra  =  86868;
					$compra->num_items  =   18;
					$compra->tipo_compra = 	2;
					$compra->vlr_envio   =  5000;
					$compra->save();

					


					// Conectando, seleccionando la base de datos
$host = "localhost";

$user = "root";

$bd = "tat";

$pass = "eder4EVER";



$port = 3306;
$conexion = mysqli_connect($host, $user, $pass, $bd, $port);

/*for ($i=0; $i <1 ; $i++) { 
	$sql = "UPDATE prueba SET mensaje = 'pase por aqui VERSION 4 recargada'";
	$result = mysqli_query($conexion, $sql);
	
}*/

foreach (Cart::contents(true) as $item) {
	
                	
                				$sql = "UPDATE prueba SET mensaje = 'pase por aqui VERSION 55 recargada'";
	$result = mysqli_query($conexion, $sql);

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

                }




//dd("LLEGUE");
					

               /*foreach (Cart::contents() as $item) {

                	
                	

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
?>
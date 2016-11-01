<?php

class 	ErpController extends BaseController {


	protected $producto;
	protected $cat;
	protected $barrio;
	protected $conn;
	protected $server;
	protected $db;
	protected $user;
	protected $pass;
	protected $urlMantis;
	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio, Conn $conn)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->conn         = $conn;
		$this->server       = $this->conn->getServer();
		$this->user         = $this->conn->getUser();
		$this->pass         = $this->conn->getPass();
		$this->db           = $this->conn->getDb();
		$this->img          = $this->conn->getUrlImg();
		$this->urlMantis       = $this->conn->getUrlImg();
		
	}


	public function erpArticulo()
	{
		if(isset($_REQUEST['ArtSec'])){
			$artsec  =  $_REQUEST['ArtSec'];
			$artdes  =  $_REQUEST['ArtFicTec'];
			$ArtNom  =  $_REQUEST['ArtNom'];
			$ArtCod  =  $_REQUEST['ArtCod'];
			$InvFamCod =$_REQUEST['InvFamCod'];
			$ArtImg   = $_REQUEST['ArtImg'];

			$pro 	=	Producto::where('ArtSec','=',$artsec)->first();

			if ($pro){
				if($ArtImg != NULL /*&& $pro->ArtImg_GXI != '0'*/)
								   			{
								   				//$nombre = Str_replace('gxdbfile:','',$ArtImg);
								   				$nombre = Str_replace('http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/','',$ArtImg);
								   				$urlImg = "http://190.156.239.253:8080/Tiendo/PublicTempStorage/multimedia/".$nombre;

								   				//Image::make($urlImg)->resize(300, null, function ($constraint) {$constraint->aspectRatio();})->save(public_path().'/img/Mantis/'.$nombre);
								   				//Image::make($urlImg)->save(public_path().'/img/Mantis/'.$nombre);
								   				//$urlImg = $this->urlMantis.$nombre;
								   				//$prod->img = 'img/Mantis/'.$nombre;
								   				$pro->img = $urlImg;


								   			}else
								   			{
								   				$urlImg = 'img/Mantis/def.png';
								   				$pro->img = $urlImg;
								   			}
				$pro->descripcion =  utf8_encode($artdes);
				if($pro->save()){
					dd("Articulo guardado");
				}
			}else{
				//dd("No existe Articulo");
						$prod = new Producto;
						
									if($ArtImg != NULL /*&& $pro->ArtImg_GXI != '0'*/)
								   			{
								   				$nombre = Str_replace('http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/','',$ArtImg);
								   				$urlImg = "http://190.156.239.253:8080/Tiendo/PublicTempStorage/multimedia/".$nombre;

								   				//Image::make($urlImg)->resize(300, null, function ($constraint) {$constraint->aspectRatio();})->save(public_path().'/img/Mantis/'.$nombre);
								   				//Image::make($urlImg)->save(public_path().'/img/Mantis/'.$nombre);
								   				//$urlImg = $this->urlMantis.$nombre;
								   				//$prod->img = 'img/Mantis/'.$nombre;
								   				$prod->img = $urlImg;


								   			}else
								   			{
								   				$urlImg = 'img/Mantis/def.png';
								   				$prod->img = $urlImg;
								   			}
									

										
										$Nombre = strtolower($ArtNom);
										$Nombre = utf8_encode($Nombre);
										$artnom = utf8_encode($ArtNom);
										$VarSlug = Str::slug($Nombre);
										
										$prod->id_mantis = $ArtCod;
										//$prod->pro_nom = $pro['artnom'];
										$prod->ArtSec    = $artsec;
										$prod->pro_nom = $ArtNom;
										/*if($pro->dt == '')
										{
											$prod->dt           = NULL;
										}else
										{
											$prod->dt           = $pro->dt;
										}*/
										$prod->dt      = null;
										//$prod->InvFamCod = $pro['InvFamCod'];


							

										$prod->categoria_id = $InvFamCod;
										$prod->descripcion	=  utf8_encode($artdes);
										$prod->slug = $VarSlug;
										/*if($pro->parconiva <> 0){
											$valIva = ($pro->precio3*$pro->parconiva)+$pro->precio3;
										}else{
											$valIva = $pro->precio3;
										}*/
										
										$prod->precio = 0;//$pro->precio3;
										$prod->valIva = 0;//$pro->valIva;
										$prod->por_iva = 0;//$pro->parconiva;
										$prod->cantidad = 0;//$pro->saldo;

										if($prod->save()){
											dd("Producto creado");
										}else{
											dd("error creando articulo");
										}


			}
		}else{
			dd("No se encontró el ArtSec");
		}
	}



	public function erpArticuloCar()
	{
		if(isset($_REQUEST['ArtSec'])){
			$ArtSec  		=  $_REQUEST['ArtSec'];
			$ArtCarSec  	=  $_REQUEST['ArtCarSec'];
			$ArtCarNom  	=  $_REQUEST['ArtCarNom'];
			$ArtCarDetId  	=  $_REQUEST['ArtCarDetId'];
			$ArtCarDetDes 	=  $_REQUEST['ArtCarDetDes'];
			$ArtCarEst  	=  $_REQUEST['ArtCarEst'];
			$ArtCarDetEst 	=  $_REQUEST['ArtCarDetEst'];

			
		}else{
			$ArtSec  		=  '198722';
			$ArtCarSec  	=  '1';
			$ArtCarNom  	=  'color';
			$ArtCarDetId  	=  '1';
			$ArtCarDetDes 	=  'AMARILLO';
			$ArtCarEst  	=  'A';
			$ArtCarDetEst 	=  'A';
			//dd("No se encontró el ArtSec");
		}


			$car 	=	Caract::where('ArtSec','=',$ArtSec)->where('ArtCarDetId','=',$ArtCarDetId )->first();

			if ($car){
				$car->ArtCarSec 	= $ArtCarSec;
				$car->ArtCarNom		= $ArtCarNom;
				$car->ArtCarDetId 	= $ArtCarDetId;
				$car->ArtCarDetDes 	= $ArtCarDetDes;
				$car->ArtCarEst 	= $ArtCarEst;
				//$car->ArtCArDetEst 	= $ArtCarDetEst;
					if($car->save()){
						dd("Caracteristicas de Articulo Editada");
					}else{
						dd("ERROR 1057");
					}
			}else{
				$c = new Caract();
				$c->ArtSec 			= $ArtSec;
				$c->ArtCarSec 		= $ArtCarSec;
				$c->ArtCarNom		= $ArtCarNom;
				$c->ArtCarDetId 	= $ArtCarDetId;
				$c->ArtCarDetDes 	= $ArtCarDetDes;
				$c->ArtCarEst 		= $ArtCarEst;
				//$c->ArtCArDetEst 	= $ArtCarDetEst;
				if ($c->save()){
					dd("Caracteristicas de Articulo Agregada");
				}else{
					dd("ERROR 1057");
				}

			}
	}


}
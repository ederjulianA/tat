<?php

class Ajax2Controller extends BaseController {

	protected $pro;
	protected $cat;
	protected $envio;

	public function __construct(Producto $pro, Categoria $cat, Envio $envio)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->envio 	= $envio;
	}


	public function setPostPrueba()
	{
		$id = 5;
		$msg = "eder alv";
		$msg2 = urlencode($msg);
		$cont = file_get_contents("http://somic.com.co:8086/WEBSOMIC/EDER/TIENDO/setPrueba.php?id=$id&msg=$msg2");
		if($cont == true)
		{
			dd("done");
		}else{
			dd("not dont");
		}
	}

	public function urlSeaCod()
	{
		if(isset($_POST['cod']) || isset($_POST['nom']))
		{
			$cod = $_POST['cod'];
			$nom = $_POST['nom'];
			

			$pros = Producto::where('id_mantis', 'LIKE', $cod.'%')->where('pro_nom', 'LIKE', $nom.'%')->get();
			$numPro = count($pros);
			$estado = array('estado'=>1,'msg'=>'Productos encontrados');
				return Response::json(array('estado'=>$estado,'pros'=>$pros));
			
			if($numPro > 0)
			{
				$estado = array('estado'=>1,'msg'=>'Productos encontrados');
				return Response::json(array('estado'=>$estado,'pros'=>$pros));
			}else{
				$estado = array('estado'=>2,'msg'=>'No hay productos');
				return Response::json(array('estado'=>$estado));
			}
		}
	}


	public function urlSaveFamilias()
	{
			header('Content-type: text/javascript');
		if(isset($_POST['data'])){

			$data = $_POST['data'];
			$dd   = json_decode( json_encode($data,true));
			foreach ($dd as  $gru) {//objeto que contiene más objetos
				
				$grup = Familia::where('InvFamCod','=',$gru->InvFamCod)->first();
						if($grup)
						{
										$VarSlug = Str::slug($gru->InvFamNom);
										$grup->InvFamCod = $gru->InvFamCod;
										$grup->InvFamId = $gru->InvFamCod;
										$grup->InvFamNom = $gru->InvFamNom;
										$grup->fam_slug = $VarSlug;
										$grup->save();
						}else{
										$grupo = new Familia();
										$VarSlug = Str::slug($gru->InvFamNom);
										$grupo->InvFamId = $gru->InvFamCod;
										$grupo->InvFamCod = $gru->InvFamCod;
										$grupo->InvFamNom = $gru->InvFamNom;
										$grupo->fam_slug = $VarSlug;
										$grupo->save();
						}
			}


			$estado = array('estado'=>1,'msg'=>'Se ha terminado la sincronizacion exitosamente 2');
			return Response::json(array('estado'=>$estado)); 
		}
	}


	public function urlSaveGrupos()
	{
			header('Content-type: text/javascript');
		if(isset($_POST['data'])){

			$data = $_POST['data'];
			$dd   = json_decode( json_encode($data,true));
			foreach ($dd as  $gru) {//objeto que contiene más objetos
				
				$grup = Grupo::where('InvGruCod','=',$gru->invgrucod)->first();
						if($grup)
						{
										$VarSlug = Str::slug($gru->invgrunom);
										$grup->InvGruId = $gru->invgrucod;
										$grup->InvGruCod = $gru->invgrucod;
										$grup->InvGruNom = $gru->invgrunom;
										$grup->slug_grupo = $VarSlug;
										$grup->save();
						}else{
										$grupo = new Grupo();
										$VarSlug = Str::slug($gru->invgrunom);
										$grupo->InvGruId = $gru->invgrucod;
										$grupo->InvGruCod = $gru->invgrucod;
										$grupo->InvGruNom = $gru->invgrunom;
										$grupo->slug_grupo = $VarSlug;
										$grupo->save();
						}
			}


			$estado = array('estado'=>1,'msg'=>'Se ha terminado la sincronizacion exitosamente 2');
			return Response::json(array('estado'=>$estado)); 
		}
	}



	public function UrlLoadPro()
	{
		if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=Eder-pc,1433;Database=erpweb;", 'sa', 'Somic321')){ 
			   	//echo "Conectado correctamente"; 
			   	
			        $ssql = "select top 10 ArtImg_GXI, ArtCod,artsec,artnom,f.InvFamNom,
								cast(ArtBalBas*(1+((select LisPreRen from  ListasPrecios where LisPreCod=1) /100)) as int)as precio1,
								cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=2) /100)) as int) precio2,
								SG.InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
								from Kardex k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec),0) saldo
								 from articulos a left join ListasPrecios on LisPreCod=1 left join ParametroContable p on p.parconcod=a.ParConCod
								left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
								"; 
			   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
			   		
			   		while ($info = odbc_fetch_object($rs_access)) {
			 		   //$content[] = $info;
			   			//$ciudades = new Ciudad;
			   			$deps[] = $info;

			   			$Nombre = strtolower($info->artnom);
						$Nombre = utf8_encode($Nombre);
						$VarSlug = Str::slug($Nombre);
			   			if($info->ArtImg_GXI != NULL)
			   			{
			   				$nombre = Str_replace('gxdbfile:','',$info->ArtImg_GXI);
			   				$urlImg = 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/'.$nombre;
			   			}else
			   			{
			   				$urlImg = 'http://localhost:8000/img/Mantis/def.png';
			   			}
			   			
			   			$datos[] = array('ArtCod'=>utf8_encode($info->ArtCod),'ArtSec'=>utf8_encode($info->artsec),'ArtNom'=>utf8_encode($info->artnom),'InvFamNom'=>utf8_encode($info->InvFamNom),'precio1'=>utf8_encode($info->precio1),'InvFamNom'=>utf8_encode($info->InvFamNom),'UrlImg'=>utf8_encode($urlImg),'Slug'=>utf8_encode($VarSlug));
			   			//dd($datos);

			   			//dd($deps);
						}// END WHILE############################

					} ############END RS_ACCESS##############	
			}###### END IF CON_ACCESS
			//dd($deps);
			$estado = array('estado'=>1,'mensaje'=>'Se actualizado el estado del pedido');
		
			//return Response::json(array('text' => ' test'), 200, null, JSON_UNESCAPED_UNICODE);
			return Response::json(array('productos'=>$datos,'estado'=>$estado));
			//dd($deps);
	}


	public function urlReparto()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['id_pedido']))
		{
			$idpedido = $_POST['id_pedido'];

			$compra = Compra::where('id','=',$idpedido)->first();
			if($compra)
			{
				$compra->estado_id = 3;
				if($compra->save())
				{
					$estado = array('estado'=>1,'mensaje'=>'Se actualizado el estado del pedido');

					return Response::json(array('estado'=>$estado,'compra'=>$compra));
				}
			}

		}
	}


	public function getLoadProductosSearch($search)
	{
		header('Content-type: text/javascript');

		//$nombre = Input::get('seach');

		$producto = DB::table('productos as p')
			->select(
					'p.id',
					'p.pro_nom',
					'p.slug',
					'p.precio'
					
				)->where('p.pro_nom', 'LIKE', '%'.$search.'%')->get();
		return Response::json($producto);
	}

	public function getLoadProductos()
	{
		$productos = Producto::all();

		return View::make('load.productos',compact('productos'));
	}

	public function urlBuscarProd()
	{
		if(isset($_POST['name']) && $_POST['name'] == null)
		{
			$estado = array('estado'=>'1');
			$pro = Producto::where('id','>',0)->orderBy('id','asc')->get();
			return Response::json(array('estado'=>$estado, 'productos'=>$pro));
		}
		if(isset($_POST['name']))
		{
			$name = $_POST['name'];
			$pro = Producto::where('pro_nom','LIKE','%'.$name.'%')->take(20)->get();
			$estado = array('estado'=>'2');
			return Response::json(array('estado'=>$estado,'productos'=>$pro));

		}
		
	}

	public function urlAddProd()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['idPedido']) and isset($_POST['idArt']))
		{
			$pedido   = Compra::where('id','=',$_POST['idPedido'])->first();
			$producto = Producto::where('id','=',$_POST['idArt'])->first();
			$cant     = $_POST['ctd'];
			if($pedido)
			{
				$pro_pre        =    $producto->precio;
				$pro_iva        =    $producto->por_iva;
				
				if($pro_iva == NULL)
				{
					$totalProducto  = $pro_pre*$cant;
				}else {
					$precioIva   	=	($pro_pre * $pro_iva)/100;
					$totalProducto  =    ($pro_pre + $precioIva)*$cant;
				}
				
				
				
				$pedido->totalCart = $pedido->totalCart + $totalProducto;
				$pedido->total_compra = $pedido->total_compra + $totalProducto;
				$pedido->num_items = $pedido->num_items +$cant;
				if($pedido->save())
				{
					//$estado = array('estado'=>'0');
					//return Response::json($pedido);
					$item = Item::where('compra_id','=',$pedido->id)->where('id_producto','=',$producto->id)->first();
					if($item)
					{
						

						//$producto->compra_id 		=   $pedido->id;
						//$producto->nombre			=	$producto->pro_nom;
						//$producto->image 			=	$producto->img;
						//$producto->valor_unitario	=	$pro_pre;
						//$producto->iva   			=	$pro_iva;

						
						$item->cantidad			=	$item->cantidad +$cant;
						//$producto->id_producto	 	=	$producto->id;
						
						$item->valor_total 		=	$item->valor_total + $totalProducto;

						
						if($item->save()){
							$estado = array('estado'=>'2','mensaje'=>'Se ha guardado el producto');

						return Response::json(array('estado'=>$estado,'pedido'=>$pedido,'producto'=>$producto,'item'=>$item));
						}	
						
					}
					else{
						$item = new Item;
						$item->compra_id 		=   $pedido->id;
						$item->nombre			=	$producto->pro_nom;
						$item->image 			=	$producto->img;
						$item->valor_unitario	=	$pro_pre;
						$item->iva   			=	$pro_iva;
						$item->cantidad			=	$cant;
						$item->id_producto	 	=	$producto->id;
						$precioIva   			=	($pro_pre * $pro_iva)/100;
						$item->valor_total 		=	($pro_pre + $precioIva)*$cant;

						if($item->save()){
							$estado = array('estado'=>'1','mensaje'=>'Se ha creado el nuevo producto');

							return Response::json(array('estado'=>$estado,'pedido'=>$pedido,'producto'=>$producto,'item'=>$item));
						}
						
					}
				}
			}
			
		}
		

	}

	public function urlDeleteProd()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['idPedido']) and isset($_POST['idArt']))
		{
			$pedido   = Compra::where('id','=',$_POST['idPedido'])->first();
			$producto = Producto::where('id','=',$_POST['idArt'])->first();
			$cant     = $_POST['ctd'];
			if($pedido)
			{

				$item = Item::where('compra_id','=',$pedido->id)->where('id_producto','=',$producto->id)->first();
				if($item)
				{
					$pedido->totalCart 		= ($pedido->totalCart	 - $item->valor_total);
					$pedido->total_compra 	= $pedido->total_compra  - $item->valor_total;
					$pedido->num_items		= $pedido->num_items	 - $item->cantidad;

					if($pedido->save())
					{
						$item->delete();

						$estado = array('estado'=>'1');

						return Response::json(array('estado'=>$estado,'pedido'=>$pedido));

					}	

				}
			}
		}
	}


	public function urlTestPro()
	{
		header('Content-type: text/javascript');
		

		if(isset($_REQUEST['data']))
		{
			$data = $_REQUEST['data'];
			

			$dd   = json_decode( json_encode($data,true));
			//return Response::json($dd);

			//$ids  = "";

			foreach($dd as $d){
				return Response::json($dd);
				
					//return Response::json($conteo);
					
				
					//$v = $d->editado;
					//$s=$v;
					//return Response::json($s);
					$pro = Producto::where('dt','=','0')->first();

					if(!$pro)
					{
						$ids = $ids."'".$d->conteo."',";
					}else
					{
						$ids =$ids;
					}	

				
			}	
			return Response::json($ids);

			

		}
	}


	public function urlTestSavePro()
	{
		header('Content-type: text/javascript');
		if(isset($_REQUEST['data']))
		{
			$data = $_REQUEST['data'];
			$dd   = json_decode( json_encode($data,true));

			foreach($dd as $pro){



					$prod = Producto::where('id_mantis','=',$pro->ArtCod)->first();
									if($prod)
									{

										if($prod->dt != $pro->dt){

												//File::delete($prod->img);
										if($pro->ArtImg_GXI != NULL && $pro->ArtImg_GXI != '0')
								   			{
								   				$nombre = Str_replace('gxdbfile:','',$pro->ArtImg_GXI);
								   				$urlImg = "http://somic.com.co:8081/MantisWeb20mantis2016/PublicTempStorage/multimedia/".$nombre;

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
										/*if(!$pro['ArtFot'])
										{
											$filename ="def.png";
											$prod->img = 'img/Mantis/'.$filename;
										}
										else
										{
												//###########CREAR LA IMAGEN DESDE EL ARCHIVOBLOB

											$codigoIMG = str_random(13);
											$filename = date('Y-m-d-H-m-s')."-".$codigoIMG.".jpg";

											//Image::make($p->ProImg)->resizeCanvas(800, 400, null, false, '#fff')->save(public_path().'/img/products/'.$filename);

											Image::make($pro['ArtFot'])->save(public_path().'/img/Mantis/'.$filename);
											$prod->img = 'img/Mantis/'.$filename;
											
										########################################
										}*/

										
										$Nombre = strtolower($pro->artnom);
										$Nombre = utf8_encode($Nombre);
										$artnom = utf8_encode($pro->artnom);
										$VarSlug = Str::slug($Nombre);
										
										$prod->id_mantis = $pro->ArtCod;
										//$prod->pro_nom = $pro['artnom'];
										$prod->ArtSec    = $pro->artsec;
										$prod->pro_nom = $pro->artnom;
										$prod->dt      = $pro->dt;
										//$prod->InvFamCod = $pro['InvFamCod'];


							

										$prod->categoria_id = $pro->InvFamCod;
										$prod->descripcion	= $pro->ArtFicTec;
										$prod->slug = $VarSlug;
										
										$prod->precio = $pro->precio3;
										$prod->por_iva = $pro->parconiva;
										$prod->cantidad = $pro->saldo;

										$prod->save();


										}
										

										//cierra dt
									}



									else{
										
										$producto = new Producto;
											if($pro->ArtImg_GXI != NULL && $pro->ArtImg_GXI != '0')
								   			{
								   				$nombre = Str_replace('gxdbfile:','',$pro->ArtImg_GXI);

								   				$urlImg = "http://somic.com.co:8081/MantisWeb20mantis2016/PublicTempStorage/multimedia/".$nombre;
								   				//Image::make($urlImg)->resizeCanvas(400, 400, null, true, '#fff')->save(public_path().'/img/Mantis/'.$nombre);
								   				//Image::make($urlImg)->save(public_path().'/img/Mantis/'.$nombre);
								   				//$producto->img = 'img/Mantis/'.$nombre;
								   				//$urlImg = $this->urlMantis.$nombre;
								   				//$prod->img = 'img/Mantis/'.$nombre;
								   				$producto->img = $urlImg;
								   			}else
								   			{
								   				$urlImg = 'img/Mantis/def.png';
								   				$producto->img = $urlImg;
								   			}
											//CREAR LA IMAGEN DESDE EL ARCHIVOBLOB
											//$img = base64_encode($pro['ArtFot']);
											//dd($pro['ArtFot']);
											/*if(!$pro['ArtFot'])
												{
													$filename ="def.png";
													$producto->img = 'img/Mantis/'.$filename;
												}
												else
												{
														//###########CREAR LA IMAGEN DESDE EL ARCHIVOBLOB

													$codigoIMG = str_random(13);
													$filename = date('Y-m-d-H-m-s')."-".$codigoIMG.".jpg";

													//Image::make($p->ProImg)->resizeCanvas(800, 400, null, false, '#fff')->save(public_path().'/img/products/'.$filename);

													Image::make($pro['ArtFot'])->save(public_path().'/img/Mantis/'.$filename);
													$producto->img = 'img/Mantis/'.$filename;
													
												########################################
												}*/

											/*$codigoIMG = str_random(13);
											$filename = date('Y-m-d-H-m-s')."-".$codigoIMG.".jpg";

											//Image::make($p->ProImg)->resizeCanvas(800, 400, null, false, '#fff')->save(public_path().'/img/products/'.$filename);
											Image::open($pro['ArtFot'])->save(public_path().'/img/Mantis/'.$filename);*/
											
										########################################
										/*$Nombre  = str_replace ( array('ñ','Ñ') , 'n' , $pro['artnom']  );
										$Nombre  = str_replace ( array('/','*') , '' , $pro['artnom']  );*/
										$Nombre = strtolower($pro->artnom);
										$Nombre = utf8_encode($Nombre);
										$artnom = utf8_encode($pro->artnom);
										$VarSlug = Str::slug($Nombre);
										
										
										$producto->id_mantis = $pro->ArtCod;
										$producto->ArtSec    = $pro->artsec;

										//$producto->pro_nom = $pro['artnom'];
										$producto->pro_nom 		= $pro->artnom;
										$producto->categoria_id = $pro->InvFamCod;
										//$producto->InvFamCod   =  $pro['InvFamCod'];
										$producto->descripcion 	= $pro->ArtFicTec;
										$producto->slug 		= $VarSlug;
										//$producto->img = 'img/Mantis/'.$filename;
										$producto->precio 		= $pro->precio3;
										$producto->por_iva 		= $pro->parconiva;
										$producto->cantidad 	=  $pro->saldo;
										$producto->dt           = $pro->dt;
										$producto->save();
									}

			}

			$estado = array('estado'=>1,'msg'=>'Se ha terminado la sincronizacion exitosamente 2');
			return Response::json(array('estado'=>$estado)); 
		}
	}


	


	public function saveproducts()
	{

		header('Content-type: text/javascript');
		if(isset($_POST['data'])){

			$data = $_POST['data'];
			$dd   = json_decode( json_encode($data,true));

			foreach ($dd as  $gru) {//objeto que contiene más objetos
				
				
					
					$grup = Grupo::where('InvGruCod','=','$gru->InvGruCod')->first();
						
						if($grup)
						{
										$VarSlug = Str::slug($gru->InvGruNom);
										$grup->InvGruId = $gru->InvGruId;
										$grup->InvGruCod = $gru->InvGruCod;
										$grup->InvGruNom = $gru->InvGruNom;
										$grup->slug_grupo = $VarSlug;
										$grup->save();
											
										

						}else{

										$grupo = new Grupo();
										
										
										$VarSlug = Str::slug($gru->InvGruNom);

										
				

										$VarSlug = Str::slug($gru->InvGruNom);
										$grupo->InvGruId = $gru->InvGruId;
										$grupo->InvGruCod = $gru->InvGruCod;
										$grupo->InvGruNom = $gru->InvGruNom;
										$grupo->slug_grupo = $VarSlug;
										

										$grupo->save();
										

						}
					
				
				
						
			}


			$estado = array('estado'=>1,'msg'=>'Se ha terminado la sincronizacion exitosamente 2');
			return Response::json(array('estado'=>$estado)); 
		}
	}

	public function prueba()
	{
		$env = new Envio();
		$env->nom_metodo = "hfhfhf";
		$env->tiempo_entrega = "40";
		$env->valor    ="3000";
		$env->save();
	}

	public function urlSync()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['data']))
		{
			$data = $_POST['data'];
			$dd   = json_decode( json_encode($data,true));


			//$dd = json_decode($data);

			//return Response::json($dd);

			
			//$jsondatas = $_POST['data'];
			//$dataJson = file_get_contents($jsondatas);
			//$data = json_decode($datas,true);
			//$productos = $data->productos;
			//$productos = $datas->productos;

			//return Response::json($dd);
			foreach($dd as $d){
				
				foreach ($d as $a)
				{
					$pro = Producto::where('id_mantis','=',$a->id)->first();
						if($pro)
						{
							$pro->pro_nom 		= $a->nombre;
							$pro->categoria_id 	= $a->categoria;
							$pro->descripcion  	= $a->descripcion;
							$pro->slug         	= $a->slug; 
							$pro->img   		= 'http://tiendo.co/'.$a->imagen;
							$pro->precio       	= "1000";
							$pro->por_iva      	= null;
							$pro->cantidad     	= "90";
							$pro->save();
							/*if($pro->save())
							{
								return Response::json(array('pro'=>$pro));
							}*/
							
						}
						else
						{
							$producto = new Producto;
							$producto->id_mantis    = $a->id;
							$producto->pro_nom      = $a->nombre;
							$producto->categoria_id = $a->categoria;
							$producto->descripcion  = $a->descripcion;
							$producto->slug         = $a->slug; 
							$producto->img   		= 'http://tiendo.co/'.$a->imagen;
							$producto->precio       = "1000";
							$producto->por_iva      = null;
							$producto->cantidad     = "100";
							$producto->save();
							
							/*if($producto->save())
							{
								return Response::json(array('pro'=>$producto));
							}*/
						}
							
						
					
				}
				
			

			}
			$estado = array('estado'=>1,'msg'=>'Se ha terminado la sincronizacion exitosamente 2');
			return Response::json(array('pro'=>$pro,'estado'=>$estado)); 
		}
	}
}

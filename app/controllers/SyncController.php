<?php

class 	SyncController extends BaseController {


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
		$this->urlMantis       = $this->conn->getUrlImg();
		
	}



	public function pedMantis()
	{
			if ($conn_access = odbc_connect ( "Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
			 $ssql = "select * from Secuencia where SecCod='PEDIDO'"; 
			if($rs_access = odbc_exec ($conn_access, $ssql)){ 
						while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$SecNum = $info['SecNum'];
					   			
								}// END WHILE############################
									$NitIde = Auth::user()->NitSec;
									$ssql2 = "select * from Nit where NitIde ='$NitIde'";
									if($rs_access = odbc_exec($conn_access, $ssql2)){ 
												while ($info2 = odbc_fetch_array($rs_access)) {
					 		  
					   							$NitSec = $info2['NitSec'];
					   			
												}// END WHILE############################
												$id_pedido = 'PED-WEB-'.date('Ymd-Hms');
												//dd($id_pedido,$SecNum,$NitSec);
												$totalPedido = Cart::total();


												$ssql3 ="INSERT INTO Cotizaciones1(CotTip,CotSec,TipCod,EmpCod,CotFecha,CotObs,CotUsuCod,CotCliConPag,CotSecConCon,CotLisPreCod,CotSubVenCod,CotSubNitSec,CotSubCliSec,CotNum,CotSumCot,BodSucCCSec,CotEst,CotSubCotSec,AnuFueSec,CotAnuObs,CotEstado)
                   								 VALUES('P','$SecNum','PED',1,'16-01-2016','miobs','admin',1/*cliConPag*/,1/*numItems*/,1/*lisprecod*/,3/*vencod*/,'$NitSec'/*nitsec*/,1/*clisec*/,'$id_pedido','$totalPedido',1/*BODsUCCSEC*/,2/*CotEst*/,NULL,NULL,NULL,'A')";

                   								 if($rs_access = odbc_exec($conn_access, $ssql3)){ 
                   								 		$ssql4 = "UPDATE Secuencia SET SecNum=SecNum+1 where SecCod='PEDIDO'";
                   								 		if($rs_access = odbc_exec($conn_access, $ssql4)){
   foreach (Cart::contents() as $item) {   
					               								 			
                  $artSec = $item->ArtSec;
                  $price  = $item->price;
                  $uni    = $item->quantity ;	               								 			
  $ssql5 = "insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec
,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,
CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,
CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva,CotSubPrecio)
values('P','$SecNum',1,'N',$artSec/*ArtSec*/,1 /*ArtEmb*/,'S/L','1999-01-01 00:00:00.000',0.000000,$uni/*CotArtUni*/,0.00,0.00,0.00,0.00,0.00000,
(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec='$artSec'),
'$price'/*CotArtPrecio*/,0.00000,0.00000,0.00000,0.00000,0.00000,isnull((select lisprecod from clientes where nitsec='$NitSec' and clisec=1),0)
,(select top 1 PreArtCod from ArtPre where artsec=$artSec),1,0,0,'A',0,0.00000,1.00000,NULL,0.00000
,(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artSec),'$price')
";
															if($rs_access = odbc_exec($conn_access, $ssql5)){
																
															}//END IF SSQL5

														}//end FOR EACH
														dd("PEDIDO REALIZADO");
                   								 	}

                   								 }//END SSQL3
									}//end if ssql2


					 
			}//END IF SSQL############################
		}
	}




	public function urlValDis()

	{
		$producto = Producto::where('id','=',$_POST['id'])->first();

		$artCod  = $producto->id_mantis;
		if ($conn_access = odbc_connect ( "Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
			 $ssql = "select  ArtSec,ArtCod,artsec,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=2) /100)) as int) precio2,

				isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
				from Kardex k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec),0) saldo 
				from articulos a left join ListasPrecios on LisPreCod=1 left join ParametroContable p on p.parconcod=a.ParConCod
				left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
				where ArtCod = '$artCod'
			"; 
			if($rs_access = odbc_exec ($conn_access, $ssql)){ 
						while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$pro = $info;
								}// END WHILE############################

								if($pro)
								{
									$estado = array('estado'=>1,'msg'=>'Producto encontrado');
									return Response::json(array('estado'=>$estado,'pro'=>$pro));
								}

			}
		}
	}


	public function insertPais()
	{
		if ($conn_access = odbc_connect ( "Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
   	echo "Conectado correctamente<br>"; 
   	
        $ssql = "insert into Pais(PaiSec,PaiCod,PaiNom) values('','EDE','EDER')"; 
   	

//$rs_access = odbc_exec ($conn_access, $ssql);


if($rs_access = odbc_exec ($conn_access, $ssql))
        { 
      	 
        echo "<br>La sentencia se ejecutó correctamente"; 

   	   }else
           { 
      	    echo "Error al ejecutar la sentencia SQL"; 
   	   }
} else{ 
   	echo "Error en la conexión con la base de datos"; 
} //die( print_r( sqlsrv_errors(), true));

	}


	public function testConn()

	{
		 if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
					   	echo "Conectado correctamente"; 
					   	if(!$conn_access)
					   	{
					   		dd("ERROR");
					   	}
					   	
					        			        $ssql = "select * from InventarioFamilia"; 

					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$empresa = $info;
								}// END WHILE############################

							} ############END RS_ACCESS##############	
							if($empresa)
							{
								return Redirect::back()->with('message-alert','ERP CONECTADO');
							}else{
								return Redirect::back()->with('message-alert','ERP NO CONECTADO');
							}
						}###### END IF CON_ACCESS
						else{
							return Redirect::back()->with('message-alert','ERP NO CONECTADO');
						}



						

						

						
	}




	public function mantisSync()
	{




			if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
					   	echo "Conectado correctamente"; 
					   	
					        			        $ssql = " select top 15 a.artsec,a.ArtSec, a.ArtNom,ArtImg_GXI,a.InvFamCod,a.ArtCod,a.ArtFicTec,parconiva,
0 precio1,0 precio2,
cast(isnull((p3.PrePreFijVal),0)/(1-((isnull(p3.preporval,0))/100)) as int) precio3,

  replace(replace(replace(SG.InvSubGruCod,'S',''),'G',''),'0','99') InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
 from Kardex  k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec ),0) saldo
 from articulos a   
 left join PreciosDetalle p3 on p3.ArtSec=a.ArtSec and  p3.LisPreCod=1
 
 left join PresentacionArticulos pres on pres.preartcod=p3.preartcod
 left join ParametroContable p on p.parconcod=a.ParConCod
 left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
 where  artdes='N'"; 


					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$pros[] = $info;
								}// END WHILE############################

							} ############END RS_ACCESS##############	
						}###### END IF CON_ACCESS		


								foreach ($pros as $pro) {
									$prod = Producto::where('id_mantis','=',$pro['ArtCod'])->first();
									if($prod)
									{
										File::delete($prod->img);
										if($pro['ArtImg_GXI'] != NULL)
								   			{
								   				$nombre = Str_replace('gxdbfile:','',$pro['ArtImg_GXI']);
								   				$urlImg = 'http://192.168.1.56:8080/MantisWeb20erpappweb22/PublicTempStorage/multimedia/'.$nombre;
								   				Image::make($urlImg)->resize(300, null, function ($constraint) {$constraint->aspectRatio();})->save(public_path().'/img/Mantis/'.$nombre);
								   				//$urlImg = $this->urlMantis.$nombre;
								   				$prod->img = 'img/Mantis/'.$nombre;


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

										
										$Nombre = strtolower($pro['ArtNom']);
										$Nombre = utf8_encode($Nombre);
										$artnom = utf8_encode($pro['ArtNom']);
										$VarSlug = Str::slug($Nombre);
										
										$prod->id_mantis = $pro['ArtCod'];
										//$prod->pro_nom = $pro['artnom'];
										$prod->ArtSec    = $pro['ArtSec'];
										$prod->pro_nom = $artnom;
										//$prod->InvFamCod = $pro['InvFamCod'];


							

										$prod->categoria_id = $pro['InvFamCod'];
										$prod->descripcion	= $pro['ArtFicTec'];
										$prod->slug = $VarSlug;
										
										$prod->precio = $pro['precio3'];
										$prod->por_iva = $pro['parconiva'];
										$prod->cantidad = $pro['saldo'];
										$prod->save();
									}else{
										
										$producto = new Producto;
											if($pro['ArtImg_GXI'] != NULL)
								   			{
								   				$nombre = Str_replace('gxdbfile:','',$pro['ArtImg_GXI']);

								   				$urlImg = 'http://192.168.1.56:8080/MantisWeb20erpappweb22/PublicTempStorage/multimedia/'.$nombre;
								   				Image::make($urlImg)->resizeCanvas(400, 400, null, true, '#fff')->save(public_path().'/img/Mantis/'.$nombre);
								   				$producto->img = 'img/Mantis/'.$nombre;
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
										$Nombre = strtolower($pro['ArtNom']);
										$Nombre = utf8_encode($Nombre);
										$artnom = utf8_encode($pro['ArtNom']);
										$VarSlug = Str::slug($Nombre);
										
										
										$producto->id_mantis = $pro['ArtCod'];
										$producto->ArtSec    = $pro['ArtSec'];

										//$producto->pro_nom = $pro['artnom'];
										$producto->pro_nom 		= $artnom;
										$producto->categoria_id = $pro['InvFamCod'];
										//$producto->InvFamCod   =  $pro['InvFamCod'];
										$producto->descripcion 	= $prod['ArtFicTec'];
										$producto->slug 		= $VarSlug;
										//$producto->img = 'img/Mantis/'.$filename;
										$producto->precio 		= $pro['precio3'];
										$producto->por_iva 		= $pro['parconiva'];
										$producto->cantidad 	=  $pro['saldo'];;
										$producto->save();
									}
								}#######################END FOREACH

								return Redirect::back()->with('message-alert','Productos Mantis Sincronizado');
	}



	public function syncCateMantis()
	{
			//if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=192.168.1.52,1433;Database=proherp;", 'sa', 'Somic321')){ 
				if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
				//if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=Eder-Pc,1433;Database=erpweb;", 'sa', 'Somic321')){ 
					   	echo "Conectado correctamente"; 
					   	
					        			        $ssql = "select * from InventarioSubgrupo"; 

					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$categorias[] = $info;
								}// END WHILE############################

							} ############END RS_ACCESS##############	
						}###### END IF CON_ACCESS

						//dd($categorias);

						foreach($categorias as $cate)
						{
							$cat = Categoria::where('InvSubGruCod','=',$cate['InvSubGruCod'])->first();
							if($cat)
							{
								$VarSlug = Str::slug($cate['InvSubGruNom']);
								$cat->InvSubGruId = $cate['InvSubGruId'];
								$cat->InvSubGruCod = $cate['InvSubGruCod'];
								$cat->InvGruCod = $cate['InvGruCod'];
								$cat->cat_nom = $cate['InvSubGruNom'];
								$cat->cat_slug = $VarSlug;
								$cat->img = '';

								$cat->save();

							}else
							{
								

								$categoria = new Categoria;
								
								
								$VarSlug = Str::slug($cate['InvSubGruNom']);

						
							

								$categoria->InvSubGruCod = $cate['InvSubGruCod'];
								$categoria->InvSubGruId = $cate['InvSubGruId'];
								$categoria->InvGruCod = $cate['InvGruCod'];
								$categoria->cat_nom = $cate['InvSubGruNom'];
								
								$categoria->cat_slug = $VarSlug;
								$categoria->img = '';

								$categoria->save();
							}
						}

						return Redirect::back()->with('message-alert','Categorias Sincronizadas');
	}



	public function syncFamiliaMantis()
	{
				//if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=Eder-pc,1433;Database=erpweb;", 'sa', 'Somic321')){ 
				  if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
					   	echo "Conectado correctamente"; 
					   	
					        			        $ssql = "select * from InventarioFamilia"; 

					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$familias[] = $info;
								}// END WHILE############################

							} ############END RS_ACCESS##############	
						}###### END IF CON_ACCESS

						//dd($familias);

						foreach($familias as $fam)
						{
							$fami = Familia::where('InvFamCod','=',$fam['InvFamCod'])->first();
							if($fami)
							{
								$NombreFam = strtolower($fam['InvFamNom']);
								$NombreFam = utf8_encode($NombreFam);
								
								$VarSlug = Str::slug($NombreFam);
								//$VarSlug = Str::slug($fam['InvFamNom']);
								$fami->InvFamId = $fam['InvFamId'];
								$fami->InvFamCod = $fam['InvFamCod'];
								$fami->InvFamNom = $fam['InvFamNom'];
								$fami->fam_slug = $VarSlug;
								$fami->fam_InvSubGruCod = $fam['InvSubGruCod'];

								$fami->save();

							}else
							{
								

								$familia = new Familia;
								
								
								$NombreFam = strtolower($fam['InvFamNom']);
								$NombreFam = utf8_encode($NombreFam);
								
								$VarSlug = Str::slug($NombreFam);

						
							

								$familia->InvFamId = $fam['InvFamId'];
								$familia->InvFamCod = $fam['InvFamCod'];
								$familia->InvFamNom = $fam['InvFamNom'];
								$familia->fam_slug = $VarSlug;
								$familia->fam_InvSubGruCod = $fam['InvSubGruCod'];

								$familia->save();
							}
						}

						return Redirect::back()->with('message-alert','Familias Sincronizadas');
	}



	public function syncGrupoMantis()
	{

			//if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=Eder-pc,1433;Database=erpweb;", 'sa', 'Somic321')){ 
			 if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
					   	echo "Conectado correctamente"; 
					   	
					        			        $ssql = "select * from InventarioGrupo"; 

					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$grupos[] = $info;
								}// END WHILE############################

							} ############END RS_ACCESS##############	
						}###### END IF CON_ACCESS

						//dd($grupos);

						foreach($grupos as $gru)
						{
							$grup = Grupo::where('InvGruCod','=',$gru['InvGruCod'])->first();
							if($grup)
							{
								$VarSlug = Str::slug($gru['InvGruNom']);
								$grup->InvGruId = $gru['InvGruId'];
								$grup->InvGruCod = $gru['InvGruCod'];
								$grup->InvGruNom = $gru['InvGruNom'];
								$grup->slug_grupo = $VarSlug;
								

								$grup->save();

							}else
							{
								

								$grupo = new Grupo;
								
								
							$VarSlug = Str::slug($gru['InvGruNom']);

						
							

								$VarSlug = Str::slug($gru['InvGruNom']);
								$grupo->InvGruId = $gru['InvGruId'];
								$grupo->InvGruCod = $gru['InvGruCod'];
								$grupo->InvGruNom = $gru['InvGruNom'];
								$grupo->slug_grupo = $VarSlug;
								

								$grupo->save();
							}
						}

						return Redirect::back()->with('message-alert','Grupos Sincronizadas');
	}








}


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
					   	
					        			        $ssql = " select TOP 1250 a.artsec, a.ArtNom,ArtImg_GXI,a.InvFamCod,a.ArtCod,a.ArtFicTec,parconiva,
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
										if($pro['ArtImg_GXI'] != NULL)
								   			{
								   				$nombre = Str_replace('gxdbfile:','',$pro['ArtImg_GXI']);
								   				$urlImg = $this->urlMantis.$nombre;
								   				$prod->img = $urlImg;
								   			}else
								   			{
								   				$urlImg = 'http://localhost:8000/img/Mantis/def.png';
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
								   				$urlImg = 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/'.$nombre;
								   				$producto->img = $urlImg;
								   			}else
								   			{
								   				$urlImg = 'http://localhost:8000/img/Mantis/def.png';
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


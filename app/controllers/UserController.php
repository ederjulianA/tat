<?php

class UserController extends BaseController {


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

	public function getItems()
	{
		$email = "ederalvarez2091057@gmail.com";
			$empresa = "Megalopolis Inc.";
			$asesor ="ederAAAA";
			$aliado ="Eder A";
			$valor   = 10000;
			$compra = new Compra;
					$compra->user_id 	= 3;
					$compra->totalCart  =   9999;
					$compra->total_compra  =  9999;
					$compra->num_items  =   1;
					$compra->tipo_compra = 	2;
					$compra->vlr_envio   =  2000;
					if($compra->save()){
						foreach (Cart::contents() as $item) {
							
                		Mail::send('emails.auth.noti', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"valor"=>$valor/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$valor,$asesor,$aliado){
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

                }
					}
	}

	public function postNewUser2()
	{
		$validator = Validator::make(Input::all(),
				array(
						'email' 		    => 'required|email|unique:users',
						//'password'		    => 'required|alpha_num|min:6|confirmed',
						'telefono'			=> 'required|numeric|min:7',
						'nombre'			=> 'required',
						'apellido'			=> 'required',
						'NitSec'			=> 'required|unique:users',
						'terminos'			=> 'accepted',
					

					)
			);

		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Errores en el formulario')->withErrors($validator->messages());
		}


		$NitIde = Input::get('NitSec');
		$Nom    = Input::get('nombre');
		$Ape    = Input::get('apellido');
		$dir    = Input::get('dir');
		$FullNom = $Nom.' '.$Ape;

		$tel    = Input::get('telefono');
		$email  = Input::get('email');

		//REGISTRO DE USUARIO EN LA BASE DE DATOS

				$user = new User;
				$user->email  		= Input::get('email');
				$user->password  	= Hash::make(Input::get('password'));
				$user->admin 		= 0;
				$user->condiciones 	= true;
				$user->NitSec       = $NitIde;

				if($user->save())
				{
					$ship = new Shipping;
					$ship->user_id = $user->id;
					$ship->barrio_id = 1;
					$ship->nombre = Input::get('nombre');
					$ship->apellido = Input::get('apellido');
					$ship->nombre_negocio = 'DEFAULT';
					$ship->ciudad =1;
					$ship->canal = 0;
					$ship->direccion = $dir;
					$ship->cedula = $NitIde;
					$ship->comentarios = "Sin comentarios";
					$ship->telefono = Input::get('telefono');
					if($ship->save())
					{
						$remember = (Input::has('remember')) ? true : false;
				//creamos la sesion del usuario
							$auth = Auth::attempt(array(
						'email'  => $user->email,
						'password' => Input::get('password'),
						'active' => 1
					), $remember);

				if($auth){
					if(Auth::user()->admin != 1)

						{
						return Redirect::back();

						}
						else {
							return Redirect::intended('/');
						}
				}else{
					return Redirect::route('login')
					->with('message-alert', 'El email o la contraseña no coinciden, o la cuenta no esta activada');
				}
						return Redirect::back()->with('message-alert','Gracias Por registrarte');
					}
					
				}


	}

	public function postNewUser()
	{

		$validator = Validator::make(Input::all(),
				array(
						'email' 		    => 'required|email|unique:users',
						'password'		    => 'required|alpha_num|min:6|confirmed',
						'telefono'			=> 'required|numeric|min:7',
						'nombre'			=> 'required',
						'apellido'			=> 'required',
						'NitSec'			=> 'required|unique:users',
						'terminos'			=> 'accepted',
					

					)
			);


		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Errores en el formulario')->withErrors($validator->messages());
		}
		//dd(Input::all());
		$NitIde = Input::get('NitSec');
		$Nom    = Input::get('nombre');
		$Ape    = Input::get('apellido');
		$dir    = Input::get('dir');
		$FullNom = $Nom.' '.$Ape;

		$tel    = Input::get('telefono');
		$email  = Input::get('email');

		//TRAEMOS LA SECUENCIA DE NITS
			if ($conn_access = odbc_connect ( "Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
   			echo "Conectado correctamente<br>"; 
   	
       			 $ssql = "select * from Secuencia where SecCod = 'NITS'"; 
   	




				
					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$sec = $info;
								}// END WHILE############################
									$SecNum = $sec['SecNum'];
									$newSecNum = $SecNum +1;
									$StrSecNum = (string)$newSecNum;
									/*ACTUALIZAMOS LA TABLA SECUENCIA*/
										$ssql2 = "update Secuencia set SecNum =$StrSecNum where SecCod='NITS'";
										if($rs_access = odbc_exec ($conn_access, $ssql2)){
												/*CREAMOS EL REGISTRO EN LA TABLA nits*/

													 $ssql3 = "insert into NIT (nitsec ,doccod ,nitide,nitdiv ,    nitpercod ,    nitprinom ,    nitotrnom ,    nitpriape, 
																 nitsegape ,    nitcom ,    nitdir ,    nitciucod ,    nitpun ,    nitpag ,    nitema ,    nitfax ,    nitest     ,nitmaeobr ,
																 nitmaecar ,    nitindcli ,    nitindpro ,    nitindemp ,    nitindeps ,    nitindarl ,    nitindpen ,    nitindces ,
																 nitclisec ,    nitprosig,    nitprorep ,    nitprocup ,    nitpropla ,    progcntip ,    progcncod ,    
																 nitprocom ,nitprocob ,nitprocon ,    protel ,    propordes ,    provestado ,
																 nitactcomcod1 ,nitactcomcod2 ,nitactcomcod3 ,    nitindacr) 
																 values ($SecNum ,    '13' ,  $NitIde ,    '0' ,    'N' , '$Nom' ,  
																 '',   '$Ape', '','$FullNom','$dir',
																 (select top 1 nitCiuCod from Empresa e left join Nit n on e.NitSec=n.NitSec ) ,
																     0 , NULL , NULL , NULL , 'A' ,null ,
																 null ,  'S',  'N' ,'N' ,'N' ,  'N' ,  'N' ,  'N' ,
																 1 ,    '',    '' ,    0 ,    0 ,    null ,    null ,    
																 '' ,'' ,'' ,    '' ,0 ,null, 
																 1 ,1 ,1 ,'N' )";
													if($rs_access = odbc_exec ($conn_access, $ssql3)){
														//dd("NIT CREADO");
																$fecReg = date('d-m-Y');

															//$tel = Input::get('telefono');
															$ssql4  = "INSERT INTO NITNITTEL (nitsec ,nittel,nittip) VALUES ($SecNum ,$tel,'C')";
															if($rs_access = odbc_exec ($conn_access, $ssql4)){
																 $ssql5 = "insert into clientes (nitsec  ,clisec,clinom ,                      clirep ,        clisig ,      clisigimaext,clisigimanom ,    clipag ,    perclicod  ,    cliregmer ,    cencod ,           clidir ,                  climail ,        barcod  ,    tipclicod  ,    cliciucod ,  cobcod  ,    zoncod ,zonrutcod  ,cancod  , cansubcod  ,clifeccum ,    clicup ,    cliconpag ,    lisprecod  ,    cliestsoceco ,  cliest ,    clifecing ,    clirepimaext ,clirepimanom ,    clitel , cligcntip ,    cligcncod ,    cliblocup ,    clibloche ,    cliblomor ,cliblodescob ,    cliblodescobdia     ,cliblocampre ,    cliintord ,    clicamsec ,   clicarocu ,    clicarpro , clicarhob ,    clicarotr ,    clisiniva ,   cligeolocali ,    tricliica ,    tricliicapucsec    ,cliaplred    ,clired) 
				values ( $SecNum  ,'1','$FullNom',   '' ,             '' ,             '',          '' ,            '' ,          2,            '' ,       (Select top 1 CenCod from CentrosPoblados) ,'$dir',  '$email' ,1,            1,            (select top 1 nitCiuCod from Empresa e left join Nit n on e.NitSec=n.NitSec ) ,    1,    1 ,1/*zonrutcod*/  ,1  , 1  ,GETDATE() ,   0 ,    1 ,    3/*lisprecod*/,    99 ,   'A' ,  '$fecReg' ,  '' ,'' ,   '$tel' ,        'C',    1,   '' ,   '' ,  '' ,'' ,    0     ,'O' ,   0 ,  0 ,  '' ,   '' , '' ,   '' ,  'S' , NULL ,  '' ,  NULL    ,''    ,0) 

							";
																		
															/*INSERT CLIENTES VENDEDORES*/
																	if($rs_access = odbc_exec ($conn_access, $ssql5)){

																		$ssql6 = "insert into ClientesVendedores (nitsec,clisec,vencod,CLIVENEST,CliIntLun, CliIntMar, CliIntMie, CliIntJue, CliIntVie, CliInSab, CliIntDom, CliIntFre,HORINICIO) 
						values ($SecNum,1,(SELECT TOP 1 VenCod From Vendedores),'a','N','N','N','N','N','N','N','N',null)";

																			if($rs_access = odbc_exec ($conn_access, $ssql6)){


				$user = new User;
				$user->email  		= Input::get('email');
				$user->password  	= Hash::make(Input::get('password'));
				$user->admin 		= 0;
				$user->condiciones 	= true;
				$user->NitSec       = $NitIde;

				if($user->save())
				{
					$ship = new Shipping;
					$ship->user_id = $user->id;
					$ship->barrio_id = 1;
					$ship->nombre = Input::get('nombre');
					$ship->apellido = Input::get('apellido');
					$ship->nombre_negocio = 'DEFAULT';
					$ship->ciudad =1;
					$ship->canal = 0;
					$ship->direccion = $dir;
					$ship->cedula = $NitIde;
					$ship->comentarios = "Sin comentarios";
					$ship->telefono = Input::get('telefono');
					if($ship->save())
					{
						$remember = (Input::has('remember')) ? true : false;
				//creamos la sesion del usuario
							$auth = Auth::attempt(array(
						'email'  => $user->email,
						'password' => Input::get('password'),
						'active' => 1
					), $remember);

				if($auth){
					if(Auth::user()->admin != 1)

						{
						return Redirect::back();

						}
						else {
							return Redirect::intended('admin');
						}
				}else{
					return Redirect::route('login')
				->with('message-alert', 'El email o la contraseña no coinciden, o la cuenta no esta activada');
				}
						return Redirect::back()->with('message-alert','Gracias Por registrarte');
					}
					
				}
																				die("REGISTRO EN CLIENTES VENDEDRES EXITOSO");

																			}//end if ssql6
																	}


															/**/															
															}
													}

												/**/
										}else{
											dd("ERROR ACTUALIZANDO SECUENCIAS");
											
									/**/
									dd($StrSecNum);
										}
							} ############END RS_ACCESS##############
				} else{ 
				   	echo "Error en la conexión con la base de datos"; 
				} //die( print_r( sqlsrv_errors(), true));



		//FIN TRAEMOS LA SECUENCIA DE NITS



		dd(Input::all());

	}

	public function postUpdateData()
	{

				$datos = Shipping::where('user_id','=',Auth::user()->id)->first();
				if($datos)
				{
						$datos->nombre = Input::get('nombre');
				$datos->apellido = Input::get('apellido');
				$datos->cedula = Input::get('nit');
				$datos->nombre_negocio = Input::get('nom_neg');
				$datos->ciudad = Input::get('ciudad_id');
				$datos->canal = Input::get('canal_id');
				$datos->barrio_id = Input::get('barrio_id');
				$datos->direccion = Input::get('direccion');
				$datos->telefono = Input::get('telefono');
				$datos->comentarios = Input::get('comentarios');

					if($datos->save())
					{
						return Redirect::back()->with('message-alert','Se han actualizado tus datos');
					}	
				dd('actualizado');
				}

				$ship = new Shipping;
				$ship->user_id = Auth::user()->id;
				$ship->nombre = Input::get('nombre');
				$ship->apellido = Input::get('apellido');
				$ship->cedula = Input::get('nit');
				$ship->nombre_negocio = Input::get('nom_neg');
				$ship->ciudad = Input::get('ciudad_id');
				$ship->canal = Input::get('canal_id');
				$ship->barrio_id = Input::get('barrio_id');
				$ship->direccion = Input::get('direccion');
				$ship->telefono = Input::get('telefono');
				$ship->comentarios = Input::get('comentarios');
					if($ship->save())
					{
						return Redirect::back()->with('message-alert','Se han creado tus datos');
					}
		

		
	}

	public function postLoginCheckout()
	{
		$validator = Validator::make(Input::all(),
				array(
						'email' 		    => 'required|email|unique:users',
						'password'		    => 'required|alpha_num|min:6|confirmed',
						
					

					)
			);


		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Errores en el formulario')->withErrors($validator->messages());
		}

		$user = new User;
		$user->email  		= Input::get('email');
		$user->password  	= Hash::make(Input::get('password'));
		$user->admin 		= 0;
		$user->condiciones 	= true;

		if($user->save())
		{
						  $remember = (Input::has('remember')) ? true : false;
				//creamos la sesion del usuario
				$auth = Auth::attempt(array(
						'email'  => $user->email,
						'password' => Input::get('password'),
						'active' => 1
					), $remember);

				if($auth){
					if(Auth::user()->admin != 1)

						{
						return Redirect::back();

						}
						else {
							return Redirect::intended('admin');
						}
				}else{
					return Redirect::route('login')
				->with('message-alert', 'El email o la contraseña no coinciden, o la cuenta no esta activada');
				}
		}
	}




	//ACTUALIZAR PRECIO DE ARTICULO


		public  function getPrice($id)
		{
				 if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=".$this->server.",1433;Database=".$this->db.";", ''.$this->user.'', ''.$this->pass.'')){ 
					   	//echo "Conectado correctamente"; 
					   	if(!$conn_access)
					   	{
					   		dd("ERROR");
					   	}
					   	
					        			        $ssql = "select a.artsec,parconiva,a.ArtCod,
0 precio1,0 precio2,
cast(isnull((p3.PrePreFijVal),0)/(1-((isnull(p3.preporval,0))/100)) as int) precio3,

  replace(replace(replace(SG.InvSubGruCod,'S',''),'G',''),'0','99') InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
 from Kardex  k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec ),0) saldo
 from articulos a   
 left join PreciosDetalle p3 on p3.ArtSec=a.ArtSec and  p3.LisPreCod=3
 
 left join PresentacionArticulos pres on pres.preartcod=p3.preartcod
 left join ParametroContable p on p.parconcod=a.ParConCod
 left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
 where a.ArtCod = '$id' and artdes='N'"; 

					   	if($rs_access = odbc_exec($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;

					   			$art = $info;
								}// END WHILE############################

								$actProducto = $this->producto->actProd($art,$id);
								if($actProducto == 1)
								{
									$iva = $art['parconiva'];
									$precio = $art['precio3'];
									$np     = $precio + (($precio*$iva)/100);
									return round($np);
								}
								
								

							} ############END RS_ACCESS##############	
						
						}###### END IF CON_ACCESS
						else{
							dd("ERROR DE CONEXION");
						}
		}


	
}
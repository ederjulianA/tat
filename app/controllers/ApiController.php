<?php

class ApiController extends BaseController {

	public function banerEdit()
	{
		if( isset($_REQUEST['id']) && isset($_REQUEST['pos'])){
			$id  = $_REQUEST['id'];
			$pos  = $_REQUEST['pos'];
			$ban = Banner::where('id','=',$id)->first();
				if($ban){
					$ban->pos = $pos;
					if($ban->save()){
						$estado = array('estado'=>'1','msg'=>'Editado');

					}else{
						$estado = array('estado'=>'2','msg'=>'Error guardando');
					}
				}else{
					$estado = array('estado'=>'3','msg'=>'No se encontró el banner');
				}

		}else{
			$estado = array('estado'=>'4','msg'=>'Error de parametros');
		}

		return Response::json(array('estado'=>$estado));


	}


	public function activo()
	{
		if( isset($_REQUEST['id']) && isset($_REQUEST['cb']))
		{
			$id  = $_REQUEST['id'];
			$cb  = $_REQUEST['cb'];

			$ban = Banner::where('id','=',$id)->first();
			if($ban){
					if($cb=== "true")
						{
							$ban->activo = 1;
						}else
						{
							$ban->activo = 0;
						}


						if($ban->save()){
							$estado = array('estado'=>'1','ban'=>$cb);
						}else{
							$estado = array('estado'=>'2','msg'=>'An error ocured saving the banner');
						}

			}else{
				$estado = array('estado'=>'3','msg'=>"error finding the banner");

			}

			
	}else{

	}
	return Response::json(array('estado'=>$estado));
}


	public function mail()
	{
		$email = "ederalvarez2091057@gmail.com";
			$empresa = "Megalopolis Inc.";
			$asesor ="ederAAAA";
			$aliado ="mi aliado";
			$valor   = 10000;
			$compra = Compra::where('id','=', 55)->first();
				$compra->estado_id = 2;
				$compra->pay_status = 1;
		Mail::send('emails.auth.noti', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"compra"=>$compra/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$compra,$asesor,$aliado){
						$message->to($email, $aliado)->subject('Venta cerrada');
					});
	}

	public function mail2()
	{

		$email = "ederalvarez2091057@gmail.com";
			$empresa = "Megalopolis Inc.";
			$asesor ="ederAAAA";
			$aliado ="mi aliado";
			$valor   = 10000;
		Mail::send('emails.auth.noti', array('compra'=>$compra, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$asesor,$compra){
						$message->to($email, $aliado)->subject('Compra aprobada');
					});
	}


	public function noti()
	{
		if(isset($_REQUEST['email']) and isset($_REQUEST['empresa']))
		{
			$email  = $_REQUEST['email'];
			$empresa  = $_REQUEST['empresa'];
			$valor    = (int)$_REQUEST['valor'];
			$asesor   = $_REQUEST['asesor'];
			$aliado   = $_REQUEST['aliado'];

			/*$men =new  Mensaje();
			$men->email = $email;
			$men->empresa = $empresa;
			$men->save();*/

			
		}else{
			$email = "ederalvarez2091057@gmail.com";
			$empresa = "Megalopolis Inc.";
			$asesor ="ederAAAA";
			$aliado ="mi aliado";
			$valor   = 10000;

		}
		$data[] = array($email,$empresa);

		Mail::send('emails.auth.noti', array('aliado'=>$aliado, 'asesor'=>$asesor, 'empresa' => $empresa,"email"=>$email,"valor"=>$valor/*URL::route('mega-perfil')*/), function($message) use ($email,$empresa,$valor,$asesor,$aliado){
						$message->to($email, $aliado)->subject('Venta cerrada');
					});

		return Response::json(array("estado"=>1));
	}

	public function getPagos()
	{
		$pagos = Mpagos::all();
		return Response::json(array('pagos'=>$pagos));
	}

	public function getBans()
	{
		$b = Banner::where('id','>',0)->get();

		return Response::json(array('banners'=>$b));
	}

	public function pagoNuevo()
	{
		$p = new Mpagos();
         $p->TipPagNom = Input::get('TipPagNom');
         $p->save();
		//dd(Input::get('text'));
		
	}




	public function addFav()
	{
		if(isset($_REQUEST['idUser']) and isset($_REQUEST['idArt']))
		{
			$idUse = $_REQUEST['idUser'];
			$idArt = $_REQUEST['idArt'];


		}else{
			$idUse = 1;
			$idArt = "000276";
		}

		$favs = Favs::where('user_id','=',$idUse)->where('art_cod','=',$idArt)->first();

		if($favs){
			$estado = array('estado'=>0,"msg"=>"El articulo ya se ha agregado");
			return Response::json($estado);
		}else{

			$favs = new Favs();
			$favs->user_id = $idUse;
			$favs->art_cod = $idArt;
			if($favs->save()){
				$estado = array('estado'=>1,"msg"=>"Agregado a favoritos");
			return Response::json($estado);	
			}
			

		}
	}




	public function android()
	{
		/*if (isset($_POST['data']) and isset($_POST['info']))
		{
			$dato = $_POST['data'];
			$info = $_POST['info'];
			echo $data."\n".$info;
		}else
		{
			echo"NOTHING TO SHOW";
		}*/

		if(!isset($_REQUEST['precio']))
		{
			$precio = 100000;
			
			
		}else{
					$precio = $_REQUEST['precio'];
					
					
		}
		$productos = DB::table('productos as p')
							->select(
									'p.pro_nom',
									'p.precio',
									'p.img',
									'p.id_mantis'
								)->orderBy(DB::raw('RAND()'))->where('p.precio','<=',$precio)->get();

							//dd($productos);

							


							

							return Response::json($productos);
		
	}

	public function getCategorias()
	{
		$categorias = DB::table('inventariogrupo as i')->select('i.InvGruCod','i.InvGruNom')->orderBy('i.InvGruNom','asc')->get();

		return Response::json($categorias);
	}

	public function apiLogin()
	{
		if(isset($_REQUEST['email']) && isset($_REQUEST['pass']))
		{
			$ema = $_POST['email'];
			$pass =$_POST['pass'];

			$pago = new Tipopago;
			$pago->TipPagNom = $ema;
			$pago->save();
		}else{
			$ema = "admin@admin.com";
			$pass =  '123456789';
			
		}


		//$user = User::where('email','=',$ema)->first();
		$user = DB::table('users as u')->join('user_datos as ud','ud.user_id','=','u.id')->select('u.*','ud.nombre','ud.apellido','ud.direccion','ud.telefono')->where('email','=',$ema)->first();


		if($user)
		{

			$uPass = $user->password;
			if (Hash::check($pass, $uPass))
			{
 			   // The passwords match...
				$login = array('id'=>$user->id,'email'=>$user->email,'NitSec'=>$user->NitSec,'Nombre'=>$user->nombre,'Apellido'=>$user->apellido);
				//$login = array('id'=>$user->id,'email'=>$user->email);
			return Response::json($login);
				dd("IT MATCH :)");

			}else{
				$login = array('id'=>0,'email'=>'');
				return Response::json($login);
				dd("No it doesnt");
			}
			
				
		}else{


			$login = array('id'=>0,'email'=>'');
				return Response::json($login);
			
		}

	}
}
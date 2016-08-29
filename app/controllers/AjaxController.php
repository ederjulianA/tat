<?php

class AjaxController extends BaseController {

	protected $pro;
	protected $cat;
	protected $envio;

	public function __construct(Producto $pro, Categoria $cat, Envio $envio)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->envio 	= $envio;
	}

	public function urlValMail()
	{
		header('Content-type: text/javascript');
		if(isset($_POST['email']))	
		{
			$email = $_POST['email'];

			$u = User::where('email','=',$email)->first();
			if($u)
			{
					$estado = array('estado'=>'1');
					return Response::json(array('estado'=>$estado,'user'=>$u));
			}else
			{
					$estado = array('estado'=>'2');
					return Response::json(array('estado'=>$estado));
			}
		}
	}

	public function urlSaveArt()
	{
		header('Content-type: text/javascript');
		if(isset($_POST['oPrice']) && isset($_POST['id']) && isset($_POST['saldo'])){
			$id = $_POST['id'];
			//$val = $_POST['nPrice'];
			$saldo = $_POST['saldo'];
			$price = $_POST['oPrice'];
			$pro = Producto::where('ArtSec','=',$id)->first();
			if($pro){
				$pro->valIva  = round($price);
				$pro->cantidad = $saldo;
				if($pro->save()){
					$estado = array('estado'=>'1');
					return Response::json(array('estado'=>$estado));
				}else{
					$estado = array('estado'=>'2');
					return Response::json(array('estado'=>$estado));
				}
			}else{
				$estado = array('estado'=>'3');
					return Response::json(array('estado'=>$estado));

			}
		}
	}

	public function UrlPedTem2()
	{
		header('Content-type: text/javascript');
		if(isset($_POST['key']) && isset($_POST['com_id'])){

			$llave = $_POST['key'];
			$com_id = $_POST['com_id'];
			$compra = Compra::where('id','=',$com_id)->first();
			if($compra)
			{
				$compra->llave = $llave;
				if($compra->save())
				{
					$estado = array('estado'=>'1');
					return Response::json(array('estado'=>$estado));
				}
			}else{
				$estado = array('estado'=>'8','msg'=>"error buscando compra");
				return Response::json(array('estado'=>$estado));
			}

		}else{
			$estado = array('estado'=>'0');
				return Response::json(array('estado'=>$estado));
		}
	}

	public function UrlPedTem()
	{
		header('Content-type: text/javascript');
		if(isset($_POST['key'])){
					$compra = new Compra;
					$compra->user_id 	= Auth::user()->id;
					$compra->totalCart  =   Cart::total();
					$compra->total_compra  =  Cart::total();
					$compra->num_items  =   Cart::totalItems();
					$compra->tipo_compra = 	2;
					$compra->llave        = $_POST['key'];
					$compra->pay_status  = 0;
					$compra->vlr_envio   =  1000;
					$compra->save();

					if ($compra->save())
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
				   			 	$citem->ArtSec 			    =  	$item->ArtSec;
				   			 	$citem->ArtCod   			= 	$item->ArtCod;
				   			 	$citem->valor_total			=	$item->total();

				   			 	$citem->save();

							}
					}

					
				Cart::destroy();
				$estado = array('estado'=>'1');
				return Response::json(array('estado'=>$estado));
		}
	}
	public function getEnvAjax()
	{
		header('Content-type: text/javascript');

		$envios = $this->envio->getEnvios();

		$estado = array('estado'=>'1');
		$num_envios = count($envios);
		if($num_envios > 0){

		 return Response::json(array('estado'=>$estado,'envios'=>$envios));
		}

	}

	public function urlBarriosVajax()
	{
		header('Content-type: text/javascript');
		if (isset($_POST['id_ciudad']))
		{

			$d = Dias::all();
			$b = Barrio::where('ciu_id','=',$_POST['id_ciudad'])->get();
			$estado = array('estado'=>'1');
			$num_barrios = count($b);
			if($num_barrios > 0){

			 return Response::json(array('estado'=>$estado,'b'=>$b,'d'=>$d));
			}

		}
	}


	public function getBarriosAjax()
	{
		header('Content-type: text/javascript');

		if (isset($_POST['id_ciudad']))
		{
			$barrios = Barrio::where('ciu_id','=',$_POST['id_ciudad'])->get();
			$estado = array('estado'=>'1');
			$num_bar = count($barrios);
			if($num_bar != 0){

			 return Response::json(array('estado'=>$estado,'barrios'=>$barrios,'num_bar'=>$num_bar));
			}else{
				$num_bar = 0;
				return Response::json(array('estado'=>$estado,'barrios'=>$barrios,'num_bar'=>$num_bar));
			}
		}else{
			$estado = array('estado'=>'2','msg'=>'ERROR---NO SE ENVIO LA VARIABLE');
			return Response::json(array('estado'=>$estado));
		}
	}

	public function confEliDiasV()
	{
		header('Content-type: text/javascript');

		$diasv = Diabarrio::where('dia_id','>',0)->delete();
		$estado = array('estado'=>'1');
		 return Response::json(array('estado'=>$estado));
	}

	public function addDescriptionAjax()
	{
		header('Content-type: text/javascript');
		if(isset($_POST['cont']) && isset($_POST['id']))
		{
			$detalle = $_POST['cont'];
			$id      = $_POST['id'];

			$producto = Producto::where('id','=',$id)->first();
			if($producto->count())
			{
				$producto->descripcion = $detalle;
				$estado = array('estado'=>'1');

				if($producto->save())
				{
					return Response::json(array('estado'=>$estado));
				}

			}
		}
	}

	public function barrioAjax()
	{
		header('Content-type: text/javascript');

 			if(isset($_POST['id_dia']) && isset($_POST['id_barrio']))
 			{
 				$dia = Diabarrio::where('dia_id','=',$_POST['id_dia'])->where('barrio_id','=',$_POST['id_barrio'])->first();
 				if($dia->delete())
 				{
 					$estado = array('estado'=>'1');
 				return Response::json(array('estado'=>$estado));
 				}
 			}
	}

	public function barrioAjaxSearch()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['bar_nom']))
		{
			$barrio = $_POST['bar_nom'];

			$bar = Barrio::where('bar_nom', 'LIKE', '%'.$barrio.'%')->get();
			$num_bar = count($bar);
			$estado = array('estado'=>'1');
 			return Response::json(array('estado'=>$estado,'bar'=>$bar,'num_bar'=>$num_bar));

		}
	}


	public function barrioAjaxNo()
	{
		header('Content-type: text/javascript');

 			if(isset($_POST['id_dia']) && isset($_POST['id_barrio']))
 			{
 				$dia = new Diabarrio;
 				$dia->dia_id = $_POST['id_dia'];
 				$dia->barrio_id = $_POST['id_barrio'];
 				if($dia->save())
 				{
 					$estado = array('estado'=>'1');
 				return Response::json(array('estado'=>$estado));
 				}
 			}
	}


	public function getDias()
	{
		header('Content-type: text/javascript');

 			if(isset($_POST['barrio_id']) )
 			{
 				$barrio = Barrio::where('id','=',$_POST['barrio_id'])->first();
 				$diasv  = DB::table('dia_barrio as db')->join('dias as d','db.dia_id','=','d.id')
 							->select(
 									'd.dia_nom',
 									'd.id'
 								)->where('db.barrio_id','=',$barrio->id)->orderBy('d.dia_nom','ASC')->get();
 				$estado = array('estado'=>'1');
 				return Response::json(array('estado'=>$estado,'barrio'=>$barrio,'diasv'=>$diasv));
 			}
	}

	public function  confAjax()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['id_pedido']) && isset($_POST['c']))
		{
			//return Response::json($_POST['c']);
			//$estado = array($_POST['id_pedido'],$_POST['isChecked']);

			/*if($_POST['c']== false)
			{
					$compra = Compra::where('id','=',$_POST['id_pedido'])->first();
					$compra->conf = false;
					$compra->save();
					return Response::json($compra);

			}


			if($_POST['c']== true)
			{
				$estado = "eder";
				return Response::json($estado);
			}*/
			//return Response::json($estado);
			//($check = $_POST['c'];
			
			

			/*if($_POST['c'] == false){
				$compra = Compra::where('id','=',$_POST['id_pedido'])->first();
				$compra->conf = false;
				$compra->estado_id =1;
				if($compra->save())
				{
					
					$estado = array('estado'=>'1');
 					return Response::json(array('estado'=>$estado,'compra'=>$compra));	
				}
			}*/
			
			if($_POST['c'] == true)
			{

				$compra = Compra::where('id','=',$_POST['id_pedido'])->first();
				$compra->conf = true;
				$compra->estado_id =2;
						
				if($compra->save())
				{
					$estado = array('estado'=>'1');
 					return Response::json(array('estado'=>$estado,'compra'=>$compra));	
				}
				
			}

		}
	}


	public function confAjaxf()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['id_pedido']))
		{
			$compra = Compra::where('id','=',$_POST['id_pedido'])->first();
				$compra->conf = false;
				$compra->estado_id =1;
				if($compra->save())
				{
					$estado = array('estado'=>'1');
 					return Response::json(array('estado'=>$estado,'compra'=>$compra));	
				}
		}
	}

	public function CarroAjax()
	{
		header('Content-type: text/javascript');

			if(isset($_POST['id_pro']) && isset($_POST['identifier']) && isset($_POST['cantidad']))
			{
					$producto = Producto::where('ArtSec','=',$_POST['id_pro'])->first();
					if($producto->count())
					{
						 
						 			$item = Cart::item($_POST['identifier']);
						 			$nuevaCantidad = $_POST['cantidad'];
						 			$item->quantity = $nuevaCantidad;

						 			$estado = array('estado'=>'1','itemTotal'=>$item->total(),'itemTotalTax'=>$item->total(false),'totalCart'=>Cart::total(),'totalCartTax'=>Cart::total(false));
 									return Response::json(array('estado'=>$estado,'item'=>$item));
						
					}
			}
	}

	public function addcartAjax()
	{
			header('Content-type: text/javascript');

 			if(isset($_POST['id_producto']) && isset($_POST['cantidad']))
 			{
 				$producto = Producto::where('id','=',$_POST['id_producto'])->first();
 					if($producto->count())
 					{
 						Cart::insert(array(
						'id'=>$producto->id,
						'name' => $producto->pro_nom,
						'price' => $producto->precio,
						'quantity' => Input::get('cantidad'),
						'tax'=>$producto->por_iva,
						'ArtSec'=> $producto->ArtSec,
						'ArtCod'=> $producto->id_mantis,
						'conIva'=> $producto->precio + (($producto->precio * $producto->por_iva)/100),
						'image' => $producto->img
						));
						$estado = array('estado'=>1,'mensaje'=>'Producto agregado','totalCart'=>Cart::total());

						return Response::json(array('estado'=>$estado,'producto'=>$producto));
 					}
 			}
	}
}
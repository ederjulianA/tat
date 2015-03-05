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
					$producto = Producto::where('id','=',$_POST['id_pro'])->first();
					if($producto->count())
					{
						 
						 			$item = Cart::item($_POST['identifier']);
						 			$nuevaCantidad = $_POST['cantidad'];
						 			$item->quantity = $nuevaCantidad;

						 			$estado = array('estado'=>'1','itemTotal'=>$item->total(),'totalCart'=>Cart::total());
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
						
						'image' => $producto->img
						));
						$estado = array('estado'=>1,'mensaje'=>'Producto agregado','totalCart'=>Cart::total());

						return Response::json(array('estado'=>$estado,'producto'=>$producto));
 					}
 			}
	}
}
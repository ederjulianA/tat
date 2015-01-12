<?php

class AjaxController extends BaseController {

	protected $pro;
	protected $cat;

	public function __construct(Producto $pro, Categoria $cat)
	{
			$this->pro = $pro;
			$this->cat = $cat;
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
						
						'image' => $producto->img
						));
						$estado = array('estado'=>1,'mensaje'=>'Producto agregado','totalCart'=>Cart::total());

						return Response::json(array('estado'=>$estado,'producto'=>$producto));
 					}
 			}
	}
}
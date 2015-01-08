<?php

class AjaxController extends BaseController {

	protected $pro;
	protected $cat;

	public function __construct(Producto $pro, Categoria $cat)
	{
			$this->pro = $pro;
			$this->cat = $cat;
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
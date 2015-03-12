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

	public function getLoadProductos()
	{
		$productos = Producto::all();

		return View::make('load.productos',compact('productos'));
	}

	public function urlAddProd()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['idPedido']) and isset($_POST['idArt']))
		{
			$pedido   = Compra::where('id','=',$_POST['idPedido'])->first();
			$producto = Producto::where('id','=',$_POST['idArt'])->first();
			$estado = array('estado'=>'1');

			return Response::json(array('estado'=>$estado,'pedido'=>$pedido,'producto'=>$producto));
		}
		

	}
}

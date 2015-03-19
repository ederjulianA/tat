<?php

class BuscadorController extends BaseController {

	protected $producto;
	protected $cat;
	protected $barrio;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
	}

	public function getBuscador()
	{
		$keyword = Input::get('keyword');

		$dia     = 1;
		
		$productos = $this->producto->getProBuscador($keyword);

		$categorias =   $this->cat->getAllCat();
		
		return View::make('catalogo.Buscador')->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());


	}
}
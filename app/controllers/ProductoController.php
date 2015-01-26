<?php

class ProductoController extends BaseController {

	protected $pro;
	protected $cat;

	public function __construct(Producto $pro, Categoria $cat)
	{
			$this->pro = $pro;
			$this->cat = $cat;
	}

	public function getProducto($slug)
	{
		$categorias =   $this->cat->getAllCat();
		$producto 	=	$this->pro->getProducto($slug);
		return View::make('catalogo.producto')->with('categorias',$categorias)->with('producto',$producto)->with('products', Cart::contents());
	}
}
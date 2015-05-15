<?php

class ProductoController extends BaseController {

	protected $pro;
	protected $cat;
	protected $promo;

	public function __construct(Producto $pro, Categoria $cat, Promo $promo)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->promo 	= $promo;
	}

	public function getProducto($slug)
	{
		$categorias =   $this->cat->getAllCat();
		$producto 	=	$this->pro->getProducto($slug);
		$promo      =   $this->promo->getPromo();

		return View::make('catalogo.producto')->with('promo',$promo)->with('categorias',$categorias)->with('producto',$producto)->with('products', Cart::contents());
	}
}
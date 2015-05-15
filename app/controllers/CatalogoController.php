<?php

class CatalogoController extends BaseController {

	protected $pro;
	protected $cat;
	protected $promo;

	public function __construct(Producto $pro, Categoria $cat, Promo $promo)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->promo 	= $promo;
	}

	public function getCatalogo()
	{
		$categorias =   $this->cat->getAllCat();
		$productos 	=	$this->pro->getAllPro();
		$promo      =   $this->promo->getPromo();
		return View::make('catalogo.index')->with('categorias',$categorias)->with('promo',$promo)->with('productos',$productos)->with('products', Cart::contents());
	}

	public function getCategoria($id)
	{
		$categorias =   $this->cat->getAllCat();
		$productos = $this->pro->getProCategorias($id);
		return View::make('catalogo.categoria')->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());
	}
}
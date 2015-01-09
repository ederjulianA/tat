<?php

class CatalogoController extends BaseController {

	protected $pro;
	protected $cat;

	public function __construct(Producto $pro, Categoria $cat)
	{
			$this->pro = $pro;
			$this->cat = $cat;
	}

	public function getCatalogo()
	{
		$categorias =   $this->cat->getAllCat();
		$productos 	=	$this->pro->getAllPro();
		return View::make('catalogo.index')->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());
	}

	public function getCategoria($id)
	{
		$categorias =   $this->cat->getAllCat();
		$productos = $this->pro->getProCategorias($id);
		return View::make('catalogo.categoria')->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());
	}
}
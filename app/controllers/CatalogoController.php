<?php

class CatalogoController extends BaseController {

	protected $pro;
	protected $cat;
	protected $promo;
	protected $grupo;

	public function __construct(Producto $pro, Categoria $cat, Promo $promo, Grupo $grupo)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->promo 	= $promo;
			$this->grupo 	= $grupo;
	}

	public function getCatalogo()
	{
		
		$productos 	=	$this->pro->getAllPro();
		$promo      =   $this->promo->getPromo();
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias = $this->cat->getAllCat();
		return View::make('catalogo.index')->with('grupos',$grupos)->with('categorias',$categorias)->with('promo',$promo)->with('productos',$productos)->with('products', Cart::contents());
	}

	public function getCategoria($id)
	{
		$categorias = $this->cat->getAllCat();
		$productos = $this->pro->getProCategorias($id);
		$promo      =   $this->promo->getPromo();
		$grupos		=   $this->grupo->getAllGrupos();
		return View::make('catalogo.categoria')->with('grupos',$grupos)->with('promo',$promo)->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());
	}
}
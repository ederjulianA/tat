<?php

class BuscadorController extends BaseController {

	protected $producto;
	protected $cat;
	protected $barrio;
	protected $promo;
	protected $grupo;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio, Promo $promo, Grupo $grupo)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->promo 		= $promo;
		$this->grupo        = $grupo;
	}

	public function getBuscador()
	{
		$keyword = Input::get('keyword');

		$dia     = 1;
		
		$productos = $this->producto->getProBuscador($keyword);
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		$promo      =   $this->promo->getPromo();
		
		return View::make('catalogo.Buscador')->with('grupos',$grupos)->with('promo',$promo)->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());


	}
}
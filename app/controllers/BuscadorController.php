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

	public function getBuscador($f,$o)
	{

		$keyword = Input::get('keyword');

		$dia     = 1;
		
		$productos = $this->producto->getProBuscador($keyword,$f,$o);
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		$promo      =   $this->promo->getPromo();
		$menu       =   Menu::all();
		
		return View::make('cotra.buscador')->with('menu',$menu)->with('grupos',$grupos)->with('promo',$promo)->with('categorias',$categorias)->with('productos',$productos)->with('keyword',$keyword)->with('products', Cart::contents());


	}
}
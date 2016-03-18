<?php

class ProductoController extends BaseController {
	

	protected $pro;
	protected $cat;
	protected $promo;
	protected $grupo;

	public function __construct(Producto $pro, Categoria $cat, Promo $promo,Grupo $grupo)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->promo 	= $promo;
			$this->grupo 	= $grupo;
	}

	public function getProducto($slug)
	{
		$categorias =   $this->cat->getAllCat();
		$producto 	=	$this->pro->getProducto($slug);
		$promo      =   $this->promo->getPromo();
		$grupos     =   $this->grupo->getAllGrupos();
		$menu       = Menu::all();

		return View::make('cotra.detalle')->with('menu',$menu)->with('grupos',$grupos)->with('promo',$promo)->with('categorias',$categorias)->with('producto',$producto)->with('products', Cart::contents());
	}
}
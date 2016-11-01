<?php

class ProductoController extends BaseController {
	

	protected $pro;
	protected $cat;
	protected $promo;
	protected $grupo;
	protected $cara;

	public function __construct(Producto $pro, Categoria $cat, Promo $promo,Grupo $grupo, Caract $cara)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->promo 	= $promo;
			$this->grupo 	= $grupo;
			$this->cara 	= $cara;
	}

	public function getProducto($slug)
	{
		$categorias =   $this->cat->getAllCat();
		$producto 	=	$this->pro->getProducto($slug);
		$promo      =   $this->promo->getPromo();
		$grupos     =   $this->grupo->getAllGrupos();
		$caract     =   $this->cara->getCaract($producto->ArtSec);
		$menu       = Menu::all();

		return View::make('cotra.detalle')->with('menu',$menu)->with('caract',$caract)->with('grupos',$grupos)->with('promo',$promo)->with('categorias',$categorias)->with('producto',$producto)->with('products', Cart::contents());
	}
}
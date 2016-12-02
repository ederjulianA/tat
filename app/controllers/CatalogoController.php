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

		$ord        =   Input::get('ord');

		$keyword    =   Input::get('keyword');
		$productos 	=	$this->pro->getAllPro($ord);
		$promo      =   $this->promo->getPromo();
		$grupos 		=   $this->grupo->getAllGrupos();
		//$menu       = Menu::all();
		$menu       = $this->grupo->getAllGrupos();//Menu::all();
		$categorias = $this->cat->getAllCat();
		
		return View::make('cotra.catalogo',compact('ord','keyword'))->with('menu',$menu)->with('grupos',$grupos)->with('categorias',$categorias)->with('promo',$promo)->with('productos',$productos)->with('products', Cart::contents());
	}

	public function getCategoria($id)
	{

		$ord        =   Input::get('ord');
		$keyword    =   Input::get('keyword');
		$categorias = $this->cat->getAllCat();
		//$productos 	= $this->pro->getProCategorias($id);
		$productos 	= $this->pro->getProCats($id,$ord);
		//$promo      =   $this->promo->getPromo();
		$grupos		=   $this->grupo->getAllGrupos();
		$menu       =  $this->grupo->getAllGrupos();// Menu::all();
		return View::make('cotra.categoria',compact('ord','keyword'))->with('menu',$menu)->with('grupos',$grupos)->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());
	}



}
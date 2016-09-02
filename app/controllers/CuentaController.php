<?php

class CuentaController extends BaseController {
	protected $producto;
	protected $cat;
	protected $user;
	protected $barrio;
	protected $empresa;
	protected $grupo;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio, User $user, Empresa $empresa,Grupo $grupo)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->user 		= $user;
		$this->empresa      = $empresa;
		$this->grupo 		= $grupo;
	}

	public function getDirecciones()
	{
		$user 			= 	Auth::user()->id;
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias 	=   $this->cat->getAllCat();
		$menu       	= 	Menu::all();
		$dir        	= 	UserEnv::where('user_id','=',Auth::user()->id)->get();
		return View::make('cotra.usuario.direcciones',compact('user','menu','dir'))->with('categorias',$categorias)->with('grupos',$grupos)->with('products', Cart::contents());
	}

	public function getIndex()
	{
		$user = Auth::user()->id;
		$shipping = Shipping::where('user_id','=',Auth::user()->id)->first();
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		$pedidos    =	$this->user->getPedidos($user);
		$menu       = Menu::all();
		
		return View::make('cotra.usuario.usuario',compact('user','pedidos','menu','shipping'))->with('categorias',$categorias)->with('grupos',$grupos)->with('products', Cart::contents());
	}

	public function getDetalleCuenta($id)
	{
		$user = Auth::user()->id;
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		$pedido   =	$this->empresa->getPedidoDetalle($id);
		
		
		$items  =	$this->user->getItems($id);
		$menu       = Menu::all();
		
		return View::make('user.detallePedido',compact('user','pedido','items','menu'))->with('grupos',$grupos)->with('categorias',$categorias)->with('products', Cart::contents());
	}
}
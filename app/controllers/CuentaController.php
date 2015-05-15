<?php

class CuentaController extends BaseController {
	protected $producto;
	protected $cat;
	protected $user;
	protected $barrio;
	protected $empresa;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio, User $user, Empresa $empresa)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->user 		= $user;
		$this->empresa      = $empresa;
	}

	public function getIndex()
	{
		$user = Auth::user()->id;
		$categorias =   $this->cat->getAllCat();
		$pedidos    =	$this->user->getPedidos($user);
		
		return View::make('user.index',compact('user','pedidos'))->with('categorias',$categorias)->with('products', Cart::contents());
	}

	public function getDetalleCuenta($id)
	{
		$user = Auth::user()->id;
		$categorias =   $this->cat->getAllCat();
		$pedido   =	$this->empresa->getPedidoDetalle($id);
		$items  =	$this->user->getItems($id);
		
		return View::make('user.detallePedido',compact('user','pedido','items'))->with('categorias',$categorias)->with('products', Cart::contents());
	}
}
<?php

class GeneralesController extends BaseController {

	protected $producto;
	protected $cat;
	protected $barrio;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
	}

	//VISTA ADMIN TIPOS DE ENTREGA
	public function getTipEnt()
	{
		$envios = Envio::all();
		return View::make('tiendo.admin.generales.tipent',compact('envios'));
	}
}
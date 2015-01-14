<?php

class EmpresaController extends BaseController {

	protected $empresa;
	public function __construct(Empresa $empresa)
	{
		$this->empresa = $empresa;
	}

	public function getAdminPedidoDetalle($id)
	{
		$pedido = $this->empresa->getPedidoDetalle($id);
		$items = $this->empresa->getItems($id);
		return View::make('tiendo.admin.adminPedidoDetalle',compact('user','pedido','items'));
	}




	public function getIndex()
	{
		$pedidosYa = $this->empresa->getPedidosYa();
		$pedidosRuta = $this->empresa->getPedidosRuta();
		$user = Auth::user()->id;
		return View::make('tiendo.admin.index',compact('user','pedidosYa','pedidosRuta'));
	}



	public function postConfPedido()

	{
		

		$pedido = Compra::where('id','=',Input::get('pedido_id'))->first();

		if($pedido->count())
		{
			$pedido->estado_id = 2;
			if($pedido->save())
			{
				return Redirect::back()->with('message-alert','Se ha Confirmado el pedido');
			}
		}
		
	}



}
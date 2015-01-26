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


	public function getPedidos()
	{
		$pedidos = $this->empresa->getPedidos();
		return View::make('tiendo.admin.adminPedidos',compact('pedidos'));
	}

	public function getIndex()
	{
		$pedidosYa = $this->empresa->getPedidosYa();
		$pedidosRuta = $this->empresa->getPedidosRuta();
		$user = Auth::user()->id;
		return View::make('tiendo.admin.index',compact('user','pedidosYa','pedidosRuta'));
	}

	public function getBarrios()
	{
		$user = Auth::user()->id;
		$barrios = $this->empresa->getDiasVis();
		$dias = Dias::lists('dia_nom', 'id');
		$d = Dias::all();
		$b = Barrio::all();
		return View::make('tiendo.admin.barrios',compact('user','barrios','dias','d','b'));
	}


	public function addDia()
	{
		$diabarrio = Diabarrio::where('barrio_id','=',Input::get('barrio_id'))->where('dia_id','=',Input::get('ndia'))->first();
			if($diabarrio)
			{
				return Redirect::back()->with('message-alert','El día que intentaste agregar ya ha sido asignado al barrio');
			}
			else{	
			$ndia = new Diabarrio;
			$ndia->dia_id = Input::get('ndia');
			$ndia->barrio_id =Input::get('barrio_id');
				if($ndia->save())
				{
					return Redirect::back()->with('message-alert','Se ha agregado el nuevo día de visita');
				}
			}	
	}

	public function deleteDay()
	{
		$diabarrio = Diabarrio::where('barrio_id','=',Input::get('barrio_id'))->where('dia_id','=',Input::get('dia_id'))->first();
		if($diabarrio->count())
		{
			$diabarrio->delete();
			return Redirect::back()->with('message-alert','Se ha Eliminado el día de visita');
		}
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
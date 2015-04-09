<?php

class EmpresaController extends BaseController {

	protected $empresa;
	protected $pro;
	public function __construct(Empresa $empresa, Producto $pro)
	{
		$this->empresa = $empresa;
		$this->pro 	   = $pro;	
	}

	public function getAdminPedidoDetalle($id)
	{
		$pedido = $this->empresa->getPedidoDetalle($id);
		if(!$pedido)
		{
			return Redirect::to('/admin/pedidos');
		}
		$items = $this->empresa->getItems($id);
		return View::make('tiendo.admin.adminPedidoDetalle',compact('user','pedido','items'));
	}

	public function searchBarrio()
	{
		$barrio = $_GET['bar_nom'];
		$dia = Input::get('dia');
		/*if(isset($_GET['dia']))
		{
			$dia = $_GET['dia'];
		}else
		{
			$dia = null;
		}*/
		$d = Dias::all();
		if($dia != 0)
		{
			$b = DB::table('barrios as b')->join('dia_barrio as dv','dv.barrio_id','=','b.id')->distinct()
			->select(
					'b.id',
					'b.cod',
					'b.ciu_id',
					'b.bar_nom',
					'dv.dia_id'
				)->where('b.bar_nom', 'LIKE', '%'.$barrio.'%')->where('dv.dia_id','=',$dia)->get();
		}else{
			$b = DB::table('barrios as b')
			->select(
					'b.id',
					'b.cod',
					'b.ciu_id',
					'b.bar_nom'
					//'dv.dia_id'
				)->where('b.bar_nom', 'LIKE', '%'.$barrio.'%')->get();

		}
		
		//$b = Barrio::where('bar_nom', 'LIKE', '%'.$barrio.'%')->get();
		return View::make('tiendo.admin.buscarBarrio',compact('d','b'));
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
		$ciudades = Ciudad::all();
		$barrios = $this->empresa->getDiasVis();
		$dias = Dias::lists('dia_nom', 'id');
		$d = Dias::all();
		$b = Barrio::all();
		return View::make('tiendo.admin.barrios',compact('user','barrios','dias','d','b','ciudades'));
	}


	public function getAdminArticulo($id)
	{
		$user = Auth::user()->id;
		$producto = $this->pro->getProductoById($id);
		return View::make('tiendo.admin.productoDetalle',compact('user','producto'));
	}

	public function getProductos()
	{
		$user = Auth::user()->id;
		$productos = $this->pro->getAllPro();
		return View::make('tiendo.admin.productos',compact('user','productos'));
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
			$pedido->conf = true;
			if($pedido->save())
			{
				return Redirect::back()->with('message-alert','Se ha Confirmado el pedido');
			}
		}
		
	}



}
<?php

class EmpresaController extends BaseController {

	protected $empresa;
	protected $pro;
	public function __construct(Empresa $empresa, Producto $pro)
	{
		$this->empresa = $empresa;
		$this->pro 	   = $pro;	
	}


	public function delBan()
	{
		if(isset($_POST['id'])){
			$id = Input::get('id');
			$b = Banner::where('id','=',$id)->first();
			if ($b->delete())
			{
				File::delete($b->img);
				return Redirect::back()->with('msg-alert','Banner eliminado');
			}
		}else{
			dd("ERROR ID");
		}
	}

	public function getPdfPedido($id)
	{
		$pedido = $this->empresa->getPedidoDetalle($id);
		$items = $this->empresa->getItems($id);
		$rt = '';
		foreach ($items as $item) {
			$r = '<tr><td>'.$item->id_producto.'</td> <td>'.$item->nombre.'</td>  <td> '.$item->cantidad.'</td> <td>'.number_format($item->valor_unitario, 0, '', '.').'</td><td>'.$item->iva.'</td> <td>'.number_format($item->valor_total, 0, '', '.').'</td>   </tr>';
			$rt = $rt.$r;
		}
		$html = View::make('pdf.pedido',compact('pedido','items'));
		//dd($items);
		/*$html = 
					'<html>'
					.'<head>'
						.'<title></title>'
						
					.'</head>'
					.'<body >'
					.'<header >'
							.'<div><img src="'.asset('tat/images/product-images/1.jpg').'">  <h1>Pedido TAT</h1></div>'
							.'<div>'.$pedido->nombre.'</div>'
						.'</header><!-- /header -->'
						.'<div> '
						.'<table class="table">'
						.'<tr>'
							.'<th>id</th>'
							.'<th>Detalle</th>'
							.'<th>Cantidad</th>'
							.'<th>Valor Unitario</th>'
							.'<th>Iva</th>'
							.'<th>Valor Total</th>'

						.'</tr>'
						.$rt
					
						.'</table>'
							
						.'</div>'
					.'</body>'
					.'</html>';*/
    		return PDF::load($html, 'A4', 'portrait')->show();
	}

	public function pdfMantis()
	{
			if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=192.168.1.103,1433;Database=erpappweb22proto;", 'sa', 'Somic321')){ 
					   	echo "Conectado correctamente"; 
					   	
					        			        $ssql = " select * from vistarentaarticulo"; 


					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$pros[] = $info;
								}// END WHILE############################

							} ############END RS_ACCESS##############	
						}###### END IF CON_ACCESS	


					

						
		$html = View::make('pdf.mantis',compact('pros'));
		return PDF::load($html, 'A4', 'landscape')->show();
	}

	public function pdfMantis2()
	{
		
		if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=192.168.1.103,1433;Database=erpappweb22proto;", 'sa', 'Somic321')){ 
					   	echo "Conectado correctamente"; 
					   	
					        			        $ssql = "select top 10 * from vistarentaarticulo"; 


					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$pros[] = $info;
								}// END WHILE############################

							} ############END RS_ACCESS##############	
						}###### END IF CON_ACCESS
						$rt = '';
						foreach ($pros as $key => $item) {
							# code...
							
							$r = '<tr><td>'.$item['cod_art'].'</td>  </tr>';
			$rt = $rt.$r;

						}

							$html = 
				'<table class="table"><tr><th>id</th></tr>'.$rt.'</table>';
				

		
		return PDF::load($html, 'A4', 'landscape')->show();
	}

	public function pdfarticulos()
	{
		if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=192.168.1.103,1433;Database=erpappweb22proto;", 'sa', 'Somic321')){ 
					   	echo "Conectado correctamente"; 
					   	
					        			        $ssql = "select  * from vistarentaarticulo"; 


					   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
					   		
					   		while ($info = odbc_fetch_array($rs_access)) {
					 		   //$content[] = $info;
					   			//$ciudades = new Ciudad;
					   			$pros[] = $info;
								}// END WHILE############################

							} ############END RS_ACCESS##############	
						}###### END IF CON_ACCESS	

		//dd($pros);
		define('BUDGETS_DIR', public_path('uploads/budgets')); // I define this in a constants.php file

if (!is_dir(BUDGETS_DIR)){
    mkdir(BUDGETS_DIR, 0755, true);
}

$outputName = str_random(10); // str_random is a [Laravel helper](http://laravel.com/docs/helpers#strings)
$pdfPath = BUDGETS_DIR.'/'.$outputName.'.pdf';
$view = View::make('pdf.articulos',compact('pros'));
File::put($pdfPath, PDF::load($view, 'A4', 'portrait')->output());

		//$$$$$$$$$$$$$$$$$$$$$$$$$$4
		//$html = View::make('pdf.articulos',compact('pros'));
		//return PDF::load($html, 'A4', 'landscape')->show();
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
		//$productos = $this->pro->getAllPro();
		//$productos = Producto::where('id','>',0)->paginate(10);
		/*$q = Producto::query();
		if (Input::has('ArtCod'))
		  {

		     // simple where here or another scope, whatever you like
		     $q->where('id_mantis','like',Input::get('ArtCod'));
		  }
		if(Input::has('ArtNom'))
		{	

			$q->where('pro_nom','like',Input::get('ArtNom'));
		}
		$productos = $q->where('id','>',0)->paginate(10);*/
		$productos = Producto::where('id_mantis', 'LIKE', Input::get('ArtCod').'%')->where('pro_nom', 'LIKE', Input::get('ArtNom').'%')->paginate(10);

		$numPros  = count($productos);
		
		return View::make('tiendo.admin.productos',compact('user','productos','numPros'));
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
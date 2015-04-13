<?php

class Ajax2Controller extends BaseController {

	protected $pro;
	protected $cat;
	protected $envio;

	public function __construct(Producto $pro, Categoria $cat, Envio $envio)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->envio 	= $envio;
	}


	public function urlReparto()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['id_pedido']))
		{
			$idpedido = $_POST['id_pedido'];

			$compra = Compra::where('id','=',$idpedido)->first();
			if($compra)
			{
				$compra->estado_id = 3;
				if($compra->save())
				{
					$estado = array('estado'=>1,'mensaje'=>'Se actualizado el estado del pedido');

					return Response::json(array('estado'=>$estado,'compra'=>$compra));
				}
			}

		}
	}


	public function getLoadProductosSearch($search)
	{
		header('Content-type: text/javascript');

		//$nombre = Input::get('seach');

		$producto = DB::table('productos as p')
			->select(
					'p.id',
					'p.pro_nom',
					'p.slug',
					'p.precio'
					
				)->where('p.pro_nom', 'LIKE', '%'.$search.'%')->get();
		return Response::json($producto);
	}

	public function getLoadProductos()
	{
		$productos = Producto::all();

		return View::make('load.productos',compact('productos'));
	}

	public function urlBuscarProd()
	{
		if(isset($_POST['name']) && $_POST['name'] == null)
		{
			$estado = array('estado'=>'1');
			$pro = Producto::where('id','>',0)->orderBy('id','asc')->get();
			return Response::json(array('estado'=>$estado, 'productos'=>$pro));
		}
		if(isset($_POST['name']))
		{
			$name = $_POST['name'];
			$pro = Producto::where('pro_nom','LIKE','%'.$name.'%')->take(20)->get();
			$estado = array('estado'=>'2');
			return Response::json(array('estado'=>$estado,'productos'=>$pro));

		}
		
	}

	public function urlAddProd()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['idPedido']) and isset($_POST['idArt']))
		{
			$pedido   = Compra::where('id','=',$_POST['idPedido'])->first();
			$producto = Producto::where('id','=',$_POST['idArt'])->first();
			$cant     = $_POST['ctd'];
			if($pedido)
			{
				$pro_pre        =    $producto->precio;
				$pro_iva        =    $producto->por_iva;
				
				if($pro_iva == NULL)
				{
					$totalProducto  = $pro_pre*$cant;
				}else {
					$precioIva   	=	($pro_pre * $pro_iva)/100;
					$totalProducto  =    ($pro_pre + $precioIva)*$cant;
				}
				
				
				
				$pedido->totalCart = $pedido->totalCart + $totalProducto;
				$pedido->total_compra = $pedido->total_compra + $totalProducto;
				$pedido->num_items = $pedido->num_items +$cant;
				if($pedido->save())
				{
					//$estado = array('estado'=>'0');
					//return Response::json($pedido);
					$item = Item::where('compra_id','=',$pedido->id)->where('id_producto','=',$producto->id)->first();
					if($item)
					{
						

						//$producto->compra_id 		=   $pedido->id;
						//$producto->nombre			=	$producto->pro_nom;
						//$producto->image 			=	$producto->img;
						//$producto->valor_unitario	=	$pro_pre;
						//$producto->iva   			=	$pro_iva;

						
						$item->cantidad			=	$item->cantidad +$cant;
						//$producto->id_producto	 	=	$producto->id;
						
						$item->valor_total 		=	$item->valor_total + $totalProducto;

						
						if($item->save()){
							$estado = array('estado'=>'2','mensaje'=>'Se ha guardado el producto');

						return Response::json(array('estado'=>$estado,'pedido'=>$pedido,'producto'=>$producto,'item'=>$item));
						}	
						
					}
					else{
						$item = new Item;
						$item->compra_id 		=   $pedido->id;
						$item->nombre			=	$producto->pro_nom;
						$item->image 			=	$producto->img;
						$item->valor_unitario	=	$pro_pre;
						$item->iva   			=	$pro_iva;
						$item->cantidad			=	$cant;
						$item->id_producto	 	=	$producto->id;
						$precioIva   			=	($pro_pre * $pro_iva)/100;
						$item->valor_total 		=	($pro_pre + $precioIva)*$cant;

						if($item->save()){
							$estado = array('estado'=>'1','mensaje'=>'Se ha creado el nuevo producto');

							return Response::json(array('estado'=>$estado,'pedido'=>$pedido,'producto'=>$producto,'item'=>$item));
						}
						
					}
				}
			}
			
		}
		

	}

	public function urlDeleteProd()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['idPedido']) and isset($_POST['idArt']))
		{
			$pedido   = Compra::where('id','=',$_POST['idPedido'])->first();
			$producto = Producto::where('id','=',$_POST['idArt'])->first();
			$cant     = $_POST['ctd'];
			if($pedido)
			{

				$item = Item::where('compra_id','=',$pedido->id)->where('id_producto','=',$producto->id)->first();
				if($item)
				{
					$pedido->totalCart 		= ($pedido->totalCart	 - $item->valor_total);
					$pedido->total_compra 	= $pedido->total_compra  - $item->valor_total;
					$pedido->num_items		= $pedido->num_items	 - $item->cantidad;

					if($pedido->save())
					{
						$item->delete();

						$estado = array('estado'=>'1');

						return Response::json(array('estado'=>$estado,'pedido'=>$pedido));

					}	

				}
			}
		}
	}

	public function urlSync()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['data']))
		{
			$data = $_POST['data'];
			$dd   = json_decode( json_encode($data,true));


			//$dd = json_decode($data);

			//return Response::json($dd);

			
			//$jsondatas = $_POST['data'];
			//$dataJson = file_get_contents($jsondatas);
			//$data = json_decode($datas,true);
			//$productos = $data->productos;
			//$productos = $datas->productos;

			//return Response::json($dd);
			foreach($dd as $d){
				
				foreach ($d as $a)
				{
					$pro = Producto::where('id_mantis','=',$a->id)->first();
						if($pro)
						{
							$pro->pro_nom 		= $a->nombre;
							$pro->categoria_id 	= $a->categoria;
							$pro->descripcion  	= $a->descripcion;
							$pro->slug         	= $a->slug; 
							$pro->img   		= 'http://tiendo.co/'.$a->imagen;
							$pro->precio       	= "1000";
							$pro->por_iva      	= null;
							$pro->cantidad     	= "90";
							$pro->save();
							/*if($pro->save())
							{
								return Response::json(array('pro'=>$pro));
							}*/
							
						}
						else
						{
							$producto = new Producto;
							$producto->id_mantis    = $a->id;
							$producto->pro_nom      = $a->nombre;
							$producto->categoria_id = $a->categoria;
							$producto->descripcion  = $a->descripcion;
							$producto->slug         = $a->slug; 
							$producto->img   		= 'http://tiendo.co/'.$a->imagen;
							$producto->precio       = "1000";
							$producto->por_iva      = null;
							$producto->cantidad     = "100";
							$producto->save();
							
							/*if($producto->save())
							{
								return Response::json(array('pro'=>$producto));
							}*/
						}
							
						
					
				}
				
			

			}
			$estado = array('estado'=>1,'msg'=>'Se ha terminado la sincronizacion exitosamente 2');
			return Response::json(array('pro'=>$pro,'estado'=>$estado)); 
		}
	}
}

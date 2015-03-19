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

	public function getLoadProductos()
	{
		$productos = Producto::all();

		return View::make('load.productos',compact('productos'));
	}

	public function urlAddProd()
	{
		header('Content-type: text/javascript');

		if(isset($_POST['idPedido']) and isset($_POST['idArt']))
		{
			$pedido   = Compra::where('id','=',$_POST['idPedido'])->first();
			$producto = Producto::where('id','=',$_POST['idArt'])->first();
			if($pedido)
			{
				$pro_pre        =    $producto->precio;
				$pro_iva        =    $producto->por_iva;
				if($pro_iva == NULL)
				{
					$totalProducto  = $pro_pre;
				}
				$precioIva   	=	($pro_pre * $pro_iva)/100;
				$totalProducto  =    $pro_pre + $precioIva;
				
				$pedido->totalCart = $pedido->totalCart + $totalProducto;
				$pedido->total_compra = $pedido->total_compra + $totalProducto;
				$pedido->num_items = $pedido->num_items +1;
				if($pedido->save())
				{
					//$estado = array('estado'=>'0');
					//return Response::json($pedido);
					$item = Item::where('id_producto','=',$producto->id)->first();
					if($item)
					{
						

						//$producto->compra_id 		=   $pedido->id;
						//$producto->nombre			=	$producto->pro_nom;
						//$producto->image 			=	$producto->img;
						//$producto->valor_unitario	=	$pro_pre;
						//$producto->iva   			=	$pro_iva;

						
						$item->cantidad			=	$item->cantidad +1;
						//$producto->id_producto	 	=	$producto->id;
						
						$item->valor_total 		=	$item->valor_total + $totalProducto;

						$item->save();	
						$estado = array('estado'=>'2');

						return Response::json(array('estado'=>$estado,'pedido'=>$pedido,'producto'=>$producto,'item'=>$item));
					}
					else{
						$item = new Item;
						$item->compra_id 		=   $pedido->id;
						$item->nombre			=	$producto->pro_nom;
						$item->image 			=	$producto->img;
						$item->valor_unitario	=	$pro_pre;
						$item->iva   			=	$pro_iva;
						$item->cantidad			=	1;
						$item->id_producto	 	=	$producto->id;
						$precioIva   			=	($pro_pre * $pro_iva)/100;
						$item->valor_total 		=	$pro_pre + $precioIva;

						$item->save();
						$estado = array('estado'=>'1');

					return Response::json(array('estado'=>$estado,'pedido'=>$pedido,'producto'=>$producto,'item'=>$item));
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
			if($pedido)
			{

				$item = Item::where('id_producto','=',$producto->id)->first();
				if($item)
				{
					$pedido->totalCart 		= $pedido->totalCart	 - $item->valor_total;
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

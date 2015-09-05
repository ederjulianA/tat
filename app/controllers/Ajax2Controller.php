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



	public function UrlLoadPro()
	{
		if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=Eder-pc,1433;Database=erpweb;", 'sa', 'Somic321')){ 
			   	//echo "Conectado correctamente"; 
			   	
			        $ssql = "select top 10 ArtImg_GXI, ArtCod,artsec,artnom,f.InvFamNom,
cast(ArtBalBas*(1+((select LisPreRen from  ListasPrecios where LisPreCod=1) /100)) as int)as precio1,
cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=2) /100)) as int) precio2,
SG.InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
from Kardex k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec),0) saldo
 from articulos a left join ListasPrecios on LisPreCod=1 left join ParametroContable p on p.parconcod=a.ParConCod
left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
"; 
			   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
			   		
			   		while ($info = odbc_fetch_object($rs_access)) {
			 		   //$content[] = $info;
			   			//$ciudades = new Ciudad;
			   			$deps[] = $info;

			   			$Nombre = strtolower($info->artnom);
						$Nombre = utf8_encode($Nombre);
						$VarSlug = Str::slug($Nombre);
			   			if($info->ArtImg_GXI != NULL)
			   			{
			   				$nombre = Str_replace('gxdbfile:','',$info->ArtImg_GXI);
			   				$urlImg = 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/'.$nombre;
			   			}else
			   			{
			   				$urlImg = 'http://localhost:8000/img/Mantis/def.png';
			   			}
			   			
			   			$datos[] = array('ArtCod'=>utf8_encode($info->ArtCod),'ArtSec'=>utf8_encode($info->artsec),'ArtNom'=>utf8_encode($info->artnom),'InvFamNom'=>utf8_encode($info->InvFamNom),'precio1'=>utf8_encode($info->precio1),'InvFamNom'=>utf8_encode($info->InvFamNom),'UrlImg'=>utf8_encode($urlImg),'Slug'=>utf8_encode($VarSlug));
			   			//dd($datos);

			   			//dd($deps);
						}// END WHILE############################

					} ############END RS_ACCESS##############	
			}###### END IF CON_ACCESS
			//dd($deps);
			$estado = array('estado'=>1,'mensaje'=>'Se actualizado el estado del pedido');
		
			//return Response::json(array('text' => ' test'), 200, null, JSON_UNESCAPED_UNICODE);
			return Response::json(array('productos'=>$datos,'estado'=>$estado));
			//dd($deps);
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

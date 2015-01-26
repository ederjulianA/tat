<?php

class CartController extends BaseController {

	protected $producto;
	protected $cat;
	protected $barrio;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
	}


	public function getCart()
	{
		$categorias =   $this->cat->getAllCat();
		return View::make('cart')->with('categorias',$categorias)->with('products', Cart::contents());
	}

	public function getCheckout()
	{
		if(!Cart::contents())
		{
			return Redirect::to('/cart')->with('message-alert','No hay Items en tu pedido');
		}
		$categorias =   $this->cat->getAllCat();
		$barrios = $this->barrio->getAllBarrios();
			
		if(Auth::check())
		{
			$user = User::where('id','=',Auth::user()->id)->first();

			$datos = DB::table('user_datos as ud')->join('barrios as b','ud.barrio_id','=','b.id')
					->select(
					'ud.barrio_id',
					'b.bar_nom AS barrioNombre',
					'ud.direccion',
					'ud.nombre',
					'ud.apellido',
					'ud.telefono',
					'ud.comentarios'
				)->where('ud.user_id','=',$user->id)->first();
			return View::make('checkout')->with('barrios',$barrios)->with('datos',$datos)->with('categorias',$categorias)->with('products', Cart::contents());
		}
		$datos = NULL;

		return View::make('checkout')->with('datos',$datos)->with('barrios',$barrios)->with('categorias',$categorias)->with('products', Cart::contents());
		
	}

	public function postPedido()
	{

		$compra = new Compra;
		$compra->user_id 	=	Auth::user()->id;
		$compra->totalCart  =   Input::get('totalCart');
		$compra->total_compra  =   Input::get('total_compra');
		$compra->num_items  =   Input::get('totalItems');
		$compra->tipo_compra = 	Input::get('tipo_compra');
		$compra->vlr_envio   =  Input::get('vlr_envio_a');
			if($compra->save())
			{
				foreach (Cart::contents() as $item) {
					$citem = new Item;
					$citem->compra_id 			=	$compra->id;

	   			 	$citem->id_producto			=	$item->id;
	   			 	$citem->nombre 				=	$item->name;
	   			 	$citem->valor_unitario 		=	$item->price;
	   			 	$citem->image               =   $item->image;
	   			 	$citem->cantidad 			= 	$item->quantity;
	   			 	$citem->valor_total			=	$item->total();

	   			 	$citem->save();

				}
				Cart::destroy();

				return Redirect::to('/micuenta')->with('message-alert','Se ha hecho la solicitud de tu pedido exitosamente');
				

			}

		dd($compra);

	}



	public function addToCart()
	{
		$validator = Validator::make(Input::all(),
				array(
						'cantidad' => 'required|integer',
						'id_producto' => 'required|integer'
					)
			);

		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Ingresa Valores Validos')->withErrors($validator->messages());
		}

		$producto = Producto::where('id','=',Input::get('id_producto'))->first();
		if($producto->count())
		{
			 if($producto->cantidad > 0 && Input::get('cantidad') <= $producto->cantidad)
			 {
			 			 Cart::insert(array(
				'id'=>$producto->id,
				'name' => $producto->pro_nom,
				'price' => $producto->precio,
				'quantity' => Input::get('cantidad'),
				
				'image' => $producto->img
			));
			 			 return Redirect::back()->with('message-alert','Se ha agregado el producto a tu pedido');
			 }
			 else
			 {
			 	return Redirect::back()->with('message-alert','La cantidad Solicitada no esta disponible');
			 }
		}
	}

	public function updateItem()
	{
		$identifier = Input::get('identifier');
		$validator = Validator::make(Input::all(),
				array(
						'cantidad' => 'required|integer',
						'id_producto' => 'required|integer',
						'identifier'	=>	'required'
					)
			);

		if($validator->fails())
		{
			return Redirect::back()->withInput()->with('message-alert','Ingresa Valores Validos')->withErrors($validator->messages());
		}

		$producto = Producto::where('id','=',Input::get('id_producto'))->first();
		if($producto->count())
		{
			 if($producto->cantidad > 0 && Input::get('cantidad') <= $producto->cantidad && Input::get('cantidad') > 0)
			 {
			 			$item = Cart::item($identifier);
			 			$nuevaCantidad = Input::get('cantidad');
			 			$item->quantity = $nuevaCantidad;
			 			 return Redirect::back()->with('message-alert','Se ha actualizado el producto');
			 }
			 else
			 {
			 	return Redirect::back()->with('message-alert','La cantidad Solicitada no esta disponible');
			 }
		}
	}

	public function getRemoveitem($identifier)
	{
		$item = Cart::item($identifier);
		$item->remove();
		return Redirect::back()->with('message-alert','Se ha eliminado el producto de tu pedido');
	}
}
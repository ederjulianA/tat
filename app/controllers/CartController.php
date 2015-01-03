<?php

class CartController extends BaseController {

	protected $producto;
	protected $cat;

	public function __construct(Producto $producto, Categoria $cat)
	{
		$this->producto = $producto;
		$this->cat = $cat;
	}


	public function getCart()
	{
		$categorias =   $this->cat->getAllCat();
		return View::make('cart')->with('categorias',$categorias)->with('products', Cart::contents());
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
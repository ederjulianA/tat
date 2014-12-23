<?php

class CartController extends BaseController {

	public function getCart()
	{
		return View::make('cart')->with('products', Cart::contents());
	}
}
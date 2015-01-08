<?php


	class Producto extends Eloquent {

		protected $table = 'productos';

		public function category()
		{
			return $this->belongsTo('Categoria');
		}

			//FUNCIONES DE LOS PRODUCTOS
		public function getSome()
		{
			$productos = Producto::where('cantidad','>',0)->orderBy(DB::raw('RAND()'))->take(4)->get();
			return $productos;
		}

		public function getProducto($slug)
		{
			return Producto::where('slug','=',$slug)->first();
		}

		public function getAllPro()
		{
			$productos = Producto::where('cantidad','>',0)->get();

			return $productos;
		}


	}
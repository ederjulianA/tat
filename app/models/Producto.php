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


		public function getProductoById($id)
		{
			$producto = Producto::where('id','=',$id)->first();
			return $producto;
		}

		public function getProCategorias($id)
		{
			$productos = Producto::where('categoria_id','=',$id)->get();
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

		public function getProBuscador($keyword)
		{
			 $productos = DB::table('productos as p')
		 ->join('categorias as c','p.categoria_id','=','c.id')
		 
		 ->select(
				 'c.cat_nom',
				 
				 'p.pro_nom',
				 'p.img',
				 'p.slug',
				 'p.id',
				 'p.precio',
				'p.descripcion AS producto_descripcion'
				 
			 )
		 ->where('p.pro_nom', 'LIKE', '%'.$keyword.'%')->get();
		 
		 
		

			return $productos;
		}


	}
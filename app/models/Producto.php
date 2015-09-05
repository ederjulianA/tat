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
			$productos = Producto::where('id','!=',0)->orderBy(DB::raw('RAND()'))->take(4)->get();
			return $productos;
		}



public function limpiar($String){
    $String = str_replace(array('á','à','â','ã','ª','ä'),"a",$String);
    $String = str_replace(array('Á','À','Â','Ã','Ä'),"A",$String);
    $String = str_replace(array('Í','Ì','Î','Ï'),"I",$String);
    $String = str_replace(array('í','ì','î','ï'),"i",$String);
    $String = str_replace(array('é','è','ê','ë'),"e",$String);
    $String = str_replace(array('É','È','Ê','Ë'),"e",$String);
    $String = str_replace(array('ó','ò','ô','õ','ö','º'),"o",$String);
    $String = str_replace(array('Ó','Ò','Ô','Õ','Ö'),"O",$String);
    $String = str_replace(array('ú','ù','û','ü'),"u",$String);
    $String = str_replace(array('Ú','Ù','Û','Ü'),"U",$String);
    $String = str_replace(array('[','^','´','`','¨','~',']'),"",$String);
    $String = str_replace("ç","c",$String);
    $String = str_replace("Ç","C",$String);
    $String = str_replace("ñ","n",$String);
    $String = str_replace("Ñ","N",$String);
    $String = str_replace("Ý","Y",$String);
    $String = str_replace("ý","y",$String);
     
    /*$String = str_replace("&aacute;","a",$String);
    $String = str_replace("&Aacute;","A",$String);
    $String = str_replace("&eacute;","e",$String);
    $String = str_replace("&Eacute;","E",$String);
    $String = str_replace("&iacute;","i",$String);
    $String = str_replace("&Iacute;","I",$String);
    $String = str_replace("&oacute;","o",$String);
    $String = str_replace("&Oacute;","O",$String);
    $String = str_replace("&uacute;","u",$String);
    $String = str_replace("&Uacute;","U",$String);*/
    return $String;
}


		public function getProductoById($id)
		{
			$producto = Producto::where('id','=',$id)->first();
			return $producto;
		}

		public function getProCategorias($id)
		{
			/*$productos = DB::table('productos as p')->join('categorias as c','c.InvGruCod','=','p.categoria_id')
													->join('')*/
			$productos = Producto::where('categoria_id','=',$id)->paginate(9);
			return $productos;
		}

		public function getProducto($slug)
		{
			return Producto::where('slug','=',$slug)->first();
		}

		public function getAllPro()
		{
			$productos = Producto::where('Estado','=',1)->paginate(18);

			//PRODUCTOS CON QUERY BUILDER

							//######################

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
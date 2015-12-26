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

		public function actProd($art,$id)
		{
			$pro = Producto::where('id_mantis','=',$art['ArtCod'])->first();
			if($pro)
			{
				
				$pro->precio = $art['precio3'];
				$pro->cantidad = $art['saldo'];
				if($pro->save())
				{
					$est = 1;
					return $est;
				}
			}
			
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
			$productos = DB::table('productos as p')->join('inventariofamilia as f','f.InvFamCod','=','p.categoria_id')
													->join('categorias as c','c.InvSubGruCod','=','f.fam_InvSubGruCod')
													->join('inventariogrupo as g','g.InvGruCod','=','c.InvGruCod')
													->select(
															'c.cat_nom',
				 											 'p.id_mantis',
															 'p.pro_nom',
															 'p.img',
															 'p.slug',
															 'p.id',
															 'p.precio',
															 'p.descripcion AS producto_descripcion'
														)->where('g.InvGruCod','=',$id)->paginate(18);
													
			//$productos = Producto::where('categoria_id','=',$id)->paginate(9);
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

		public function getProBuscador($keyword,$f,$o)
		{
			if($f == 'p')
			{
				$filter = 'p.precio';
			}
			$query = explode(" ", $keyword);
			
			$todos = array();
			$ids  = array();
			foreach ($query as $q) {
				$n = count($todos);
				if ($q != ''){

				
					if($todos){
						foreach ($todos as $t) {
							$ids[] = $t; 	
							$productos = DB::table('productos as p')->distinct()->join('inventariofamilia as f','f.InvFamCod','=','p.categoria_id')
				->select(
						'p.id',
						'p.id_mantis',
						'p.pro_nom',
						'p.categoria_id',
						'p.descripcion',
						'p.slug',
						'p.img',
						'p.precio',
						'p.Estado',
						'p.por_iva',
						'p.cantidad',
						'f.InvFamNom',
						'f.InvFamCod'

					)->where('p.pro_nom','REGEXP','[[:<:]]'.$q.'*')->orderBy($filter,$o)->groupBy('p.id')->whereNotBetween('p.id', $ids)->get();
				
							foreach($productos as $p)
							{
								$todos[] = array('id'=>$p->id,'id_mantis'=>$p->id_mantis,'pro_nom'=>$p->pro_nom,'categoria_id'=>$p->categoria_id,'descripcion'=>$p->descripcion,'slug'=>$p->slug,'img'=>$p->img,'precio'=>$p->precio,'Estado'=>$p->Estado,'por_iva'=>$p->por_iva,'cantidad'=>$p->cantidad,'InvFamCod'=>$p->InvFamCod,'InvFamNom'=>$p->InvFamNom);

							}
									}
						
						
					}
				$productos = DB::table('productos as p')->distinct()->join('inventariofamilia as f','f.InvFamCod','=','p.categoria_id')
				->select(
						'p.id',
						'p.id_mantis',
						'p.pro_nom',
						'p.categoria_id',
						'p.descripcion',
						'p.slug',
						'p.img',
						'p.precio',
						'p.Estado',
						'p.por_iva',
						'p.cantidad',
						'f.InvFamNom',
						'f.InvFamCod'

					)->where('p.pro_nom','REGEXP','[[:<:]]'.$q.'*')->orderBy($filter,$o)->groupBy('p.id')->get();
				
				foreach($productos as $p)
				{
					$todos[] = array('id'=>$p->id,'id_mantis'=>$p->id_mantis,'pro_nom'=>$p->pro_nom,'categoria_id'=>$p->categoria_id,'descripcion'=>$p->descripcion,'slug'=>$p->slug,'img'=>$p->img,'precio'=>$p->precio,'Estado'=>$p->Estado,'por_iva'=>$p->por_iva,'cantidad'=>$p->cantidad,'InvFamCod'=>$p->InvFamCod,'InvFamNom'=>$p->InvFamNom);

				}
				
				/*$productos = DB::table('productos as p')->distinct()->join('inventariofamilia as f','f.InvFamCod','=','p.categoria_id')
				->select(
						'p.id',
						'p.id_mantis',
						'p.pro_nom',
						'p.categoria_id',
						'p.descripcion',
						'p.slug',
						'p.img',
						'p.precio',
						'p.Estado',
						'p.por_iva',
						'p.cantidad',
						'f.InvFamNom',
						'f.InvFamCod'

					)->where('p.pro_nom','REGEXP','[[:<:]]'.$q.'*')->groupBy('p.id')->get();
				
				foreach($productos as $p)
				{
					$todos[] = array('id'=>$p->id,'id_mantis'=>$p->id_mantis,'pro_nom'=>$p->pro_nom,'categoria_id'=>$p->categoria_id,'descripcion'=>$p->descripcion,'slug'=>$p->slug,'img'=>$p->img,'precio'=>$p->precio,'Estado'=>$p->Estado,'por_iva'=>$p->por_iva,'cantidad'=>$p->cantidad,'InvFamCod'=>$p->InvFamCod,'InvFamNom'=>$p->InvFamNom);

				}*/

			}
		
		}//END FOREACH
			//dd($todos);
			
			/* $productos = DB::table('productos as p')
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
		 ->where('p.id', '=', 269)->get();*/
		 
		 
		 
			//dd($productos);
			return $productos;
		}


	}
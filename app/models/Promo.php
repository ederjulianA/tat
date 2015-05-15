<?php


	class Promo extends Eloquent {

		protected $table = 'promociones';
		protected $fillable = array('titulo', 'descripcion','valor', 'img','imgC');

	

		public function getPromo()
		{
			$promo = DB::table('promociones as p')->select(
				'p.titulo',
				'p.id',
				'p.imgC',
				'p.valor',
				'p.estado'
				)->where('estado','=',1)->orderBy(DB::raw('RAND()'))->take(1)->get();
			//$promo = Promo::where('estado','=',1)->orderBy(DB::raw('RAND()'))->take(1)->get();
			return $promo;
		}


	
	}
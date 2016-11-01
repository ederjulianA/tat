<?php


	class Caract extends Eloquent {

		protected $table = 'caracteristicas';

		
		public function getCaract($ArtSec){
			$caracteristicas  = Caract::where('ArtSec','=',$ArtSec)->get();
			//dd($caracteristicas);
			return $caracteristicas;
		}
	
	}
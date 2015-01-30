<?php
class Ciudad extends Eloquent {

		protected $table = 'ciudades';



		public function getAllCities()
		{
			return 	Ciudad::lists('ciu_nom','id');
		}

		
	}
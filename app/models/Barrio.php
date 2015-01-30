<?php


	class Barrio extends Eloquent {

		protected $table = 'barrios';


		public function getAllBarrios()
		{
			return 	Barrio::lists('bar_nom','id');
		}

		public function getAllCities()
		{
			return 	Ciudad::lists('ciu_nom','id');
		}

		public function getAllCanales()
		{
			return 	Canal::lists('can_nom','id');
		}

		 public function dias()
		    {
		        return $this->belongsToMany('Dias','dia_barrio','barrio_id','dia_id');
		    }
	}
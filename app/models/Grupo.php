<?php


	class Grupo extends Eloquent {

		protected $table = 'inventariogrupo';


		  public function getAllGrupos()
		  {
		  	$cat = Grupo::where('estado','=',1)->get();
		  	return $cat;
		  }

	
	}
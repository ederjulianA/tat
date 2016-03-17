<?php


	class Grupo extends Eloquent {

		protected $table = 'inventariogrupo';


		  public function getAllGrupos()
		  {
		  	$cat = Grupo::where('estado','=',1)->get();
		  	return $cat;
		  }


		 public function menu()
    {
        return $this->belongsToMany('Menu','menu_inventariogrupo','menu_id','grupo_id');
    }

	
	}
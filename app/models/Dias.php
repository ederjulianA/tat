<?php


	class Dias extends Eloquent {

		protected $table = 'dias';


		 public function barrios()
		    {
		        return $this->belongsToMany('Barrio');
		    }

		//FUNCIONES CON LAS CATEGORIAS

		
	}
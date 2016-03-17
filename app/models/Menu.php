<?php


	class Menu extends Eloquent {

		protected $table = 'menu';

  public function grupo()
		{
			return $this->belongsToMany('Grupo','menu_inventariogrupo');
		}


		//FUNCIONES CON LAS CATEGORIAS

	}
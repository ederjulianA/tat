<?php


	class Categoria extends Eloquent {

		protected $table = 'categorias';

		public function producto()
	{
		return $this->hasMany('Producto');
	}


		//FUNCIONES CON LAS CATEGORIAS

		public function getAllCat()
		{
			return Categoria::all();
		}
	}
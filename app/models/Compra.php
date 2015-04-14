<?php


	class Compra extends Eloquent {

		protected $table = 'compra';
		protected $guarded = array('id');
		protected $fillable = array('nom_metodo', 'tiempo_entrega', 'valor');

		public function estado()
		{
			 return $this->hasOne('Estado');
		}

	
	}
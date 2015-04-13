<?php


	class Compra extends Eloquent {

		protected $table = 'compra';


		public function estado()
		{
			 return $this->hasOne('Estado');
		}

	
	}
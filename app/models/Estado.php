<?php


	class Estado extends Eloquent {

		protected $table = 'estados';


		 public function compra()
		    {
		        return $this->belongsTo('Compra');
		    }

	
	}
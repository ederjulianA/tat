<?php


	class Empresa extends Eloquent {

		protected $table = 'empresas';

		public function user()
		{
			return $this->belongsTo('User');
		}
	}
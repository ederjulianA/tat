<?php
class Envio extends Eloquent {

		protected $table = 'metodo_envio';



		public function getEnvios()
		{
			$envios = Envio::all();
			
			return $envios;
		}
	

		
	}
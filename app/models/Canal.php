<?php
class Canal extends Eloquent {

		protected $table = 'canales';



		public function getAllCanales()
		{
			return 	Ciudad::lists('can_nom','id');
		}

		
	}
<?php
class Conn extends Eloquent {

		protected $table = 'conn';

		public function getParameters()
		{
			$par = Conn::where('id','=',1)->first();

			return $par;
		}

		public function getServer()
		{
			$par = Conn::where('id','=',1)->first();
			return $par->ip;
		}
		
		public function getDb()
		{
			$par = Conn::where('id','=',1)->first();
			return $par->db;
		}
		public function getUser()
		{
			$par = Conn::where('id','=',1)->first();
			return $par->user;
		}
		public function getPass()
		{
			$par = Conn::where('id','=',1)->first();
			return $par->pass;
		}
		public function getUrlImg()
		{
			$par = Conn::where('id','=',1)->first();
			return $par->urlImg;
		}
	}
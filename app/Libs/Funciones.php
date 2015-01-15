<?php

	class Funciones {

		public static  function getCat($id)
		{ 
			$cat = Categoria::where('id','=',$id)->first();
			return $cat->cat_nom;
		}

		public static function tipoPedido($tipo)
		{
			if($tipo == 1)
			{
				$pe = "<p class='alert alert-info'>Entrega ruta Camión TAT Express</p>";
			}else if($tipo == 2)
			{
				$pe = "<p class='alert alert-info'>Entrega Inmediata via mensajero</p>";
			}

			return $pe;
		}


		public static function getDiasV($id)
			{
				$diasV = DB::table('dia_barrio as db')->join('dias as d','db.dia_id','=','d.id')
					->select(
							'd.dia_nom'
						)->where('db.barrio_id','=',$id)->get();

					return $diasV;
			}

		public static function getEstado($id)
		{
			$est = DB::table('estados as e')->select(
					'e.id',
					'e.nom_est'
				)->where('e.id','=',$id)->first();

			if($id == 1)
			{
				$res = "<span class='label label-danger'>".$est->nom_est."</span>";
			}

			if($id == 2)
			{
				$res = "<span class='label label-info'>".$est->nom_est."</span>";
			}

			return $res;
		}


	}
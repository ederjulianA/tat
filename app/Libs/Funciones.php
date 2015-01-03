<?php

	class Funciones {

		public static  function getCat($id)
		{ 
			$cat = Categoria::where('id','=',$id)->first();
			return $cat->cat_nom;
		}
	}
<?php

	class Funciones {
	protected $producto;
	protected $cat;
	protected $barrio;
	protected $conn;
	protected $server;
	protected $db;
	protected $user;
	protected $pass;
	protected $urlMantis;
	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio, Conn $conn)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->conn         = $conn;
		$this->server       = $this->conn->getServer();
		$this->user         = $this->conn->getUser();
		$this->pass         = $this->conn->getPass();
		$this->db           = $this->conn->getDb();
		$this->urlMantis       = $this->conn->getUrlImg();
		
	}

	public static function getSubmenu($id)
	{
		$menu = DB::table('menu_inventariogrupo as m')->join('inventariogrupo as i','i.InvGruCod','=','m.grupo_id')->select('m.id','m.grupo_id','m.menu_id','i.InvGruCod','i.InvGruNom')->where('m.menu_id','=',$id)->get();
		
$html ='';
foreach ($menu as $user)
{
	$html = $html.'<li><a href="/categoria/'.$user->InvGruCod.'">'.$user->InvGruNom.'</a></li>';
    
}


		return $html;
	}

	public static function getCodigos()
	{
		$codigos ="";
		foreach (Cart::contents() as $item) {
			$codigos = $codigos."-".$item->ArtSec.",".$item->id.",".$item->price.",".$item->quantity;

		}
		$porciones = explode("-",$codigos);
		

		return $porciones[0];
	}

		public static  function getCat($id)
		{ 
			//dd($id);
			//$cat = Categoria::where('InvSubGruCod','=',$id)->first();
			$cat = Familia::where('InvFamCod','=',$id)->first();
			//dd($cat->InvFamNom);
			return $cat->InvFamNom;
		}


		public static function getPriceIva($precio,$iva)
		{
			$nval = $precio +(($precio*$iva)/100);
			return $nval;
			dd($nval);
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


		public  static function getCheck($dia_id, $bar_id)
		{
			$dia = Diabarrio::where('dia_id','=',$dia_id)->where('barrio_id','=',$bar_id)->first();
			if(!$dia)
			{
				$est = 0;
				return $est;
			}else
			{
				$est = 1;
				return $est;
			}
		}

		public static function classDia($dia_id, $bar_id)
		{
			$dia = Diabarrio::where('dia_id','=',$dia_id)->where('barrio_id','=',$bar_id)->first();
			if(!$dia)
			{
				$clase = 'noDia';
				return $clase;
			}else
			{
				$clase = 'Dia';
				return $clase;
			}
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
				$res = "<span class='label label-danger' id='estadoP'>".$est->nom_est."</span>";
			}

			if($id == 2)
			{
				$res = "<span class='label label-info' id='estadoP'>".$est->nom_est."</span>";
			}

			if($id == 3)
			{
				$res = "<span class='label label-warning' id='estadoP'>".$est->nom_est."</span>";
			}

			return $res;
		}


	}
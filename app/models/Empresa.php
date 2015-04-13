<?php


	class Empresa extends Eloquent {

		protected $table = 'empresas';

		public function user()
		{
			return $this->belongsTo('User');
		}



		public function getPedidoDetalle($id)
		{
			$pedido = DB::table('compra as c')->join('estados as e','c.estado_id','=','e.id')
											->join('users as u','c.user_id','=','u.id')
											->join('user_datos as ud','ud.user_id','=','u.id')
											->join('barrios as b','ud.barrio_id','=','b.id')
											
			->select(
					'c.id',
		 			'c.totalCart',
		 			'c.total_compra',
		 			'c.num_items',
		 			'c.tipo_compra',
		 			'c.vlr_envio',
		 			'c.conf',
		 			'e.nom_est',
		 			'ud.nombre',
		 			'ud.direccion',
		 			'ud.telefono',
		 			'ud.comentarios',
		 			'ud.barrio_id',
					'ud.apellido',
		 			'c.estado_id',
		 			'u.email',
		 			'b.bar_nom'
		 			
				)->where('c.id','=',$id)->first();

			return $pedido;
		}


		public function getDiasVis()
		{
			/*$dias = DB::table('barrios as b')
									->select(
											
											'b.bar_nom',
											'b.cod',
											'b.id'
										)->distinct()->get();*/
			$barrios = Barrio::where('id','>',0)->get();
				
							

								return $barrios;	
		}




		public function getItems($id)
	{
		$items = DB::table('compra_items as ci')->select(
				'ci.nombre',
		 			'ci.image',
		 			'ci.valor_unitario',
		 			'ci.iva',
		 			'ci.cantidad',
		 			'ci.valor_total',
		 			'ci.id_producto'
				)->where('ci.compra_id','=',$id)->get();
			return $items;
	}

		public function getPedidosYa()
		{
			$pedidosYa = DB::table('compra as c')->join('users as u','c.user_id','=','u.id')
												 ->join('user_datos as ud','ud.user_id','=','u.id')
			->select(
					'ud.nombre',
					'ud.apellido',
					'c.total_compra',
					'c.num_items',
					'c.id'

				)->where('c.tipo_compra','=',2)->where('c.estado_id','=',1)->get();

			return $pedidosYa;
		}

		public function getPedidos()
		{
			$pedidos = DB::table('compra as c')->join('users as u','c.user_id','=','u.id')
												 ->join('user_datos as ud','ud.user_id','=','u.id')
												  ->join('estados as e','c.estado_id','=','e.id')
			->select(
					'ud.nombre',
					'ud.apellido',
					'c.total_compra',
					'c.num_items',
					'c.conf',
					'e.nom_est',
					'c.estado_id',
					'c.id'

				)->get();

			return $pedidos;
		}

		public function getPedidosRuta()
		{
			$pedidosRuta = DB::table('compra as c')->join('users as u','c.user_id','=','u.id')
												 ->join('user_datos as ud','ud.user_id','=','u.id')
												 ->join('estados as e','c.estado_id','=','e.id')
			->select(
					'ud.nombre',
					'ud.apellido',
					'c.total_compra',
					'c.num_items',
					'c.conf',
					'e.nom_est',
					'c.id'

				)->where('c.tipo_compra','=',1)->where('c.estado_id','=',1)->get();

			return $pedidosRuta;
		}
	}
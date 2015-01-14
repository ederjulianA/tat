<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {

	use UserTrait, RemindableTrait;

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users';

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = array('password', 'remember_token');

	public function empresa()
	{
		return $this->hasOne('Empresa');
	}

	public function getPedidos($iduser)
	{
		 $pedidos = DB::table('compra as c')->select(
		 											'c.id',
		 											'c.totalCart',
		 											'c.total_compra',
		 											'c.num_items',
		 											'c.tipo_compra')->where('c.user_id','=',$iduser)->orderBy('c.id','DESC')->get();

		 return $pedidos;
		 									

	}

	public function getDetallePedido($id)
	{
		$pedido = DB::table('compra as c')->join('estados as e','c.estado_id','=','e.id')
			->select(
					'c.id',
		 			'c.totalCart',
		 			'c.total_compra',
		 			'c.num_items',
		 			'c.tipo_compra',
		 			'c.vlr_envio',
		 			'e.nom_est',
		 			'c.estado_id'
		 			
				)->where('c.id','=',$id)->first();

			return $pedido;
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



	

}

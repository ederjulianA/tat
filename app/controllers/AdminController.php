<?php

class 	AdminController extends BaseController {


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
		$this->img          = $this->conn->getUrlImg();
		$this->urlMantis       = $this->conn->getUrlImg();
		
	}


	public function getUsers()
	{
		$users = User::all();
		$numUser = count($users);

		return $numUser;
	}

	public function getOrders()
	{
		$orders = Compra::all();

		return count($orders);
	}


}
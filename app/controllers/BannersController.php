<?php

class 	BannersController extends BaseController {


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


	public function getBanners()
	{
		$user = Auth::user()->id;
		$bans = Banner::where('id','>',0)->get();

		return View::make('tiendo.admin.banners',compact('user','bans'));
	}

	public function addBanner()
	{
				$validator = Validator::make(Input::all(),
				array(
						
						'pos' => 'integer',
						'titulo' => 'required|min:3|max:100',
					
						'img'=> 'image|mimes:jpeg,jpg,bmp,png,gif'
					)
			);

			if($validator->passes())
			{

					$b = new Banner();
					$b->titulo = Input::get('titulo');
					$b->pos = Input::get('pos');
					$b->activo = 1;

					
						$codigoIMG = str_random(13);
						$logo = Input::file('img');
						$filename = date('Y-m-d-H')."-".$codigoIMG."-".$logo->getClientOriginalName();
						Image::make($logo->getRealPath())/*->resize(1250,658)*/->save(public_path().'/cot/img/slider/'.$filename);
						$b->img = 'cot/img/slider/'.$filename;
					if($b->save())
					{
						return Redirect::back()->with('message-success','Banner agregado.');
					}else{
						dd("ERROR");
					}
					
			}else
			{
				return Redirect::back()->withErrors($validator)->withInput()->with('message-alert','Error al crear banner');
			}
	}

	


}
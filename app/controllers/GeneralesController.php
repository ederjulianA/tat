<?php

class GeneralesController extends BaseController {

	protected $producto;
	protected $cat;
	protected $barrio;
	protected $conn;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio, Conn $conn)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->conn         = $conn;
	}


	public function adminServerEdit()
	{
		$par = Conn::where('id','=',Input::get('idPar'))->first();
		if ($par){
			$par->ip = Input::get('ip');
		$par->db = Input::get('db');
		$par->user = Input::get('user');
		$par->pass = Input::get('pass');
		$par->urlImg = Input::get('urlImg');
		if($par->save())
		{
			return Redirect::back()->with('message-alert','Parametros de conexión actualizados, prueba la conexion al ERP');
		}
		}
	}

	public function adminServer()
	{
		
		$par = new Conn;
		$par->ip = Input::get('ip');
		$par->db = Input::get('db');
		$par->user = Input::get('user');
		$par->pass = Input::get('pass');
		$par->urlImg = Input::get('urlImg');
		if($par->save())
		{
			return Redirect::back()->with('message-alert','Servidor configurado, ahora prueba la conexion');
		}
	}

	//VISTA ADMIN TIPOS DE ENTREGA
	public function getTipEnt()
	{
		$envios = Envio::all();
		return View::make('tiendo.admin.generales.tipent',compact('envios'));
	}

	public function getPromociones()
	{
		$envios = Envio::all();
		$promos = Promo::all();
		return View::make('tiendo.admin.generales.promociones',compact('envios','promos'));
	}


	public function getSync()
	{
		$fam      = Familia::all();
		$subG     = Categoria::all();
		$gru      = Grupo::all();
		$art      = Producto::all();
		$AllFam   = count($fam);
		$AllSubG  = count($subG);
		$AllGru   = count($gru);
		$AllArt   = count($art);
		$para     = $this->conn->getParameters();
		//return View::make('tiendo.admin.generales.sync',compact('AllArt','AllGru','AllFam','AllSubG','para'));
		return View::make('tiendo.admin.generales.sync2',compact('AllArt','AllGru','AllFam','AllSubG','para'));
	}




	//FUNCIONES POST

	public function postNewPromo()
	{
		//SI LA PETICION EN DE TIPO POSTresizeCanvas
		if($_POST)
		{
			$imgC = Input::file('imgP');
			$img = Input::file('imgP');
			//SE GENERA LA IMAGEN CROP DE LA PROMOCION
			$codigoIMGc = str_random(13);
			$filenameC = date('Y-m-d-H-m-s')."-Crop-".$codigoIMGc.".jpg";
			Image::make($imgC->getRealPath())->crop(242, 200)->save(public_path().'/img/promos/crop/'.$filenameC);

			//SE GENERA LA IMAGEN COMPLETA PARA LA DESCRIPCION DETALLADA
			$codigoIMG = str_random(13);
			$filename = date('Y-m-d-H-m-s')."-Full-".$codigoIMG.".jpg";
			Image::make($imgC->getRealPath())->heighten(300)->save(public_path().'/img/promos/'.$filenameC);
			$img = 'img/promos/'.$filename;
			$registerData = array(
		        'titulo'    =>    Input::get('titulo'),
		        'valor'		=>    Input::get('valor'),
		        'descripcion'       =>    Input::get('desc'),
		        'imgC'    =>    'img/promos/crop/'.$filenameC,
		        'img'     =>    'img/promos/'.$filename
		    );

		    $promo = Promo::create($registerData);

		    if($promo)
		    {
		    	return Redirect::back()->with('message-alert','Se ha creado la promoción');
		    }
		}
	}
}
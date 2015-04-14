<?php

class Ajax3Controller extends BaseController {

	protected $pro;
	protected $cat;
	protected $envio;

	public function __construct(Producto $pro, Categoria $cat, Envio $envio)
	{
			$this->pro 		= $pro;
			$this->cat 		= $cat;
			$this->envio 	= $envio;
	}

	public function urlTipEnv()
	{
			if(Request::ajax()){
				$registerData = array(
		        'nom_metodo'    =>    Input::get('nom_metodo'),
		        'tiempo_entrega'       =>    Input::get('tiempo_entrega'),
		        'valor'    =>    Input::get('valor')
		    );




				 $rules = array(
				        'nom_metodo'     	=> 'required|min:2|max:100',
				        'tiempo_entrega'     	=> 'required|max:100',
				        'valor'     		=> 	'required'
				    );
				        
				    $messages = array(
				        'required'    	=> 'El campo :attribute es obligatorio.',
				        'min'         	=> 'El campo :attribute no puede tener menos de :min carácteres.',
				        'email'     	=> 'El campo :attribute debe ser un email válido.',
				        'max'         	=> 'El campo :attribute no puede tener más de :min carácteres.',
				        'unique'     	=> 'El email ingresado ya está registrado en la base de datos.',
				        'confirmed' 	=> 'Los passwords no coinciden.'
				    );
				        
				    $validation = Validator::make(Input::all(), $rules, $messages);

				    if ($validation->fails())
				    {
				    	//como ha fallado el formulario, devolvemos los datos en formato json
				    	//esta es la forma de hacerlo en laravel, o una de ellas
						return Response::json(array(
						    'success' => false,
						    'errors' => $validation->getMessageBag()->toArray()
						)); 
				        //en otro caso ingresamos al usuario en la tabla usuarios
				    }else
				    {

				    	 //creamos un nuevo usuario con los datos del formulario
				       /* $envio =  Envio::create(array('nom_metodo'=>Input::get('nom_metodo'), 'tiempo_entrega'=>Input::get('tiempo_entrega'), 'valor'=>Input::get('valor')  ));*/

				       $envio = new Envio;

				       $envio->nom_metodo = Input::get('nom_metodo');
				       $envio->tiempo_entrega =Input::get('tiempo_entrega');
				       $envio->valor = Input::get('valor') ;


				        $envio->save(); 
				        //si se realiza correctamente la inserción envíamos un mensaje
				        //conforme se ha registrado correctamente
				        if($envio)
				        {
				            return Response::json(array(
							    'success' 		=> 	true,
							    'message' 		=> 	'Tipo de entrega creado correctaente',
							    'envio'			=>  $envio
							));
						}
				    }
					}

	}


	public function urlTipEnvDelete()
	{
		if(Request::ajax()){

				if(isset($_POST['idtipent']))
				{
					$envio =Envio::where('id','=',$_POST['idtipent'])->first();
					if($envio)
					{
						$envio->delete();

						return Response::json(array(
								'success' => true,
								'message' => 'Se ha eliminado el metodo de envio'
							));
					}
				}

		}
	}

}
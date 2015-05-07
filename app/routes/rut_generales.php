<?php
	
	// Crear nuevos tipos de entrega 
	 Route::get('admin/generales/tipoentrega', array('as' => 'adminTipEnt', 'uses' => 'GeneralesController@getTipEnt'));


	 //CREACION DE PROMOCIONES
	 Route::get('admin/generales/promociones', array('as' => 'adminpromociones', 'uses' => 'GeneralesController@getPromociones'));

	 //RUTAS POST
	 Route::post('postNewPromo', array('as' => 'postNewPromo', 'uses' => 'GeneralesController@postNewPromo'));


	 //RUTAS AJAX
	 Route::post('urlTipEnv', array('as' => 'urlTipEnv', 'uses' => 'Ajax3Controller@urlTipEnv'));
	 Route::post('urlTipEnvDelete', array('as' => 'urlTipEnvDelete', 'uses' => 'Ajax3Controller@urlTipEnvDelete'));


?>
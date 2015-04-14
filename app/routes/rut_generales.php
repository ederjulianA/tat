<?php
	
	// Crear nuevos tipos de entrega 
	 Route::get('admin/generales/tipoentrega', array('as' => 'adminTipEnt', 'uses' => 'GeneralesController@getTipEnt'));



	 //RUTAS AJAX
	 Route::post('urlTipEnv', array('as' => 'urlTipEnv', 'uses' => 'Ajax3Controller@urlTipEnv'));
	 Route::post('urlTipEnvDelete', array('as' => 'urlTipEnvDelete', 'uses' => 'Ajax3Controller@urlTipEnvDelete'));


?>
<?php
	
	// Crear nuevos tipos de entrega 
	 Route::get('admin/generales/tipoentrega', array('as' => 'adminTipEnt', 'uses' => 'GeneralesController@getTipEnt'));


	 //CREACION DE PROMOCIONES
	 Route::get('admin/generales/promociones', array('as' => 'adminpromociones', 'uses' => 'GeneralesController@getPromociones'));

	  //DEPARTAMENTOS
	 Route::get('admin/generales/departamentos', array('as' => 'admindepartamentos', 'uses' => 'DepartamentosController@getIndex'));


	 //RUTAS POST
	 Route::post('postNewPromo', array('as' => 'postNewPromo', 'uses' => 'GeneralesController@postNewPromo'));
	 //RUTAS SINCRONIZACION CON MANTIS
	 Route::get('mantisSync', array('as' => 'mantisSync', 'uses' => 'SyncController@mantisSync'));#PRODUCTOS
	 Route::get('syncCateMantis', array('as' => 'syncCateMantis', 'uses' => 'SyncController@syncCateMantis'));#CATEGORIAS
	 Route::get('syncFamiliaMantis', array('as' => 'syncFamiliaMantis', 'uses' => 'SyncController@syncFamiliaMantis'));#FAMILIAS
	 Route::get('departamentosSync', array('as' => 'departamentosSync', 'uses' => 'DepartamentosController@departamentosSync'));#DEPATAMENTOS
	 Route::get('syncGrupoMantis', array('as' => 'syncGrupoMantis', 'uses' => 'SyncController@syncGrupoMantis'));#GRUPO


	 //RUTAS AJAX
	
	 Route::post('urlTipEnv', array('as' => 'urlTipEnv', 'uses' => 'Ajax3Controller@urlTipEnv'));
	 Route::post('urlTipEnvDelete', array('as' => 'urlTipEnvDelete', 'uses' => 'Ajax3Controller@urlTipEnvDelete'));


?>
<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/
Route::get(	'/', array(
		'as'=>'index', 
		'uses'=> 'HomeController@getIndex'
		));
//GRUPO DE RUTAS PARA ANTES DE ESTAR REGISTRADO
Route::group(['before' => 'guest'], function () {
		Route::get(	'/register', array(
		'as'=>'register', 
		'uses'=> 'HomeController@getRegistger'
		));

		Route::get(	'/login', array(
		'as'=>'login', 
		'uses'=> 'HomeController@getLogin'
		));

		Route::post('/postLogin', array(
		'as'=>'postLogin', 
		'uses'=> 'HomeController@postLogin'
		));
		Route::post('/register', array(
		'as'=>'registerpost', 
		'uses'=> 'HomeController@postRegister'
		));

});

Route::get('cart', array('as' => 'cart', 'uses' => 'CartController@getCart'));



Route::group(['before' => 'auth'], function() {

	Route::get('admin', array('as' => 'adminIndex', 'uses' => 'EmpresaController@getIndex'));
	Route::get('logout', array('as' => 'logout', 'uses' => 'HomeController@logout'));

});






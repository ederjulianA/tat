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

//DETALLE DE PRODUCTO

Route::get(	'/producto/{slug}', array(
		'as'=>'proDetalle', 
		'uses'=> 'ProductoController@getProducto'
		));

Route::get(	'/catalogo', array(
		'as'=>'catalogo', 
		'uses'=> 'CatalogoController@getCatalogo'
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
Route::get('checkout', array('as' => 'checkout', 'uses' => 'CartController@getCheckout'));
Route::get('categoria/{id}', array('as' => 'categoria', 'uses' => 'CatalogoController@getCategoria'));
Route::get('/remove/cart/{identifier}', array('as' => 'removeItem','uses' => 'CartController@getRemoveitem'));


//RUTAS POST

Route::post('addToCart', array('as' => 'addToCart', 'uses' => 'CartController@addToCart'));
Route::post('updateItem', array('as' => 'updateItem', 'uses' => 'CartController@updateItem'));
Route::post('register/new/user', array('as' => 'newUser', 'uses' => 'UserController@postNewUser'));
Route::post('postlogin', array('as' => 'postlogin', 'uses' => 'HomeController@postLogin'));
Route::post('postLoginCheckout', array('as' => 'postLoginCheckout', 'uses' => 'UserController@postLoginCheckout'));
Route::post('postUpdateData', array('as' => 'postUpdateData', 'uses' => 'UserController@postUpdateData'));
Route::post('postPedido', array('as' => 'postPedido', 'uses' => 'CartController@postPedido'));

Route::post('addcartAjax', array('as' => 'addcartAjax', 'uses' => 'AjaxController@addcartAjax'));
Route::post('DiasAjax', array('as' => 'DiasAjax', 'uses' => 'AjaxController@getDias'));




Route::group(['before' => 'auth'], function() {

	Route::get('admin', array('as' => 'adminIndex', 'uses' => 'EmpresaController@getIndex'));
	Route::get('admin/pedido/{id}', array('as' => 'adminPedidoDetalle', 'uses' => 'EmpresaController@getAdminPedidoDetalle'));
	Route::get('logout', array('as' => 'logout', 'uses' => 'HomeController@logout'));

	Route::get('micuenta', array('as' => 'micuenta', 'uses' => 'CuentaController@getIndex'));
	Route::get('micuenta/orden/{id}', array('as' => 'micuentaorden', 'uses' => 'CuentaController@getDetalleCuenta'));
	Route::post('postConfPedido', array('as' => 'postConfPedido', 'uses' => 'EmpresaController@postConfPedido'));

});






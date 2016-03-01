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


Route::get(	'/converter', array(
		'as'=>'converter', 
		'uses'=> 'HomeController@converter'
		));

Route::any(	'/payu/response', array(
		'as'=>'pur', 
		'uses'=> 'HomeController@getPayUr'
		));

Route::any('/payu/confirmation', array(
		'as'=>'purconfirmation', 
		'uses'=> 'HomeController@confirmation'
		));




//ruta pedidos


Route::any(	'/pedMantis', array(
		'as'=>'pedMantis', 
		'uses'=> 'SyncController@pedMantis'
		));



//RUTAS PAYPAL

Route::post('payment', array(
    'as' => 'payment',
    'uses' => 'PaypalController@postPayment',
));

// this is after make the payment, PayPal redirect back to your site
Route::get('payment/status', array(
    'as' => 'payment.status',
    'uses' => 'PaypalController@paymentNoMantis',
));


//RUTAS LOAD AJAX HTML

        Route::get('ajax/load/productos', array('as' => 'ajaxLoadProductos', 'uses' => 'Ajax2Controller@getLoadProductos'));

         Route::any('ajax/load/payment', array('as' => 'ajaxLoadPayment', 'uses' => 'CartController@getLoadPayment'));
         Route::any('ajax/load/paymentU', array('as' => 'ajaxLoadPaymentU', 'uses' => 'CartController@getLoadPaymentU'));


//DETALLE DE PRODUCTO

Route::get(	'/producto/{slug}', array(
		'as'=>'proDetalle', 
		'uses'=> 'ProductoController@getProducto'
		));

Route::get(	'/catalogo', array(
		'as'=>'catalogo', 
		'uses'=> 'CatalogoController@getCatalogo'
		));

Route::get(	'/PedidoPdf/{id}', array(
		'as'=>'pedidopdf', 
		'uses'=> 'EmpresaController@getPdfPedido'
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
Route::any('/remove/cart/{identifier}', array('as' => 'removeItem','uses' => 'CartController@getRemoveitem'));

//android

Route::any('/android', array('as' => 'android', 'uses' => 'HomeController@android'));
Route::any('/android/users', array('as' => 'androidUsers', 'uses' => 'HomeController@androidUsers'));
Route::any('/android/detalle', array('as' => 'androidDetalle', 'uses' => 'HomeController@androidDetalle'));

//BUSCADOR

Route::get('buscador/{f?}/{o?}', array('as' => 'buscador', 'uses' => 'BuscadorController@getBuscador'));


//RUTAS POST

Route::post('addToCart', array('as' => 'addToCart', 'uses' => 'CartController@addToCart'));
Route::post('updateItem', array('as' => 'updateItem', 'uses' => 'CartController@updateItem'));
Route::post('register/new/user', array('as' => 'newUser', 'uses' => 'UserController@postNewUser'));
Route::post('postlogin', array('as' => 'postlogin', 'uses' => 'HomeController@postLogin'));
Route::post('postLoginCheckout', array('as' => 'postLoginCheckout', 'uses' => 'UserController@postLoginCheckout'));
Route::post('postUpdateData', array('as' => 'postUpdateData', 'uses' => 'UserController@postUpdateData'));
Route::post('postPedido', array('as' => 'postPedido', 'uses' => 'CartController@postPedido'));
Route::post('urlValDis', array('as' => 'urlValDis', 'uses' => 'SyncController@urlValDis'));

Route::post('addcartAjax', array('as' => 'addcartAjax', 'uses' => 'AjaxController@addcartAjax'));
Route::post('confAjax', array('as' => 'confAjax', 'uses' => 'AjaxController@confAjax'));
Route::post('confAjaxf', array('as' => 'confAjaxf', 'uses' => 'AjaxController@confAjaxf'));
Route::post('barrioAjax', array('as' => 'barrioAjax', 'uses' => 'AjaxController@barrioAjax'));
Route::post('barrioAjaxSearch', array('as' => 'barrioAjaxSearch', 'uses' => 'AjaxController@barrioAjaxSearch'));
Route::post('barrioAjaxNo', array('as' => 'barrioAjaxNo', 'uses' => 'AjaxController@barrioAjaxNo'));
Route::post('DiasAjax', array('as' => 'DiasAjax', 'uses' => 'AjaxController@getDias'));
Route::post('urlEnvAjax', array('as' => 'urlEnvAjax', 'uses' => 'AjaxController@getEnvAjax'));
Route::post('urlBarriosVajax', array('as' => 'urlBarriosVajax', 'uses' => 'AjaxController@urlBarriosVajax'));
Route::post('urlBarriosAjax', array('as' => 'urlBarriosAjax', 'uses' => 'AjaxController@getBarriosAjax'));
Route::post('CarroAjax', array('as' => 'CarroAjax', 'uses' => 'AjaxController@CarroAjax'));
Route::post('addDescriptionAjax', array('as' => 'addDescriptionAjax', 'uses' => 'AjaxController@addDescriptionAjax'));
Route::post('confEliDiasV', array('as' => 'confEliDiasV', 'uses' => 'AjaxController@confEliDiasV'));
Route::post('urlAddProd', array('as' => 'urlAddProd', 'uses' => 'Ajax2Controller@urlAddProd'));
Route::post('urlBuscarProd', array('as' => 'urlBuscarProd', 'uses' => 'Ajax2Controller@urlBuscarProd'));
Route::post('urlDeleteProd', array('as' => 'urlDeleteProd', 'uses' => 'Ajax2Controller@urlDeleteProd'));
Route::post('urlReparto', array('as' => 'urlReparto', 'uses' => 'Ajax2Controller@urlReparto'));
Route::post('urlSync', array('as' => 'urlSync', 'uses' => 'Ajax2Controller@urlSync'));



Route::any('UrlLoadPro', array('as' => 'UrlLoadPro', 'uses' => 'Ajax2Controller@UrlLoadPro'));


 Route::post('urlTipPag', array('as' => 'urlTipPag', 'uses' => 'Ajax3Controller@prueba'));
/*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$rutas&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&*/

 	Route::group(['prefix' => 'api', 'after' => 'allowOrigin'], function() {

 			Route::any('categorias', array('as' => 'apiCategorias', 'uses' => 'ApiController@getCategorias'));
 			Route::any('login', array('as' => 'apilogin', 'uses' => 'ApiController@apiLogin'));
 			Route::any('addFav', array('as' => 'addFav', 'uses' => 'ApiController@addFav'));

 			Route::any('/android', array('as' => 'android', 'uses' => 'ApiController@android'));




 			Route::any('/saveproducts', array('as' => 'saveproducts', 'uses' => 'Ajax2Controller@saveproducts'));
 			Route::any('/prueba', array('as' => 'android', 'uses' => 'Ajax2Controller@prueba'));


 
    });






Route::group(['before' => 'auth'], function() {
		Route::get('logout', array('as' => 'logout', 'uses' => 'HomeController@logout'));

		Route::get('micuenta', array('as' => 'micuenta', 'uses' => 'CuentaController@getIndex'));
		Route::get('micuenta/orden/{id}', array('as' => 'micuentaorden', 'uses' => 'CuentaController@getDetalleCuenta'));
		Route::post('postConfPedido', array('as' => 'postConfPedido', 'uses' => 'EmpresaController@postConfPedido'));

	 	Route::group(['before' => 'is_admin'], function () {

        Route::get('admin', array('as' => 'adminIndex', 'uses' => 'EmpresaController@getIndex'));
        Route::get('admin/pedidos', array('as' => 'adminPedidos', 'uses' => 'EmpresaController@getPedidos'));
        Route::get('admin/pedido/{id}', array('as' => 'adminPedidoDetalle', 'uses' => 'EmpresaController@getAdminPedidoDetalle'));
        Route::get('admin/articulo/{id}', array('as' => 'adminArticuloDetalle', 'uses' => 'EmpresaController@getAdminArticulo'));
        Route::get('admin/barrios', array('as' => 'adminBarrios', 'uses' => 'EmpresaController@getBarrios'));
        Route::get('admin/productos', array('as' => 'adminProductos', 'uses' => 'EmpresaController@getProductos'));

        Route::post('addDia', array('as' => 'addDia', 'uses' => 'EmpresaController@addDia'));
        Route::get('admin/searchBarrio', array('as' => 'searchBarrio', 'uses' => 'EmpresaController@searchBarrio'));
        Route::post('deleteDay', array('as' => 'deleteDay', 'uses' => 'EmpresaController@deleteDay'));
        //RUTAS PARA CONFIGURAR DATOS GENERALES. ################################

        	require (__DIR__ . '/routes/rut_generales.php');


        //##########################################################################

        

        //RUTA QUE DEVUELVE LOS ARTICULOS POR EL FILTRO DEL NOMBRE EN FORMATO JSON
        Route::get('ajax/load/productos/{search}', array('as' => 'ajaxLoadProductosSearch', 'uses' => 'Ajax2Controller@getLoadProductosSearch'));
        //RUTA TEMPORAL DE LA BUSQUEDA

        Route::get('ajax/load/results', function(){
        	$name = Input::get('name');

        	$pro = Producto::where('pro_nom','LIKE','%'.$name.'%')->take(20)->get();
        	return Response::json($pro);
        });
		
		

    });

	

});






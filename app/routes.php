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
		
		Route::any('/payucon2', array(
		'as'=>'payucon2', 
		'uses'=> 'HomeController@payucon2'
		));


Route::any('/urlSaveArt', array(
		'as'=>'urlSaveArt', 
		'uses'=> 'AjaxController@urlSaveArt'
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
		'uses'=> 'PayuController@conf2'
		));

Route::post('/UrlPedTem', array(
		'as'=>'UrlPedTem', 
		'uses'=> 'AjaxController@UrlPedTem'
		));


Route::any('/payu2', array(
		'as'=>'purconfirmation2', 
		'uses'=> 'PayuController@conf2'
		));

Route::any('/payu4', array(
		'as'=>'payu4', 
		'uses'=> 'PayuController@payu4'
		));

Route::any('/payu3', array(
		'as'=>'payu3', 
		'uses'=> 'UserController@getItems'
		));
Route::any('/sendmail', array(
		'as'=>'pruebamail', 
		'uses'=> 'ApiController@mail'
		));

//probando sincronización por bloques de articulos
Route::get('/sync/bloque', array(
		'as'=>'syncbloque', 
		'uses'=> 'SyncController@mantis2'
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


Route::post('paymentAgain', array(
    'as' => 'paymentAgain',
    'uses' => 'PaypalController@postPaymentAgain',
));
// this is after make the payment, PayPal redirect back to your site
Route::get('payment/status', array(
    'as' => 'payment.status',
    //'uses' => 'PaypalController@paymentNoMantis',
    'uses' => 'PaypalController@getPaymentStatus',
));

Route::get('payment/status/again', array(
    'as' => 'payment.statusAgain',
    //'uses' => 'PaypalController@paymentNoMantis',
    'uses' => 'PaypalController@getPaymentStatusAgain',
));


//RUTAS LOAD AJAX HTML

        Route::get('ajax/load/productos', array('as' => 'ajaxLoadProductos', 'uses' => 'Ajax2Controller@getLoadProductos'));

         Route::any('ajax/load/payment', array('as' => 'ajaxLoadPayment', 'uses' => 'CartController@getLoadPayment'));
         Route::any('ajax/load/paymentU', array('as' => 'ajaxLoadPaymentU', 'uses' => 'CartController@getLoadPaymentU'));


         Route::any('urlValMail', array('as' => 'urlValMail', 'uses' => 'AjaxController@urlValMail'));


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

Route::get(	'/pdfarticulos', array(
		'as'=>'pdfarticulos', 
		'uses'=> 'EmpresaController@pdfmantis2'
		));

Route::get(	'/pdfmantis', array(
		'as'=>'pdfmantis', 
		'uses'=> 'EmpresaController@pdfmantis'
		));

//GRUPO DE RUTAS PARA ANTES DE ESTAR REGISTRADO
Route::group(['before' => 'guest'], function () {
		Route::any(	'/register', array(
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
Route::any('postlogin', array('as' => 'postlogin', 'uses' => 'HomeController@postLogin'));
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
Route::any('urlSync', array('as' => 'urlSync', 'uses' => 'Ajax2Controller@urlSync'));
Route::any('urlTestPro', array('as' => 'urlTestPro', 'uses' => 'Ajax2Controller@urlTestPro'));
Route::any('urlTestSavePro', array('as' => 'urlTestSavePro', 'uses' => 'Ajax2Controller@urlTestSavePro'));


Route::any('urlSaveGrupos', array('as' => 'urlSaveGrupos', 'uses' => 'Ajax2Controller@urlSaveGrupos'));
Route::any('urlSaveFamilias', array('as' => 'urlSaveFamilias', 'uses' => 'Ajax2Controller@urlSaveFamilias'));



Route::any('setPostPrueba', array('as' => 'setPostPrueba', 'uses' => 'Ajax2Controller@setPostPrueba'));





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


 			//GACEL

 			Route::any('noti', array('as' => 'noti', 'uses' => 'ApiController@noti'));



 
    });






Route::group(['before' => 'auth'], function() {
		Route::get('logout', array('as' => 'logout', 'uses' => 'HomeController@logout'));

		Route::get('micuenta', array('as' => 'micuenta', 'uses' => 'CuentaController@getIndex'));
		Route::get('micuenta/direcciones', array('as' => 'micuentaDir', 'uses' => 'CuentaController@getDirecciones'));
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






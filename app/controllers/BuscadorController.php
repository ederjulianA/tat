<?php

class BuscadorController extends BaseController {

	protected $producto;
	protected $cat;
	protected $barrio;
	protected $promo;
	protected $grupo;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio, Promo $promo, Grupo $grupo)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
		$this->promo 		= $promo;
		$this->grupo        = $grupo;
	}

	public function getBuscador($f)
	{
		$ord     = Input::get('ord');
		$keyword = Input::get('keyword');

		$dia     = 1;
		
		$productos 		= 	$this->producto->getProBuscador($keyword,$f,$ord);
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias 	=   $this->cat->getAllCat();
		$promo     		=  $this->promo->getPromo();
		
		$menu      		= $this->grupo->getAllGrupos();
		
		
		
		$categorias = $this->cat->getAllCat();
		
		return View::make('cotra.buscador',compact('ord'))->with('menu',$menu)->with('grupos',$grupos)->with('promo',$promo)->with('categorias',$categorias)->with('productos',$productos)->with('keyword',$keyword)->with('products', Cart::contents());


	}

	/*public function buscador()
	{
		$search = Input::get('search');
		$search = trim($search);
		$keywords = preg_split('/[\ \n\,]+/', $search);

		$result = Producto::select('id', 'pro_nom', DB::raw('CONCAT(pro_nom, " ") AS name'))
		->whereNested(function($query) use ($keywords)
        {
            foreach($keywords as $keyword) {
                $query->where(DB::raw("CONCAT(pro_nom, ' ')"), 'LIKE', '% '.$keyword.'%')
                ->orWhere(DB::raw("CONCAT(pro_nom, ' ')"), 'LIKE', $keyword.'%');
                $query->where('id', '>', 0);  
            }
            
            //select * from table where title LIKE '%test1%' and title LIKE '%test2%' and title LIKE '%test3%' 
        })
        ->get()->toArray();

        dd($result);
	}*/

	public function buscador()
	{
		$ord     = Input::get('ord');
		$keyword = Input::get('keyword');

		$dia     = 1;
		
		//$productos = $this->producto->getProBuscador($keyword,$f,$ord);
		$productos   = Producto::search($keyword,0)->orderBy('precio',$ord)->get();
		
		$grupos 		=   $this->grupo->getAllGrupos();
		$categorias =   $this->cat->getAllCat();
		$promo      =   $this->promo->getPromo();
		$menu       = $this->grupo->getAllGrupos();
		
		return View::make('cotra.buscador',compact('ord'))->with('menu',$menu)->with('grupos',$grupos)->with('promo',$promo)->with('categorias',$categorias)->with('productos',$productos)->with('keyword',$keyword)->with('products', Cart::contents());
    	//$articles = Question::search($query)->get();
    	//return View::make('cc.res',compact('articles'));
    	//dd($articles);
	}
}
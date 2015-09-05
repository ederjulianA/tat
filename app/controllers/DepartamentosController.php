<?php

class 	DepartamentosController extends BaseController {

	protected $producto;
	protected $cat;
	protected $barrio;

	public function __construct(Producto $producto, Categoria $cat, Barrio $barrio)
	{
		$this->producto 	= $producto;
		$this->cat 			= $cat;
		$this->barrio 		= $barrio;
	}


	public function getIndex()
	{
		$user = Auth::user()->id;
		$deps  = Departamento::all();

		return View::make('tiendo.admin.departamentos.index', compact('user','deps'));
	}

	public function departamentosSync()
	{
						if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=192.168.1.52,1433;Database=REDEMOTOS;", 'sa', 'Somic321')){ 
			   	echo "Conectado correctamente"; 
			   	
			        $ssql = "select  * from Departamentos where DepCod <> '' and DepCod <> '00'"; 
			   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
			   		
			   		while ($info = odbc_fetch_array($rs_access)) {
			 		   //$content[] = $info;
			   			//$ciudades = new Ciudad;
			   			$deps[] = $info;
						}// END WHILE############################

					} ############END RS_ACCESS##############	
			}###### END IF CON_ACCESS		
						foreach ($deps as $dep) {
							$depa = Departamento::where('id','=',$dep['DepCod'])->first();
							if($depa)
							{
								$depa->DepNom = $dep['DepNom'];
								$depa->save();
							}else{
								$departamento = new Departamento;
								$departamento->id 		=    $dep['DepCod'];
								$departamento->DepNom   =	 $dep['DepNom'];
								$departamento->save();
							}
						}#######################END FOREACH

						return Redirect::back()->with('message-alert','Departamentos Sincronizados');
			      	 
	
			   	
			 
	}########### END FUNCTION SYNC

}

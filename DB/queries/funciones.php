	
<?php

	public function getIndex()
	{
		if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=181.225.65.155\grupo2008,1433;Database=ERPWEB1807;", 'sa', 'Colombia$2015')){ 
   	      //echo "Conectado correctamente"; 
   	
        $ssql = "select top 10 artsec,artnom,parconiva,cast(ArtBalBas*(1+((select LisPreRen from  ListasPrecios where LisPreCod=1) /100)) as int) precio1,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=2) /100)) as int) precio2,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=3) /100)) as int) precio3,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=4) /100)) as int) precio4,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=5) /100)) as int) precio5,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=6) /100)) as int) precio6,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=7) /100)) as int) precio7,cast(ArtBalBas*(1+((select LisPreRen from  ListasPrecios where LisPreCod=8) /100)) as int) precio8,SG.InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
                 from Kardex k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec),0) saldo from articulos a left join ListasPrecios on LisPreCod=1 left join ParametroContable p on p.parconcod=a.ParConCod
                 left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod"; 
				   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
				   		
				   		while ($info = odbc_fetch_array($rs_access)) {
				 		   //$content[] = $info;
				   			//$ciudades = new Ciudad;
				   			$ciudades[] = $info;
							}
							dd($ciudades);
				      	 
										echo "<br>La sentencia se ejecutó correctamente"; 
								//$fila = odbc_fetch_object($rs_access);
						      	 //dd($fila);
						/*while ($fila = odbc_fetch_object($rs_access)){ 
						         	 echo "<br>" . $fila->CiuNom; 
						      	 } 
						   	}else{ */
						      	 //echo "Error al ejecutar la sentencia SQL"; 
						   	} 
						} else{ 
						   	echo "Error en la conexión con la base de datos"; 
						} //die( print_r( sqlsrv_errors(), true));
		$productos	= $this->producto->getSome();
		$categorias =   $this->cat->getAllCat();
		return View::make('index')->with('categorias',$categorias)->with('productos',$productos)->with('products', Cart::contents());
	}
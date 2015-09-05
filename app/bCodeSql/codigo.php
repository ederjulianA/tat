<?php
if ($conn_access  = odbc_connect("Driver={SQL Server Native Client 10.0};Server=Eder-pc,1433;Database=erpweb;", 'sa', 'Somic321')){ 
			   	echo "Conectado correctamente"; 
			   	
			        $ssql = "select top 10 ArtImg_GXI, ArtCod,artsec,artnom,f.InvFamNom,
cast(ArtBalBas*(1+((select LisPreRen from  ListasPrecios where LisPreCod=1) /100)) as int)as precio1,
cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=2) /100)) as int) precio2,
SG.InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
from Kardex k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec),0) saldo
 from articulos a left join ListasPrecios on LisPreCod=1 left join ParametroContable p on p.parconcod=a.ParConCod
left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
"; 
			   	if($rs_access = odbc_exec ($conn_access, $ssql)){ 
			   		
			   		while ($info = odbc_fetch_object($rs_access)) {
			 		   //$content[] = $info;
			   			//$ciudades = new Ciudad;
			   			$deps[] = $info;
			   			if($info->ArtImg_GXI != NULL)
			   			{
			   				$nombre = Str_replace('gxdbfile:','',$info->ArtImg_GXI);
			   				$urlImg = 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/'.$nombre;
			   			}else
			   			{
			   				$urlImg = 'http://localhost:8000/img/Mantis/def.png';
			   			}
			   			
			   			$datos[] = array('ArtCod'=>utf8_encode($info->ArtCod),'ArtSec'=>utf8_encode($info->artsec),'ArtNom'=>utf8_encode($info->artnom),'InvFamNom'=>utf8_encode($info->InvFamNom),'precio1'=>utf8_encode($info->precio1),'InvFamNom'=>utf8_encode($info->InvFamNom),'UrlImg'=>utf8_encode($urlImg));
			   			//dd($datos);

			   			//dd($deps);
						}// END WHILE############################

					} ############END RS_ACCESS##############	
			}###### END IF CON_ACCESS
			//dd($deps);
			
		
			//return Response::json(array('text' => ' test'), 200, null, JSON_UNESCAPED_UNICODE);
			return Response::json(array('productos'=>$datos));
			//dd($deps);

?>



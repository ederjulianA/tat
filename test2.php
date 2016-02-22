<?php
	ini_set('display_errors', 1);
	error_reporting(E_ALL); 

	//$servidor='190.147.199.27';  //Dirección IP o HOSTNAME de su servidor de SQL SERVER Ej (190.0.0.60 , sqlserver.miempresa.com, 190.0.0.60\miinstancia)
	$servidor='192.168.1.53';
	$usuario='sa'; //Usuario de Sql server
	$clave='Mantis321';
	$baseDatos='erpappweb22protoDAT'; //Base de datos de SQL Server
	
	$dsn="dblib:host=$servidor;dbname=$baseDatos";

	try{
		$db = new PDO($dsn, $usuario, $clave); 
		$query = $db->prepare("select top 10 a.artsec,a.ArtSec, a.ArtNom,ArtImg_GXI,a.InvFamCod,a.ArtCod,a.ArtFicTec,parconiva,
0 precio1,0 precio2,
cast(isnull((p3.PrePreFijVal),0)/(1-((isnull(p3.preporval,0))/100)) as int) precio3,

  replace(replace(replace(SG.InvSubGruCod,'S',''),'G',''),'0','99') InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
 from Kardex  k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec ),0) saldo
 from articulos a   
 left join PreciosDetalle p3 on p3.ArtSec=a.ArtSec and  p3.LisPreCod=1
 
 left join PresentacionArticulos pres on pres.preartcod=p3.preartcod
 left join ParametroContable p on p.parconcod=a.ParConCod
 left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
 where  artdes='N'");
		$query->execute();
		while ($fila = $query->fetch(PDO::FETCH_ASSOC)) {
			//print_r($fila);
			$pros[] = $fila;
		}
		die($pros);
		$query=NULL;
	} catch(PDOException $e) {
		   echo "Error en conexion: " . $e->getMessage();
	}
?>

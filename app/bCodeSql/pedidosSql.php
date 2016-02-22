<?php
$data= $_GET["losides"];
$data = str_replace("*", "{", $data);
$data = str_replace("$", "}", $data);
$data = str_replace("'", '"', $data);
$data=trim($data);
echo $data;
$serverName = "172.20.1.2\GRUPO2008"; //serverName/instanceName, portNumber (por defecto es 1433)
$connectionInfo = array("Database"=>"erpweb1108","UID"=>"sa", "PWD"=>"Colombia$2015");
$conn = sqlsrv_connect( $serverName, $connectionInfo);
if($conn==false)
{
    echo "Could not connect.\n";
    die(print_r(sqlsrv_errors(),true));
}
// DisplayErrors();
$params="";
// $data='{"pedido":[{"pedido":"ped1234","nitsec":"10010","clisec":"1","artsec":"992","vencod":"1","cant":"2","pdyear":"2014","pdmonth":"1","pdday":"5","precio":"40000"}]}';
$manage = json_decode($data);
$registros= count($manage->pedido);
$vuelta=1;
$secuencia=0;
foreach($manage->pedido as $obj){
    $nitsec = $obj->nitsec;       
    $clisec = $obj->clisec;       
    $artsec = $obj->artsec;       
    $vencod = $obj->vencod;
    $cant = $obj->cant;    
    $pdyear = $obj->pdyear;    
    $pdmonth = $obj->pdday;
    $pdday = $obj->pdmonth;    
    $precio = $obj->precio;    
    $id_pedido = $obj->pedido;  
    $plazodias = $obj->plazo;  
    $cotreg = $obj->cotreg;  
    //select isnull(SUM(CotArtUni*(CotArtPrecio*(1+(cotartconiva/100)))),0) from  CotizacionesDetalle1 where CotSec=310
    $sqlexe="select count(*) conteo from Cotizaciones1 where CotNum='$id_pedido'";
    $rs = sqlsrv_query($conn,$sqlexe);
    $existe=0;
    
    if ($rs)
    {
        while($row=sqlsrv_fetch_object($rs)){
            if($row->conteo==1){
                $existe=1;
            }else{
                $vuelta=1;
            }
        }
    }
    if ($vencod >93){
        $bodega=7;
    }else{
        $bodega=1;
    }
    $listaprecio=3;
    //$plazodias=3;
    $Total=0;
    
    echo $existe;
    //if($existe==0){     
        if($existe==0){
            $sql="select SecNum from Secuencia where SecCod='PEDIDO'";
            $rs = sqlsrv_query($conn,$sql);
            $vuelta2=0;
            if ( $rs )
            {
                while($row=sqlsrv_fetch_object($rs)){                
                $vuelta2=$vuelta2+1;
                $secuencia=$row->SecNum;     
                //echo $secuencia;    
                if($vuelta==1){
                    $sql2="INSERT INTO Cotizaciones1(CotTip,CotSec,TipCod,EmpCod,CotFecha,CotObs,CotUsuCod,CotCliConPag,CotSecConCon,CotLisPreCod,CotSubVenCod,CotSubNitSec,CotSubCliSec,CotNum,CotSumCot,BodSucCCSec,CotEst,CotSubCotSec,AnuFueSec,CotAnuObs,CotEstado)
                    VALUES('P',$secuencia,'PED',1,'$pdyear-$pdmonth-$pdday','miobs','admin',$plazodias,$registros,$listaprecio,$vencod,$nitsec,$clisec,'$id_pedido',$Total,$bodega,2,NULL,NULL,NULL,'A')";                    
                    echo $sql2;                    
                    $stmt = sqlsrv_prepare($conn,$sql2);
                    $rs2 = sqlsrv_execute($stmt);
                    
                    $sqlCONSE="UPDATE Secuencia SET SecNum=SecNum+1 where SecCod='PEDIDO' ";
                    $stmtCONE = sqlsrv_prepare($conn,$sqlCONSE);
                    $rs23 = sqlsrv_execute($stmtCONE);                 
                    
                    //echo $rs2;    
                    
                    $sql3="insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec
                    ,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,
                    CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,
                    CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva,CotArtDesUnoFi,CotSubPrecio)
                    values('P',$secuencia,$artsec,'N',$artsec,1,'S/L','1999-01-01 00:00:00.000',0.000000,$cant,0.00,0.00,0.00,0.00,0.00000,
                    (select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artsec),
                    $precio,0.00000,0.00000,0.00000,0.00000,0.00000,isnull((select lisprecod from clientes where nitsec=$nitsec and clisec=$clisec),0)
                    ,(select top 1 PreArtCod from ArtPre where artsec=$artsec),$bodega,0,0,'A',0,0.00000,1.00000,NULL,0.00000
                    ,(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artsec),NULL,$precio*$cant)";
                    
                    echo $sql3;
                            
                    $stmt2 = sqlsrv_prepare($conn,$sql3);
                    $rs3   = sqlsrv_execute($stmt2);
                    
                    $sqltot="update Cotizaciones1 set CotSumCot=(select isnull(SUM(CotArtUni*(CotArtPrecio*(1+(cotartconiva/100)))),0) from  CotizacionesDetalle1 where CotizacionesDetalle1.CotSec=Cotizaciones1.CotSec) where CotNum='$id_pedido'";                    
                    $stmttot = sqlsrv_prepare($conn,$sqltot);
                    $rstot = sqlsrv_execute($stmttot); 
                    
                    //$sqlexe="update Cotizaciones1 set CotSumCot=(select isnull(SUM(CotArtUni*(CotArtPrecio*(1+(cotartconiva/100)))),0) from  CotizacionesDetalle1 where CotizacionesDetalle1.CotSec=Cotizaciones1.CotSec) from Cotizaciones1 where CotNum='$id_pedido'";
                    //$rs = sqlsrv_query($conn,$sqlexe);
                    //  echo $rs3;    
                }
              }
                //  echo "Statement executed.\n";
            }     
            else 
            {
                echo "Error in statement execution.\n";
                die( print_r(sqlsrv_errors(), true));
            }    
        }else{
            
            $sqlexe="select CotSec,(select isnull(max(cast(CotSecCon as int)),0) from CotizacionesDetalle1 ct where ct.cotsec=c.cotsec)+1 num  from Cotizaciones1 c where CotNum='$id_pedido' and CotSubCotSec  is   null";
            $rsg = sqlsrv_query($conn,$sqlexe);        
            if ($rsg)
            {
                while($rowg=sqlsrv_fetch_object($rsg)){
                    $secuencia=$rowg->CotSec;
                    $cotreg=$rowg->num;
                }
        

            //        echo "hey";
            //        $sql4="insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,
        //            CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva,CotArtDesUnoFij)
        //            values('P',$secuencia,$cotreg,'N',$artsec,1,'S/L','1999-01-01 00:00:00.000',0.000000,$cant,0.00,0.00,0.00,0.00,0.00000,
        //            (select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artsec),
        //            $precio,0.00000,0.00000,0.00000,0.00000,0.00000,isnull((select lisprecod from clientes where nitsec=$nitsec and clisec=$clisec),0),(select top 1 PreArtCod from ArtPre where artsec=$artsec),$bodega,0,0,'A',0,0.00000,1.00000,NULL,0.00000,(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artsec),NULL)";
                    
                    $sql4="insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,
                    CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva,CotArtDesUnoFij,CotSubPrecio)
                    values('P',$secuencia,$artsec,'N',$artsec,1,'S/L','1999-01-01 00:00:00.000',0.000000,$cant,0.00,0.00,0.00,0.00,0.00000,
                    (select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artsec),
                    $precio,0.00000,0.00000,0.00000,0.00000,0.00000,isnull((select lisprecod from clientes where nitsec=$nitsec and clisec=$clisec),0)
                    ,(select top 1 PreArtCod from ArtPre where artsec=$artsec),$bodega,0,0,'A',0,0.00000,1.00000,NULL,0.00000
                    ,(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artsec),NULL,$precio*$cant)";
                    
                    echo $sql4;
                    $stmt23 = sqlsrv_prepare($conn,$sql4);
                    $rs33   = sqlsrv_execute($stmt23);
                    
                    $sqltot="update Cotizaciones1 set CotSumCot=(select isnull(SUM(CotArtUni*(CotArtPrecio*(1+(cotartconiva/100)))),0) from  CotizacionesDetalle1 where CotizacionesDetalle1.CotSec=Cotizaciones1.CotSec) where CotNum='$id_pedido'";                    
                    $stmttot = sqlsrv_prepare($conn,$sqltot);
                    $rstot = sqlsrv_execute($stmttot); 
            }        
        }    
//  }
    $vuelta=$vuelta+1;
    
}

// INSERT INTO Cotizaciones1(CotTip,CotSec,TipCod,EmpCod,CotFecha,CotObs,CotUsuCod,CotCliConPag,CotSecConCon,CotLisPreCod,CotSubVenCod,CotSubNitSec,CotSubCliSec,CotNum,CotSumCot,BodSucCCSec,CotEst,CotSubCotSec,AnuFueSec,CotAnuObs,CotEstado)
// VALUES('P',2,'PED',1,'2015-02-03 00:00:00.000','miobs','admin',3,1,1,1,10010,1,'PED000000004',464000.00000,1,2,NULL,NULL,NULL,'A')
// insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva,CotArtDesUnoFij)
// values('P',2,1,'N',4811,1,'S/L','1999-01-01 00:00:00.000',1,0.000000,0.00,0.00,0.00,0.00,0.00000,16.00000,400000.00000,0.00000,0.00000,0.00000,0.00000,0.00000,1,158,1,135,0,'A',641.00000,0.00000,1.00000,NULL,0.00000,16.00000,NULL)
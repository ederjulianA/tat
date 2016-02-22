select CotSumCot,* from Cotizaciones1 where CotNum in ('PED-WEB-20160122-230156','PED00031')

select CotSec from Cotizaciones1 where CotNum like '%PED-WEB%'

delete CotizacionesDetalle1 where CotSec in (select CotSec from Cotizaciones1 where CotNum like '%PED-WEB%')
delete Cotizaciones1 where CotNum like '%PED-WEB%' 
select * from CamD



select CotSubLisPreCod,CotSubPrecio,CotArtConIva,CotArtPrecio,* from CotizacionesDetalle1 where CotSec in (32,31)


select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=101

update Cotizaciones1 set CotEst = 2 where CotSec = 32

update CotizacionesDetalle1 set CotSubPrecio = '3221.86000' where CotSec =32


insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec
,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,
CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,
CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva,CotSubPrecio)
values('P','32',3,'N',101/*ArtSec*/,1 /*ArtEmb*/,'S/L','1999-01-01 00:00:00.000',0.000000,1/*CotArtUni*/,0.00,0.00,0.00,0.00,0.00000,
(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec='101'),
'3221.86000'/*CotArtPrecio*/,0.00000,0.00000,0.00000,0.00000,0.00000,isnull((select lisprecod from clientes where nitsec='49607' and clisec=1),0)
,(select top 1 PreArtCod from ArtPre where artsec=101),1,0,0,'A',0,0.00000,1.00000,NULL,0.00000
,(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=101),'3221.86000')



insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec
                    ,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,
                    CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,
                    CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva,CotArtDesUnoFi,CotSubPrecio)
                    values('P',$secuencia,$artsec,'N',$artsec,1,'S/L','1999-01-01 00:00:00.000',0.000000,$cant,0.00,0.00,0.00,0.00,0.00000,
                    (select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artsec),
                    $precio,0.00000,0.00000,0.00000,0.00000,0.00000,isnull((select lisprecod from clientes where nitsec=$nitsec and clisec=$clisec),0)
                    ,(select top 1 PreArtCod from ArtPre where artsec=$artsec),$bodega,0,0,'A',0,0.00000,1.00000,NULL,0.00000
                    ,(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=$artsec),NULL,$precio*$cant)
                    
                    
                    select 
                    
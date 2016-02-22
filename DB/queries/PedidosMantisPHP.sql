Select * from  CotizacionesDetalle1 where CotSec = 1853
select * from Cotizaciones1 where CotSec = 1851
select * from CotizacionesDetalle1 where CotSec = 1851
select * from Cotizaciones1 where CotNum IN ('PED000000002','COT000001854')
update cotizaciones1 set CotNum = 'PED000001854', CotEst = 2 where CotSec =1853
INSERT INTO Cotizaciones1(CotTip,CotSec,TipCod,EmpCod,CotFecha,CotObs,CotUsuCod,CotCliConPag,CotSecConCon,CotLisPreCod,CotSubVenCod,CotSubNitSec,CotSubCliSec,CotNum,CotSumCot,BodSucCCSec,CotEst,CotSubCotSec,AnuFueSec,CotAnuObs,CotEstado)
                    VALUES('P','1853','PED',1,'16-01-2016','miobs','admin',1/*cliConPag*/,2/*numItems*/,1/*lisprecod*/,3/*vencod*/,17922/*nitsec*/,1/*clisec*/,'COT000001854','10500',1/*BODsUCCSEC*/,1/*CotEst*/,NULL,NULL,NULL,'A')
                    
select  * from Cotizaciones1 where CotSec = 1853 
 update Secuencia set  SecNum = '1854' where SecCod='PEDIDO'
select * from Secuencia where SecCod = 'PEDIDO'          
insert into CotizacionesDetalle1(CotTip,CotSec,CotSecCon,CotObsequio,ArtSec,CotArtEmb,CotArtLot,CotArtLotFec
,CotArtCaj,CotArtUni,CotArtDesUno,CotArtDesDos,CotArtDesTre,CotArtDesCua,CotArtDesVal,CotArtConIva,CotArtPrecio,
CotSumDes,CotArtSubTotDesUno,CotArtSubTotDesDos,CotArtSubTotDesTre,CotArtSubTotDesCua,CotSubLisPreCod,
CotSubPreArtCod,SubBodSucCCSec,PedArtCaj,PedArtUni,CotSecEst,CotPre,cotdesuni,CotPreFacCon,CotArtNom,CotArtValImp,CotPorIva)/*,CotArtDesUnoFi,CotSubPrecio)*/
values('P','1853',1,'N',6800/*ArtSec*/,1 /*ArtEmb*/,'S/L','1999-01-01 00:00:00.000',0.000000,1/*CotArtUni*/,0.00,0.00,0.00,0.00,0.00000,
(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec='6800'),
'21982.75000',0.00000,0.00000,0.00000,0.00000,0.00000,isnull((select lisprecod from clientes where nitsec=17922 and clisec=1),0)
,(select top 1 PreArtCod from ArtPre where artsec=6800),1,0,0,'A',0,0.00000,1.00000,NULL,0.00000
,(select top 1 ParConIva from Articulos a left join ParametroContable p on a.ParConCod=p.ParConCod where ArtSec=6800))/*,NULL,'21982.75000')*/

SELECT * from CotizacionesDetalle1 where CotSec=1854
update CotizacionesDetalle1 set CotArtNom ='CEMENTO GRIS BOYACA BULTO 50 KILOS' where CotSec= 1854
SELECT * FROM Secuencia where SecCod= 'PEDIDO'
Update Secuencia set SecNum ='1854' where SecCod= 'PEDIDO'
select * from Articulos
delete Cotizaciones1 where CotSec = 1854

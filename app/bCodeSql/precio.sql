select top 10 ArtSec,ArtCod,artsec,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=2) /100)) as int) precio2,
cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=1) /100)) as int) precio1,
cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=3) /100)) as int) precio3,
isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
	from Kardex k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec),0) saldo 
	from articulos a left join ListasPrecios on LisPreCod=1 left join ParametroContable p on p.parconcod=a.ParConCod
	left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
	where ArtSec = 10104




select a.artsec,parconiva,a.ArtCod,ArtNom,
0 precio1,0 precio2,
cast(isnull((p3.PrePreFijVal),0)/(1-((isnull(p3.preporval,0))/100)) as int) precio3,

  replace(replace(replace(SG.InvSubGruCod,'S',''),'G',''),'0','99') InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
 from Kardex  k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec /*AND  SUBBODSUCCCSEC=1*/),0) saldo
 from articulos a   
 left join PreciosDetalle p3 on p3.ArtSec=a.ArtSec and  p3.LisPreCod=1
 
 left join PresentacionArticulos pres on pres.preartcod=p3.preartcod
 left join ParametroContable p on p.parconcod=a.ParConCod
 left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
 where a.ArtCod = '050721' and artdes='N' 
 
 select * from BodegaSucursalCC
 
 
 


/*CONSULTAR EL PRECIO DE TODOS LOS ARTICULOS*/ 
 select TOP 1250 a.artsec, a.ArtNom,ArtImg_GXI,a.InvFamCod,a.ArtCod,a.ArtFicTec,parconiva,
0 precio1,0 precio2,
cast(isnull((p3.PrePreFijVal),0)/(1-((isnull(p3.preporval,0))/100)) as int) precio3,

  replace(replace(replace(SG.InvSubGruCod,'S',''),'G',''),'0','99') InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
 from Kardex  k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec AND  SUBBODSUCCCSEC=1),0) saldo
 from articulos a   
 left join PreciosDetalle p3 on p3.ArtSec=a.ArtSec and  p3.LisPreCod=2 
 
 left join PresentacionArticulos pres on pres.preartcod=p3.preartcod
 left join ParametroContable p on p.parconcod=a.ParConCod
 left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
 where  artdes='N'
 
 /*CONSULTA PRECIO TODOS LOS ARTICULOS*/ 
 
 
 
 /*ANTIGUA CONSUTA DE PRECIOS*/
	select top 100 ArtImg_GXI,ArtFicTec,ArtCod,artsec,f.InvFamCod as InvFamCod,f.InvFamNom , artnom,parconiva,cast(ArtBalBas*(1+((select LisPreRen from  ListasPrecios where LisPreCod=1) /100)) as int) precio1,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=2) /100)) as int) precio2,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=3) /100)) as int) precio3,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=4) /100)) as int) precio4,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=5) /100)) as int) precio5,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=6) /100)) as int) precio6,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=7) /100)) as int) precio7,cast(ArtBalBas*(1+((select LisPreRen from  ListasPrecios where LisPreCod=8) /100)) as int) precio8,SG.InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 else -1 end)) saldo
	from Kardex k inner join Factura f on f.FacSec=k.facsec where facest='A' and k.ArtSec=a.ArtSec),0) saldo from articulos a left join ListasPrecios on LisPreCod=1 left join ParametroContable p on p.parconcod=a.ParConCod
								left join InventarioFamilia f on f.InvFamCod=a.InvFamCod left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod 
 
 
 /**/
select substring(ArtNom,1,7)
 from Articulos where ArtCod ='010134'

select * from articulos
Select ArtNom,* from Articulos where 'masillas' LIKE substring(ArtNom,1,7)+'%' and ArtCod ='010134'

select top 1000 ArtImg_GXI,ArtFicTec,ArtCod,artsec,f.InvFamCod as InvFamCod,f.InvFamNom , 
artnom,parconiva,cast(ArtBalBas*(1+((select LisPreRen from 
 ListasPrecios where LisPreCod=1) /100)) as int) precio1,cast(ArtBalBas*
 (1+(  (select LisPreRen from  ListasPrecios where LisPreCod=2) /100)) as int) 
 precio2,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=3)
  /100)) as int) precio3,cast(ArtBalBas*
  (1+(  (select LisPreRen from  ListasPrecios where LisPreCod=4) /100)) as int)
   precio4,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios where LisPreCod=5)
    /100)) as int) precio5,cast(ArtBalBas*(1+(  (select LisPreRen from  ListasPrecios 
    where LisPreCod=6) /100)) as int) precio6,cast(ArtBalBas*(1+(  (select LisPreRen 
    from  ListasPrecios where LisPreCod=7) /100)) as int) precio7,cast(ArtBalBas*(1+(
    (select LisPreRen from  ListasPrecios where LisPreCod=8) /100)) as int) precio8,
    SG.InvSubGruCod,isnull((select SUM((karcaj+karuni)*(case when (karnat='+') then 1 
    else -1 end)) saldo
	from Kardex k inner join Factura f on f.FacSec=k.facsec where facest='A' and 
	k.ArtSec=a.ArtSec),0) saldo from articulos a 
	left join ListasPrecios on LisPreCod=1 
	left join ParametroContable p on p.parconcod=a.ParConCod
								left join InventarioFamilia f on f.InvFamCod=a.InvFamCod 
	left join InventarioSubgrupo sg on sg.InvSubGruCod=f.InvSubGruCod

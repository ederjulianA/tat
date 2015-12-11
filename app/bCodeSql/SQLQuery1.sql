select NitDiv,* from Nit
SP_HELP Nit
DELETE Pais WHERE PaiCod = 'EDE'

select * from Secuencia where SecCod = 'NITS'

INSERT INTO NIT (nitsec ,doccod ,nitide,nitdiv ,    nitpercod ,    nitprinom ,    nitotrnom ,    nitpriape, 
 nitsegape ,    nitcom ,    nitdir ,    nitciucod ,    nitpun ,    nitpag ,    nitema ,    nitfax ,    nitest     ,nitmaeobr ,
 nitmaecar ,    nitindcli ,    nitindpro ,    nitindemp ,    nitindeps ,    nitindarl ,    nitindpen ,    nitindces ,
 nitclisec ,    nitprosig,    nitprorep ,    nitprocup ,    nitpropla ,    progcntip ,    progcncod ,    
 nitprocom ,nitprocob ,nitprocon ,    protel ,    propordes ,    provestado ,
 nitactcomcod1 ,nitactcomcod2 ,nitactcomcod3 ,    nitindacr) 
 values (?nitsec ,    '13' ,    ?nitide ,    '0' ,    '' ,  'Eder' ,  
 'Julian',   'Alvarez', 'Carrero','Eder Julian Alvarez carrero','Calle 20 # 24-27',
 (select top 1 nitCiuCod from Empresa e left join Nit n on e.NitSec=n.NitSec ) ,
     0 , NULL , NULL , NULL , 'A' ,null ,
 null ,  'S',  'N' ,'N' ,'N' ,  'N' ,  'N' ,  'N' ,
 1 ,    '',    '' ,    0 ,    0 ,    null ,    null ,    
 '' ,'' ,'' ,    '' ,0 ,null, 
 1 ,1 ,1 ,'N' )

insert into Pais(PaiSec,PaiCod,PaiNom) values('','EDE','EDER')

sp_help pais

SELECT nitprosig,progcntip,progcncod,nitprocom,protel,provestado,nitactcomcod1,nitactcomcod2,nitactcomcod3,nitindacr,* FROM Nit

/*CONSULTA 2 NITTEL */
SELECT * FROM NitNitTel
INSERT INTO NITNITTEL (nitsec ,nittel,nittip) VALUES ('1102365683' ,'301311919i8','C')

/*CONSULTA 3 CLIENTES*/

SELECT * FROM Clientes
insert into clientes (nitsec  ,clisec,clinom ,    clirep ,        clisig ,      clisigimaext,    clisigimanom ,    clipag ,    perclicod  ,    cliregmer ,    cencod , clidir ,    climail ,
barcod  ,    tipclicod  ,    cliciucod ,    cobcod  ,    zoncod ,
zonrutcod  ,cancod  , cansubcod  ,
clifeccum ,    clicup ,    cliconpag ,    lisprecod  ,    cliestsoceco ,    cliest ,    clifecing ,    clirepimaext ,
clirepimanom ,    clitel ,        cligcntip ,    cligcncod ,    cliblocup ,    clibloche ,    cliblomor ,
cliblodescob ,    cliblodescobdia     ,cliblocampre ,    cliintord ,    clicamsec ,    clicarocu ,    clicarpro , 
clicarhob ,    clicarotr ,    clisiniva ,    cligeolocali ,    tricliica ,    tricliicapucsec    ,cliaplred    ,clired) 
values (?nitsweb.nitsec  ,?clisec,?clinom ,   '' ,  '' ,     
'',  '' ,    '' ,    2,    '' ,    '00000000' ,
'cALLE 20 # 24-27',  'ederalvarez2091057@gmail.com' ,
1  ,    1,    '00000' ,    1,    1 ,
999 ,1  , 1  ,
GETDATE() ,   0 ,    1 ,    1,    99 ,   'A' ,  '08-12-2015' ,  '' ,
'' ,   '3013119198' ,        'C',    1,   '' ,   '' ,  '' ,
'' ,    0     ,'O' ,   0 ,  0 ,  '' ,   '' , 
'' ,   '' ,  'S' , NULL ,  '' ,  NULL    
,''    ,0) 


/*CONSULTA 4 CLIENTES VENDEDORES*/
insert into ClientesVendedores (nitsec,clisec,vencod,CLIVENEST,CliIntLun, CliIntMar, CliIntMie, CliIntJue, CliIntVie, CliInSab, CliIntDom, CliIntFre,HORINICIO) 
values (?nitsec,?clisec,?vencod,'a','N','N','N','N','N','N','N','N',null)

/*CONSULTA 5 TRICLI*/
INSERT INTO tricli(TriCliNitSec,TriCliAutCre  ,TriCliTipPer  ,TriCliAge  ,TriCliIva  ,TriCliRet,TriCliIma,TriCliImaExt,TriCliImaNom,TriCliIvaPucSec,TriCliSal,TriCliPucSec)
values(?misclie.nitsec,?atricliautcre,?atriclitipper,?atricliage,?atricliiva,0,0,'','','1','1','1')


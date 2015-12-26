INSERT INTO NIT (nitsec ,    doccod ,    nitide ,    nitdiv ,    nitpercod ,    nitprinom ,    nitotrnom ,    nitpriape, 
 nitsegape ,    nitcom ,    nitdir ,    nitciucod ,    nitpun ,    nitpag ,    nitema ,    nitfax ,    nitest     ,nitmaeobr ,
 nitmaecar ,    nitindcli ,    nitindpro ,    nitindemp ,    nitindeps ,    nitindarl ,    nitindpen ,    nitindces ,
 nitclisec ,    nitprosig,    nitprorep ,    nitprocup ,    nitpropla ,    progcntip ,    progcncod ,    
 nitprocom ,nitprocob ,nitprocon ,    protel ,    propordes ,    provestado ,
 nitactcomcod1 ,nitactcomcod2 ,nitactcomcod3 ,    nitindacr) values (?nitsec ,    ?doccod ,    ?nitide ,    ?nitdiv ,    ?nitpercod ,    ?nitprinom ,    ?nitotrnom ,    ?nitpriape, 
 ?nitsegape ,    ?nitcom ,    ?nitdir ,    ?nitciucod ,    0 ,    ?nitpag ,    ?nitema ,    ?nitfax ,    ?nitest     ,null ,
 null ,    ?nitindcli ,    ?nitindpro ,?nitindemp ,?nitindeps ,    ?nitindarl ,    ?nitindpen ,    ?nitindces ,
 1 ,    ?nitprosig,    '' ,    0 ,    0 ,    ?progcntip ,    ?progcncod ,    
 ?nitprocom ,'' ,'' ,    ?protel ,0 ,?provestado , 
 ?nitactcomcod1 ,?nitactcomcod2 ,?nitactcomcod3 ,?nitindacr )

INSERT INTO NITNITTEL (nitsec ,nittel,nittip) VALUES (?nitsec ,?nittel,?nittip)

insert into clientes (nitsec  ,clisec,clinom ,    clirep ,        clisig ,      clisigimaext,    clisigimanom ,    clipag ,    perclicod  ,    cliregmer ,    cencod , clidir ,    climail ,
barcod  ,    tipclicod  ,    cliciucod ,    cobcod  ,    zoncod ,
zonrutcod  ,cancod  , cansubcod  ,
clifeccum ,    clicup ,    cliconpag ,    lisprecod  ,    cliestsoceco ,    cliest ,    clifecing ,    clirepimaext ,
clirepimanom ,    clitel ,        cligcntip ,    cligcncod ,    cliblocup ,    clibloche ,    cliblomor ,
cliblodescob ,    cliblodescobdia     ,cliblocampre ,    cliintord ,    clicamsec ,    clicarocu ,    clicarpro , 
clicarhob ,    clicarotr ,    clisiniva ,    cligeolocali ,    tricliica ,    tricliicapucsec    ,cliaplred    ,clired) 
values (?nitsweb.nitsec  ,?clisec,?clinom ,    ?clirep ,        ?clisig ,     
?clisigimaext,    ?clisigimanom ,    ?clipag ,    2,    ?cliregmer ,    '00000000' ,
?clidir ,    ?climail ,
?barcod  ,    1,    '00000' ,    1,    ?zoncod ,
?zonrutcod  , ?cancod  , ?cansubcod  ,
GETDATE() ,    ?clicup ,    ?cliconpag ,    1,    ?cliestsoceco ,    ?cliest ,    ?clifecing ,    ?clirepimaext ,
?clirepimanom ,    ?clitel ,        'C',    1,    ?cliblocup ,    ?clibloche ,    ?cliblomor ,
?cliblodescob ,    ?cliblodescobdia     ,?cliblocampre ,    ?cliintord ,    ?clicamsec ,    ?clicarocu ,    ?clicarpro , 
?clicarhob ,    ?clicarotr ,    ?clisiniva ,    ?cligeolocali ,    ?tricliica ,    ?tricliicapucsec    
,?cliaplred    ,?clired) )

insert into ClientesVendedores (nitsec,clisec,vencod,CLIVENEST,CliIntLun, CliIntMar, CliIntMie, CliIntJue, CliIntVie, CliInSab, CliIntDom, CliIntFre,HORINICIO) 
values (?nitsec,?clisec,?vencod,'a','N','N','N','N','N','N','N','N',null)

INSERT INTO tricli(TriCliNitSec,TriCliAutCre  ,TriCliTipPer  ,TriCliAge  ,TriCliIva  ,TriCliRet,TriCliIma,TriCliImaExt,TriCliImaNom,TriCliIvaPucSec,TriCliSal,TriCliPucSec)
values(?misclie.nitsec,?atricliautcre,?atriclitipper,?atricliage,?atricliiva,0,0,'','','1','1','1')

/*S52v4d92d4st24b14d927*/






insert into clientes (nitsec  ,clisec,clinom ,                      clirep ,        clisig ,      clisigimaext,clisigimanom ,    clipag ,    perclicod  ,    cliregmer ,    cencod ,           clidir ,                  climail ,        barcod  ,    tipclicod  ,    cliciucod ,  cobcod  ,    zoncod ,zonrutcod  ,cancod  , cansubcod  ,clifeccum ,    clicup ,    cliconpag ,    lisprecod  ,    cliestsoceco ,  cliest ,    clifecing ,    clirepimaext ,clirepimanom ,    clitel , cligcntip ,    cligcncod ,    cliblocup ,    clibloche ,    cliblomor ,cliblodescob ,    cliblodescobdia     ,cliblocampre ,    cliintord ,    clicamsec ,   clicarocu ,    clicarpro , clicarhob ,    clicarotr ,    clisiniva ,   cligeolocali ,    tricliica ,    tricliicapucsec    ,cliaplred    ,clired) 
values (               '46049'  ,'1','Eder Julian Alvarez Carrero',   '' ,             '' ,             '',          '' ,            '' ,          2,            '' ,      '00000000' ,'cALLE 20 # 24-27',  'ederalvarez2091057@gmail.com' ,1,            1,            (select top 1 nitCiuCod from Empresa e left join Nit n on e.NitSec=n.NitSec ) ,    1,    1 ,999 ,1  , 1  ,GETDATE() ,   0 ,    1 ,    1,    99 ,   'A' ,  '08-12-2015' ,  '' ,'' ,   '3013119198' ,        'C',    1,   '' ,   '' ,  '' ,'' ,    0     ,'O' ,   0 ,  0 ,  '' ,   '' , '' ,   '' ,  'S' , NULL ,  '' ,  NULL    ,''    ,0) 

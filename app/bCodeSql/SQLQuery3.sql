SELECT TABLENAME a,REFERENCETABLENAME b,* FROM (
 SELECT fk.name AS FK,
       OBJECT_NAME(fk.parent_object_id) AS TableName,
       COL_NAME(fc.parent_object_id,fc.parent_column_id) AS ColumnName,
       OBJECT_NAME (fk.referenced_object_id) AS ReferenceTableName,
       COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ReferenceColumnName
 FROM sys.foreign_keys AS fk
 INNER JOIN sys.foreign_key_columns AS fc ON fk.OBJECT_ID = fc.constraint_object_id
 ) AS AA where TableName='ClientesVendedores' ORDER BY TABLENAME
 
 select top 1 ActComCod from ActividadComercial
 Select top 1 CenCod from CentrosPoblados
 select DocCod,NitPerCod, * from Nit
 select top 1 * from GruConNit
  
 
 select top 1 nitCiuCod from Empresa e left join Nit n on e.NitSec=n.NitSec 
<?php
 
 $serverName = "192.168.1.241"; //serverName\instanceName, portNumber (por defecto es 1433)
 $connectionInfo = array("Database"=>"erpdat", "UID"=>"sa", "PWD"=>"Mantis321");
 $conn = sqlsrv_connect( $serverName, $connectionInfo);
 if( $conn == false )
 {
     echo "Could not connect.\n";
     die(print_r(sqlsrv_errors(),true));
 }
 $params="";
 $sql="select * from InventarioGrupo";
 $rs = sqlsrv_query($conn, $sql);
	if ( $rs )
	{
	   //  echo "Statement executed.\n";
	} 
	else 
	{
		 echo "Error in statement execution.\n";
		 die( print_r( sqlsrv_errors(), true));
	}
	
  $datos=array();

  while($row=sqlsrv_fetch_object($rs)){  	
       $datos[] = $row;
  }
  echo trim(json_encode($datos));	
  ?>
<?php
			$response_code_pol = $_REQUEST['response_code_pol'];
			$value = $_REQUEST['value'];
			$ip  = $_POST['ip'];
			$currency = $_POST['currency'];
			$sign = $_POST['sign'];
			$additional_value = $_POST['additional_value'];
			$state_pol = $_POST['state_pol'];
			$reference_sale = $_POST['reference_sale'];
			$New_value  =  number_format($value, 1, '.', '');
			$firma_cadena = "$ApiKey~500238~$reference_sale~$New_value~$currency~$state_pol";
        	$firmacreada = md5($firma_cadena);
        	$tp = new Empresa;
        	$tp->user_id =  Auth::id();
        	$tp->nombre_publico = $sign;
        	$tp->active = 1;
        	$tp->tema = 1;
        	$tp->color_tema = 1;
        	$tp->descripcion = $firmacreada;
        	$tp->save();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Pedido tat</title>
	<meta charset ="utf-8">
</head>
<body>
	<header style="width: 90%;margin: 0 auto;text-align: center;border-bottom: 2px solid #999;">
		<h1>Pedido TAT</h1>
	
	</header><!-- /header -->
	<div class="detalle">
		<h2>Detalle pedido </h2>

		<table class="table" style="margin: 0px;padding: 0px;width: 100%;box-shadow: 10px 10px 5px #888888;border: 1px solid #000000;-moz-border-radius-bottomleft: 0px;-webkit-border-bottom-left-radius: 0px;border-bottom-left-radius: 0px;-moz-border-radius-bottomright: 0px;-webkit-border-bottom-right-radius: 0px;border-bottom-right-radius: 0px;-moz-border-radius-topright: 0px;-webkit-border-top-right-radius: 0px;border-top-right-radius: 0px;-moz-border-radius-topleft: 0px;-webkit-border-top-left-radius: 0px;border-top-left-radius: 0px;">
			<caption>Items de tu pedido</caption>
			<thead>
				<tr>
					<th>Cod Ciudad</th>
					<th>Ciudad</th>
					<th>venta</th>
					<th>dev</th>
					<th>por1</th>
					<th>neta</th>
					<th>Clientes</th>
					<th>Impactados</th>
					<th>por4</th>
					<th>costo</th>
					<th>renta</th>

				</tr>
			</thead>
			<tbody>
				@foreach($pros as $item)
					<tr>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['CiuCod']}}</td>

						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['CiuNom']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['venta']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">${{$item['dev']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['por1']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">${{$item['neta']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['clientes']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['impactados']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['por4']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['costo']}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item['renta']}}</td>


					</tr>
				@endforeach	
			</tbody>
		</table>
		<div class="totalCompra">
			<h2>TOTAL COMPPRA :   </h2>
			
		</div>
		
	</div>

</body>
</html>
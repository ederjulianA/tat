<!DOCTYPE html>
<html>
<head>
	<title>Pedido tat</title>
	<meta charset ="utf-8">
</head>
<body>
	<header style="width: 90%;margin: 0 auto;text-align: center;border-bottom: 2px solid #999;">
		<h1>Pedido TAT</h1>
		<div class="contenedorHeader" style="width: 100%;margin-top: 10px;">
			<div class="infoHeader" style="display: inline-block;width: 28%;padding: 5px;">
				<h3>Cliente : <span class="nombre" style="color: #666;">{{$pedido->nombre}} {{$pedido->apellido}}</span></h3>
				
			</div>
			
			<div class="infoHeader" style="display: inline-block;width: 28%;padding: 5px;">
				<h3>Barrio : <span class="nombre" style="color: #666;">{{$pedido->bar_nom}}</span></h3>
				
			</div>

			<div class="infoHeader" style="display: inline-block;width: 28%;padding: 5px;">
				<h3>Dirección : <span class="nombre" style="color: #666;">{{$pedido->direccion}}</span></h3>
			</div><br>
			<div class="infoHeader" style="display: inline-block;width: 28%;padding: 5px;">
				<h3>Telefono : <span class="nombre" style="color: #666;">{{$pedido->telefono}}</span></h3>
				
			</div>
			<div class="infoHeader" style="display: inline-block;width: 28%;padding: 5px;">
				<h3>Metodo envio : <span class="nombre" style="color: #666;">{{$pedido->nom_metodo}}-${{number_format($pedido->vlr_envio, 0, '', '.')}}</span></h3>
				
			</div>

			
		</div>
	</header><!-- /header -->
	<div class="detalle">
		<h2>Detalle pedido (Nro:{{$pedido->id}})</h2>

		<table class="table" style="margin: 0px;padding: 0px;width: 100%;box-shadow: 10px 10px 5px #888888;border: 1px solid #000000;-moz-border-radius-bottomleft: 0px;-webkit-border-bottom-left-radius: 0px;border-bottom-left-radius: 0px;-moz-border-radius-bottomright: 0px;-webkit-border-bottom-right-radius: 0px;border-bottom-right-radius: 0px;-moz-border-radius-topright: 0px;-webkit-border-top-right-radius: 0px;border-top-right-radius: 0px;-moz-border-radius-topleft: 0px;-webkit-border-top-left-radius: 0px;border-top-left-radius: 0px;">
			<caption>Items de tu pedido</caption>
			<thead>
				<tr>
					<th>Id</th>
					<th>Articulo</th>
					<th>Cantidad</th>
					<th>Valor unitario</th>
					<th>Iva</th>
					<th>Valor total</th>

				</tr>
			</thead>
			<tbody>
				@foreach($items as $item)
					<tr>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item->id_producto}}</td>

						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item->nombre}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item->cantidad}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">${{number_format($item->valor_unitario, 0, '', '.')}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">{{$item->iva}}</td>
						<td style="vertical-align: middle;border: 1px solid #000000;border-width: 0px 0px 1px 0px;text-align: left;padding: 7px;font-size: 10px;font-family: Arial;font-weight: normal;color: #000000;">${{number_format($item->valor_total, 0, '', '.')}}</td>

					</tr>
				@endforeach	
			</tbody>
		</table>
		<div class="totalCompra">
			<h2>TOTAL COMPPRA :  ${{number_format($pedido->total_compra, 0, '', '.')}} </h2>
			
		</div>
		
	</div>

</body>
</html>
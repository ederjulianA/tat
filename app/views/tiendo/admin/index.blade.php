@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop

<style type="text/css">
  .contenedor
  {
    max-width: 100%;
    width: 80%;
    margin: 0 auto;
    text-align: center;
  }

  .pedidoItem{
    max-width: 100%;
    width: 90%;
    margin: 5% auto;
    border-bottom: 2px solid #415A75;
    background-color: #648CB7;
    color: #fff;
  }
  .pedidoItem h4, .pedidoItemRuta h4  {
    font-weight: bold;
    color: #fff;
    text-shadow: 1px 2px 2px rgba(0,0,0,.5);
  }
  .pedidoItemRuta {
     max-width: 100%;
    width: 90%;
    margin: 5% auto;
    border-bottom: 2px solid #971E30;
    background-color: #BB2138;
    color: #fff;
  }

</style>

@section('titulo1')
  HOME
@stop

@section('content')
  <div class="contenedor">
    
  
    <div class="row">
        <div class="col-md-4">
          <h2>Pedidos Inmediatos</h2>

          @foreach($pedidosYa as $pedido)
          <a href="/admin/pedido/{{$pedido->id}}"><div class="pedidoItem">
            <h4>{{$pedido->nombre}} {{$pedido->apellido}}</h4>
            <P>Valor : ${{number_format($pedido->total_compra, 0, '', '.')}}</P>
            
          </div></a>
          @endforeach
        
          
        </div>

        <div class="col-md-4">
          <h2>Pedidos Ruta</h2>
          @foreach($pedidosRuta as $pruta)
          <a href="/admin/pedido/{{$pruta->id}}"><div class="pedidoItemRuta">
            <h4>{{$pruta->nombre}} {{$pruta->apellido}}</h4>
            <P>Valor : ${{number_format($pruta->total_compra, 0, '', '.')}}</P>
            
          </div></a>
          @endforeach
        </div>
      
  
    </div>
  </div>  
@stop
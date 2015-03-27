<!DOCTYPE html>
<html>
<head>
  <title> Load Ajax productos</title>
   <!--<link href="{{asset('admin2/css/bootstrap.min.css')}}" rel="stylesheet">
  <script src="{{asset('admin2/js/jquery.js')}}"></script>--> <!-- jQuery -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>-->
<!--<script src="{{asset('admin2/js/bootstrap.min.js')}}"></script>--> <!-- Bootstrap -->

<!--<script src="{{asset('tat/js/app.js')}}"></script>--> <!-- Charts & Graphs -->
</head>
<body>
<!--<div class="container" ng-app="EderApp">
  <div class="row" ng-controller="SearchCtrl">
    <div class="col-md-6">
      <h1>Buscador</h1>
        <div>
          <h3>Nombre: </h3>

          @{{ searchInput }}
          <input type="text" class="form-control" ng-model="searchInput" ng-change="search()">
          <div class="list-group">
              <a href="" title="" class="list-group-item" ng-repeat="pro in productos">
                <h4 class="list-group-item-heading" >
                  @{{ pro.pro_nom}}
                </h4>
                <p class="list-group-item-text">
                  @{{ pro.precio}}
                </p>
              </a>
           </div> 
        </div>
      
    </div>

  </div>
  
</div>-->
  <div class="container" >
  <div class="row" >
    <div class="col-md-6">
      <h1>Buscador</h1>
        <div>
          <h3>Nombre: </h3>

          
          <input type="text" class="form-control" id="inputSearch">
          <input type="hidden" id="urlBuscarProd" value="{{URL::route('urlBuscarProd')}}">
       
        </div>
      
    </div>

  </div>
  
</div>
   <table class="table table-responsive">
              <th>Id</th>
              <th>Nombre</th>
              <th>Precio</th>
              
              <th>IVA</th>
              <th>Acción</th>
              <tbody id="contenedor-prod">
              @foreach($productos as $pro)
                <tr>
                  <td>{{$pro->id}}</td>
                  <td>{{$pro->pro_nom}}</td>
                
                  <td>${{number_format($pro->precio, 0, '', '.')}}</td>
                  <td>{{$pro->por_iva}}</td>
                  <td colspan="" rowspan="" headers=""><a href="#" class="itemP btn btn-info" id="itemP-{{$pro->id}}" data="{{$pro->id}}" title="">Agregar</a></td>
                  
                </tr>
              @endforeach
              </tbody>
    </table>
</body>
</html>



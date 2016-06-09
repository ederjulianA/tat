<table class="table">
      <thead>
        <th>Id producto</th>
        <th>ArtCod</th>
        <th>Nombre</th>
        
        <th>Acciones</th>
      </thead>
      <tbody id="cont-pro">
        @foreach($productos as $pro)
          <tr>
            
            <td>{{$pro->id}}</td>
            <td>{{$pro->id_mantis}}</td>
            <td>{{$pro->pro_nom}} </td>
          
          
            <td><a href="/admin/articulo/{{$pro->id}}" class="btn btn-success">Editar Descripción</a></td>
          </tr>
        @endforeach
      </tbody>

      
    </table>
     {{$productos->links()}}
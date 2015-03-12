 <table class="table table-responsive">
              <th>Id</th>
              <th>Nombre</th>
              <th>Precio</th>
              
              <th>IVA</th>
              <th>Acción</th>
              @foreach($productos as $pro)
                <tr>
                  <td>{{$pro->id}}</td>
                  <td>{{$pro->pro_nom}}</td>
                
                  <td>${{number_format($pro->precio, 0, '', '.')}}</td>
                  <td>{{$pro->por_iva}}</td>
                  <td colspan="" rowspan="" headers=""><a href="#" class="itemP" id="itemP-{{$pro->id}}" data="{{$pro->id}}" title="">Agregar</a></td>
                  
                </tr>
              @endforeach
            </table>
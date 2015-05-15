
<!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-dropdown"><a href="#">Navegación</a></div>

        <!--- Sidebar navigation -->
        <!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
        <ul id="nav">
          <!-- Main menu with font awesome icon -->
          <li class="open"><a href="/admin"><i class="fa fa-tag"></i> Home</a>
            <!-- Sub menu markup 
            <ul>
              <li><a href="#">Submenu #1</a></li>
              <li><a href="#">Submenu #2</a></li>
              <li><a href="#">Submenu #3</a></li>
            </ul>-->
          </li>
        	  
              <li><a href="/admin/pedidos"><i class="fa fa-cubes"></i> Pedidos</a></li> 
              <li><a href="/admin/productos"><i class="fa fa-shopping-cart"></i> Productos</a></li> 
              <li><a href="/admin/barrios"><i class="fa fa-bus"></i> Barrios</a></li>
             

               <li class="has_sub">
                  <a href="#"><i class="fa fa-cogs"></i> Generales  <span class="pull-right"><i class="fa fa-sort-desc" id="g"></i></span></a>
            <ul>
              <li><a href="{{ URL::route('adminTipEnt')}}">Tipos de entrega</a></li>
              <li><a href="{{ URL::route('adminpromociones')}}">Promociones</a></li>
              
            </ul>
          </li> 
              
          </ul>
    </div>

    <!-- Sidebar ends -->
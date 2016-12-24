<link rel="stylesheet" href="http://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css">

<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <!-- <a class="navbar-brand" href="#"><img src="http://d2r8jqmejizzox.cloudfront.net/361456-853098-65x38-logofinal.png"></a>-->
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="navbar-collapse style= collapse in" id="bs-megadropdown-tabs" style="
    padding-left: 0px;
">
        <ul class="nav navbar-nav">
            <li><a href="/"><i class="fa fa-globe"></i> Inicio</a></li>
            
            
      <li class="dropdown mega-dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-tag"></i> CATEGORIAS <span class="caret"></span></a>       
        <div id="filters" class="dropdown-menu mega-dropdown-menu">
                    <div class="container-fluid2">
                <!-- Tab panes -->
                        <div class="tab-content">
                         
                          <div class="row">
                          @foreach($menu as $m)
                              <div class="col-md-3">
                                
                                <a href="/categoria/{{$m->InvGruCod}}">{{$m->InvGruNom}} </a>
                              </div>
                            @endforeach
                          </div>
                          <!--<div class="tab-pane active" id="kids">
                            <ul class="nav-list list-inline">
                                <li><a data-filter=".89" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Running.png"><span>BRICS</span></a></li>
                                <li><a data-filter=".97" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Basketball.png"><span>Latin America</span></a></li>
                                <li><a data-filter=".96" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Football.png"><span>USA</span></a></li>
                                <li><a data-filter=".87" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Soccer.png"><span>Middle East</span></a></li>
                                <li><a data-filter=".85" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_MensTraining.png"><span>Asia</span></a></li>
                               <li><a data-filter=".90" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_MensTraining.png"><span>Africa</span></a></li>
                            </ul>
                          </div>
                          <div class="tab-pane" id="sports">
                            <ul class="nav-list list-inline">                                
                                <li><a data-filter=".38" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Basketball.png"><span>Technology</span></a></li>
                                <li><a data-filter=".41" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Football.png"><span>Music</span></a></li>
                                <li><a data-filter=".62" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Soccer.png"><span>Startups</span></a></li>
                                <li><a data-filter=".82" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_MensTraining.png"><span>Celebrities</span></a></li>
                                <li><a data-filter=".93" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_WomensTraining.png"><span>Entertainment</span></a></li>
                                <li><a data-filter=".94" href="#"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_WomensTraining.png"><span>Series</span></a></li>
                            </ul>
                          </div>
                        </div>-->
                    </div>
                    <!-- Nav tabs -->
                                      
        </div>        
      </li>
      <li><a href="#"><i class="fa fa-university"></i> LA COOPERATIVA</a></li>
      <li><a href="#"><i class="fa fa-university"></i> NOSOTROS</a></li>
      <li><a href="#"><i class="fa fa-envelope-open"></i> CONTACTO</a></li>

        </ul>
       
         <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> 
                        <strong>Nombre</strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul style="background-color:white;" class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                            <span class="glyphicon glyphicon-user icon-size"></span>
                                        </p>
                                    </div>
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong>Nombre Apellido</strong></p>
                                        <p class="text-left small">correoElectronico@email.com</p>
                                        <p class="text-left">
                                            <a href="#" class="btn btn-primary btn-block btn-sm">Actualizar Datos</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                      
                    </ul>
                </li>
           <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">INICIA SESIÓN <span class="caret"></span></a>
             <ul id="login-dp" class="dropdown-menu">
          <li>
           <div class="row">
              <div class="col-md-12">
                Login via 
                <div class="social-buttons">
                  <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                  <a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
                </div>
                                or
                 <form class="form" role="form" method="post" action="{{URL::route('postLogin')}}" accept-charset="UTF-8" id="login-nav">
                    <div class="form-group">
                       <label class="sr-only" for="exampleInputEmail2">Email address</label>
                       <input type="email" class="form-control" id="exampleInputEmail2" name="email" placeholder="Email address" required="">
                    </div>
                    <div class="form-group">
                       <label class="sr-only" for="exampleInputPassword2">Password</label>
                       <input type="password" class="form-control" id="exampleInputPassword2" name="password" placeholder="Password" required="">
                                             <div class="help-block text-right"><a href="">Forget the password ?</a></div>
                    </div>
                    <div class="form-group">
                       <button type="submit" class="btn"><span class="fa fa-user"></span> LOGIN</button>
                    </div>
                    <div class="checkbox">
                       <label>
                       <input type="checkbox"> keep me logged-in
                       </label>
                    </div>
                 
              </div>
              <div class="bottom text-center">
              
              </div>
              </form>
           </div>
        </li>
      </ul>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


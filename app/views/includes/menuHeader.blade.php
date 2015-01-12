<ul class="nav navbar-nav pull-left">
									<li>
										<a href="{{URL::route('index')}}">
											<i class="fa fa-home" title="Home"></i>
											<span class="hidden-sm hidden-xs">
												Home
											</span>
										</a>
									</li>
									<!--<li>
										<a href="#">	
											<i class="fa fa-heart" title="Wish List"></i>
											<span class="hidden-sm hidden-xs">
												Wish List(0)
											</span>
										</a>
									</li>-->
									<li>
										<a href="{{URL::route('micuenta')}}">
											<i class="fa fa-user" title="My Account"></i>
											<span class="hidden-sm hidden-xs">
												Mi Cuenta
											</span>
										</a>
									</li>
									<li>
										<a href="/cart">
											<i class="fa fa-shopping-cart" title="Shopping Cart"></i>
											<span class="hidden-sm hidden-xs">
												Carrito de compras
											</span>
										</a>
									</li>
									<li>
										<a href="{{URL::route('checkout')}}">
											<i class="fa fa-crosshairs" title="Checkout"></i>
											<span class="hidden-sm hidden-xs">
												Mi pedido
											</span>
										</a>
									</li>

									@if(!Auth::check())
										<li>
											<a href="/register">
												<i class="fa fa-unlock" title="Register"></i>
												<span class="hidden-sm hidden-xs">
													Registrarse
												</span>
											</a>
										</li>
										<li>
											<a href="/login">
												<i class="fa fa-lock" title="Login"></i>
												<span class="hidden-sm hidden-xs">
													Ingresar
												</span>
											</a>
										</li>
									@else
										<li>
											<a href="/logout">
												<i class="fa fa-lock" title="Login"></i>
												<span class="hidden-sm hidden-xs">
													Cerrar Sesión
												</span>
											</a>
										</li>
									@endif	
								</ul>
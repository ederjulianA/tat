<ul class="nav navbar-nav">
							<li><a href="/">Home</a></li>
							<li class="dropdown">
								<a href="category-list.html" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="10">
									Sub menu simple 
								</a>
								<ul class="dropdown-menu" role="menu">
									<li><a tabindex="-1" href="#">opción 1</a></li>
									<li><a tabindex="-1" href="#">opción 2</a></li>
									<li><a tabindex="-1" href="#">opción 3</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="category-list.html" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="10">Menu categorias</a>
								<div class="dropdown-menu">
									<div class="dropdown-inner">
										@foreach($categorias as $cat)
											
												<ul class="list-unstyled">
													<li class="dropdown-header">{{$cat->cat_nom}}</li>
													@foreach($cat->producto as $pro)
														<li><a tabindex="-1" href="#">{{$pro->pro_nom}}</a></li>
														
													@endforeach	
												</ul>
																				
										@endforeach
									</div>
								</div>
							</li>
							<li><a href="category-list.html">Menu item</a></li>
							
                            <!--<li class="dropdown">
									<a href="category-list.html" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="10">
										Pages
									</a>
									<ul class="dropdown-menu" role="menu">
										<li><a tabindex="-1" href="index.html">Home</a></li>
			                            <li><a tabindex="-1" href="about.html">About</a></li>
										<li><a tabindex="-1" href="category-list.html">Category List</a></li>
										<li><a tabindex="-1" href="category-grid.html">Category Grid</a></li>
										<li><a tabindex="-1" href="product.html">Product</a></li>
										<li><a tabindex="-1" href="product-full.html">Product Full Width</a></li>
			                            <li><a tabindex="-1" href="cart.html">Cart</a></li>
			                            <li><a tabindex="-1" href="login.html">Login</a></li>
			                            <li><a tabindex="-1" href="compare.html">Compare Products</a></li>
										<li><a tabindex="-1" href="typography.html">Typography</a></li>
										<li><a tabindex="-1" href="register.html">Register</a></li>
			                            <li><a tabindex="-1" href="contact.html">Contact</a></li>
										<li><a tabindex="-1" href="404.html">404</a></li>
									</ul>
								</li>-->
						</ul>
<ul class="nav navbar-nav">
							<li><a href="/">Home</a></li>
							<li><a href="/catalogo">Todos los productos</a></li>
							<!--<li class="dropdown">
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
														<li><a tabindex="-1" href="/producto/{{$pro->slug}}">{{$pro->pro_nom}}</a></li>
														
													@endforeach	
												</ul>
																				
										@endforeach
									</div>
								</div>
							</li>-->
							<!--@foreach($categorias as $cat)
								<li class="dropdown"><a href="/categoria/{{$cat->id}}" class="dropdown-toggle" data-toggle="	dropdown" data-hover="dropdown" data-delay="10">{{$cat->cat_nom}}</a>

								</li>
								<ul class="dropdown-menu" role="menu">
									@foreach($cat->producto as $pro)
										<li><a tabindex="-1" href="index.html">Home</a></li>
									@endforeach	
								</ul>
							@endforeach-->
							@foreach($categorias as $cat)
                            <li class="dropdown">
									<a href="category-list.html" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="10">
										{{$cat->cat_nom}}
									</a>
									<ul class="dropdown-menu" role="menu">
										@foreach($cat->producto as $pro)
											<li><a tabindex="-1" href="/producto/{{$pro->slug}}">{{$pro->pro_nom}}</a></li>
			                            @endforeach	
									</ul>
								</li>
								@endforeach
						</ul>
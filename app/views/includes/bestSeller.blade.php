<h3 class="side-heading">Promociones</h3>
					@foreach($promo as $p)
						
					
					<div class="product-col">
						<div class="image">
							<img src="{{asset($p->imgC)}}" alt="product" class="img-responsive" />
						</div>
						<div class="caption">
							<h4>
								<a href="">{{$p->titulo}}</a>
							</h4>
							<div class="description">
								
							</div>
							<div class="price">
								<span class="price-new">${{number_format($p->valor, 0, '', '.')}}</span> 
								<!--<span class="price-old">$249.50</span>-->
							</div>
							<div class="cart-button button-group">
								<button type="button" title="Wishlist" class="btn btn-wishlist">
									<i class="fa fa-heart"></i>
								</button>
								<button type="button" title="Compare" class="btn btn-compare">
									<i class="fa fa-bar-chart-o"></i>
								</button>
								<button type="button" class="btn btn-cart">
									Ver
									<i class="fa fa-shopping-cart"></i> 
								</button>									
							</div>
						</div>
					</div>

					@endforeach
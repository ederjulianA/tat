<div id="cart" class="btn-group btn-block">
								<button type="button" data-toggle="dropdown" class="btn btn-block btn-lg dropdown-toggle">
									<i class="fa fa-shopping-cart"></i>
									Cart: 
									<span id="cart-total">{{Cart::totalItems()}} item(s) - ${{number_format(Cart::total(), 0, '', '.')}}</span>
									<i class="fa fa-caret-down"></i>
								</button>
								@if(!$products)
								<ul class="dropdown-menu">
									
									<li>
										<p class="text-center">Tu carrito esta vacio!</p>
									</li>
																		
								</ul>

								@else
									<ul class="dropdown-menu pull-right">
									<li>
										<table class="table hcart">
											<tr>
												<td class="text-center">
													<a href="product.html">
														<img src="images/product-images/hcart-thumb1.jpg" alt="image" title="image" class="img-thumbnail img-responsive" />
													</a>
												</td>
												<td class="text-left">
													<a href="product-full.html">
														Seeds
													</a>
												</td>
												<td class="text-right">x 1</td>
												<td class="text-right">$120.68</td>
												<td class="text-center">
													<a href="#">
														<i class="fa fa-times"></i>
													</a>
												</td>
											</tr>
											<tr>
												<td class="text-center">
													<a href="product.html">
														<img src="images/product-images/hcart-thumb2.jpg" alt="image" title="image" class="img-thumbnail img-responsive" />
													</a>
												</td>
												<td class="text-left">
													<a href="product-full.html">
														Organic
													</a>
												</td>
												<td class="text-right">x 2</td>
												<td class="text-right">$240.00</td>
												<td class="text-center">
													<a href="#">
														<i class="fa fa-times"></i>
													</a>
												</td>
											</tr>
										</table>
									</li>
									<li>
										<table class="table table-bordered total">
											<tbody>
												<tr>
													<td class="text-right"><strong>Sub-Total</strong></td>
													<td class="text-left">$1,101.00</td>
												</tr>
												<tr>
													<td class="text-right"><strong>Eco Tax (-2.00)</strong></td>
													<td class="text-left">$4.00</td>
												</tr>
												<tr>
													<td class="text-right"><strong>VAT (17.5%)</strong></td>
													<td class="text-left">$192.68</td>
												</tr>
												<tr>
													<td class="text-right"><strong>Total</strong></td>
													<td class="text-left">$1,297.68</td>
												</tr>
											</tbody>
										</table>
										<p class="text-right btn-block1">
											<a href="cart.html">
												View Cart
											</a>
											<a href="#">
												Checkout
											</a>
										</p>
									</li>									
								</ul>

								@endif
							</div>
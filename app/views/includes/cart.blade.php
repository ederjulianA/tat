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
											@if($products)
												@foreach($products as $pro)		
														<tr>
															<td class="text-center">
																<a href="product.html">
																	<img src="{{asset($pro->image)}}" alt="image" title="image" class=""  height="80px" width="auto"/>
																</a>
															</td>
															<td class="text-left">
																<a href="product-full.html">
																	{{$pro->name}}
																</a>
															</td>
															<td class="text-right">x {{$pro->quantity}}</td>
															<td class="text-right">${{number_format($pro->price, 0, '', '.')}}</td>
															<td class="text-center">
																<a href="#">
																	<i class="fa fa-times"></i>
																</a>
															</td>
														</tr>
													@endforeach	
											@endif	
										</table>
									</li>
									<li>
										<table class="table table-bordered total">
											<tbody>
												<tr>
													<td class="text-right"><strong>Sub-Total</strong></td>
													<td class="text-left">${{number_format(Cart::total(), 0, '', '.')}}</td>
												</tr>
												<!--<tr>
													<td class="text-right"><strong>Eco Tax (-2.00)</strong></td>
													<td class="text-left">$4.00</td>
												</tr>
												<tr>
													<td class="text-right"><strong>VAT (17.5%)</strong></td>
													<td class="text-left">$192.68</td>
												</tr>-->
												<tr>
													<td class="text-right"><strong>Total</strong></td>
													<td class="text-left">${{number_format(Cart::total(), 0, '', '.')}}</td>
												</tr>
											</tbody>
										</table>
										<p class="text-right btn-block1">
											<a href="/cart">
												Ver pedido
											</a>
											<a href="#">
												Ordenar
											</a>
										</p>
									</li>									
								</ul>

								@endif
							</div>
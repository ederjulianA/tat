<h3 class="side-heading">Categorias</h3>
					<div class="list-group">
						@foreach($categorias as $cat)
							<a href="category-grid.html" class="list-group-item">
								<i class="fa fa-chevron-right"></i>
								{{$cat->cat_nom}}
							</a>
						@endforeach	
						
					</div>
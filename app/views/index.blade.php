@extends('layouts.front')

@section('cart-items')
	@include('includes.cart')
	
@stop

@section('slider')
	<!-- Slider Section Starts -->
		<div class="slider">
			<div class="container">
				<div id="main-carousel" class="carousel slide" data-ride="carousel">
					<!-- Wrapper For Slides Starts -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="{{asset('tat/images/slider-imgs/slide.jpg')}}" alt="Slider" class="img-responsive" />
							</div>
							<div class="item">
								<img src="{{asset('tat/images/slider-imgs/slide2.jpg')}}" alt="Slider" class="img-responsive" />
							</div>
						</div>
					<!-- Wrapper For Slides Ends -->
					<!-- Controls Starts -->
						<a class="left carousel-control" href="#main-carousel" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#main-carousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					<!-- Controls Ends -->
				</div>				
			</div>
		</div>
	<!-- Slider Section Ends -->
@stop
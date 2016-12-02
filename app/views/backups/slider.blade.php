<div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                {{--<li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>--}}
                                @foreach($bans as $b)
                                    <li data-target="#carousel-example-generic" data-slide-to="{{$b->pos}}"></li>
                                @endforeach
                            </ol>
                            <div class="carousel-inner">
                                @foreach($bans as $b)
                                <div class="item itemB">
                                    <img class="slide-image" height="350px" src="{{asset($b->img)}}" alt="{{$b->titulo}}">
                                </div>
                                @endforeach
                                {{--<div class="item active">
                                    <img class="slide-image" src="{{asset('cot/img/slider/b1.jpg')}}" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="{{asset('cot/img/slider/b2.jpg')}}" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="{{asset('cot/img/slider/b3.jpg')}}" alt="">
                                </div>--}}
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>










            <div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            @foreach($bans as $b)
                <div class="item active">
                    <!--<img src="http://placehold.it/1200x400/16a085/ffffff&text=About Us">-->
                    <img class="slide-image" height="350px" src="{{asset($b->img)}}" alt="{{$b->titulo}}">
                    <div class="carousel-caption">
                        <h3>
                            Headline</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
                            tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem
                            ipsum dolor sit amet, consetetur sadipscing elitr.</p>
                    </div>
                </div>
            <!-- End Item -->
            @endforeach
           
        </div>
        <!-- End Carousel Inner -->
        <ul class="nav nav-pills nav-justified">
         @foreach($bans as $b)
             <li data-target="#myCarousel" data-slide-to="0" class="active"><a href="#">About<small>Lorem
                ipsum dolor sit</small></a></li>
          @endforeach
        </ul>
    </div>
    <!-- End Carousel -->
</div>
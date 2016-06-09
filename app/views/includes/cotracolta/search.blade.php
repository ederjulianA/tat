

 										<div class="input-group pull-right">
 										<form method="get" action="{{URL::route('buscador',array('f'=>'p','o'=>'asc'))}}" class="">
                                            <input type="text" value=""placeholder="Qué estas buscando ?" name="keyword" onfocus="if(this.value=='Buscar productos')this.value='';" onblur="if(this.value=='')this.value='Buscar productos';" class="search-input form-control product-search-height">
                                            <span class="input-group-btn">
                                            <button type="submit" class="subscribe-btn btn product-search-height"><i class="fa fa-search"></i></button>
                                            </span>

                                           </form> 
                                        </div>  
                                        <!-- /Product Search  -->

<style type="text/css">
	form.sb {
                width:500px;
                /*margin:50px auto;*/
}
.search {
				width: 60%;
                padding:8px 15px;
                background:rgba(50, 50, 50, 0.2);
                border:0px solid #dbdbdb;
}
.buttonE {
                width: 15%;
                position:relative;
                padding:6px 15px;
                left:-8px;
                border:2px solid #189000;
                background-color:#59ab02;
                color:#fafafa;
}
.buttonE:hover  {
                background-color:#fafafa;
                color:#207cca;
}
.selOrd {
	width: 22% !important;
}
</style>
 										<div class="input-group pull-right ed" >
 											<form method="get" action="{{URL::route('buscador',array('f'=>'p'))}}" class="sb">
                                                <select class="selectpicker selOrd" name="ord" id="selSea" value="{{$ord}}">
                                                    <option value="asc" <?=$ord == 'asc' ? ' selected="selected"' : '';?>> (-) precio</option>
                                                    <option value="desc"<?=$ord == 'desc' ? ' selected="selected"' : '';?>> (+) Precio</option>
                                                </select>
                            				    <input type="text" class="search" name="keyword" placeholder="Qué estas buscando ?" required value="{{$keyword}}">
                                				<input type="submit"class="buttonE" value="Buscar">
											</form>

 										{{--<form method="get" action="{{URL::route('buscador',array('f'=>'p','o'=>'asc'))}}" class="">
                                            <input type="text" value=""placeholder="Qué estas buscando ?" name="keyword" onfocus="if(this.value=='Buscar productos')this.value='';" onblur="if(this.value=='')this.value='Buscar productos';" class="search-input form-control product-search-height">
                                            <span class="input-group-btn">
                                            <button type="submit" class="subscribe-btn btn product-search-height"><i class="fa fa-search"></i></button>
                                            </span>

                                           </form>--}}
                                        </div>  
                                        <!-- /Product Search  -->
@extends('layouts.tiendo')



@section('menu-left')
		@include('includes.admin.menuLeft')
@stop


@section('content')
@if(Session::has('message-alert'))
      <div class="row">
      <div class="col-md-5">
         

            <div class="alert alert-warning alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <strong>Mensaje</strong> {{Session::get('message-alert')}}
            </div>

            <!--<p class="mensajes-flash" style="" data-dismiss="alert"id="mensaje-flash"> {{Session::get('message-alert')}}
                
            </p>-->
        
        
      </div>
      
    </div>
 @endif





	  <div class="row">
	        <div class="col-md-12">
	        	<h2>Departamentos</h2>
	        </div>
      </div>
      <div class="row">
      	<div class="col-md-12">
      		<a href="{{URL::route('departamentosSync')}}" title="">Sincronizar</a>
      		<table class="table table-hover">
			  	<thead>
			  		<tr>
			  			<th>ID departamento</th>
			  			<th>Nommbre departamento</th>
			  		</tr>
			  	</thead>
			  	<tbody>
			  		@foreach($deps as $dep)
				  		<tr>
				  			<td>{{$dep->id}}</td>
				  			<td>{{$dep->DepNom}}</td>
				  			
				  		</tr>
				  	@endforeach	
			  	</tbody>
			</table>
      	</div>	
      	
      </div> 
@stop
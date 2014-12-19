<?php

class EmpresaController extends BaseController {

	public function getIndex()
	{
		$user = Auth::user()->id;
		return View::make('tiendo.admin.index',compact('user'));
	}
}
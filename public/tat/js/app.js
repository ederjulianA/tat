'use strict';

var EderApp = angular.module('EderApp',[]);

EderApp.controller('SearchCtrl',function($scope, $http){
	$scope.search = function () {
		$http.get('results', {
			params: {name: $scope.searchInput}
		}).success(function(data){
			$scope.productos = data;
			
		});
	}
});
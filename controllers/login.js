var app = angular.module('login',['login-module']);

app.controller('loginCtrl',function($scope,loginService) {
	
	$scope.formHolder = {};
	$scope.views = {};
	$scope.account = {};
	
	$scope.views.year = "";
	
	var d = new Date();
	$scope.views.year = d.getFullYear();
	
	$scope.login = loginService.login;
	
});
var app = angular.module('settings',['account-module','toggle-fullscreen','settings-module']);

app.controller('settingsCtrl',function($scope,fullscreen,settings) {

	$scope.configs = settings;

	$scope.configs.data($scope);

});
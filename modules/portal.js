angular.module('login-module', []).service('loginService', function($http, $window) {
	
	this.login = function(scope) {
		
		scope.views.incorrect = false;

		if (validate(scope)) {
			scope.views.incorrect = true;			
			scope.views.msg = 'Username and password are required';			
			return;
		};
		
		$http({
		  method: 'POST',
		  url: 'handlers/portal.php',
		  data: scope.account,
		  headers : {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(function mySucces(response) {

			if (response.data['login']) {
				scope.views.incorrect = false;
				$window.location.href = 'students.html';
			} else {
				scope.views.incorrect = true;
				scope.views.msg = 'Username or password incorrect';				
			};
			
		},
		function myError(response) {

		});
		
		function validate(scope) {					

			return scope.formHolder.login.$invalid;
			
		};		
		
	};	
	
});
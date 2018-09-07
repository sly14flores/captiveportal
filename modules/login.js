angular.module('login-module', []).service('loginService', function($http, $window) {
	
	this.login = function(scope) {
		
		scope.views.incorrect = false;

		if (validate(scope)) {
			scope.views.incorrect = true;			
			scope.views.msg = 'School ID and birthday are required';			
			return;
		};
		
		$http({
		  method: 'POST',
		  url: 'handlers/login.php',
		  data: scope.account,
		  headers : {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(function mySucces(response) {

			if (response.data.has_record) {
				
				switch (response.data.status) {
					
					case "new":
					
						$window.location.href = 'activated.html';
					
					break;
					
					case "old":
					
						$window.location.href = 'activated.html';				
					
					break;					
					
					case "expired":
					
						$window.location.href = 'expired.html';					
					
					break;
					
					case "inactive":
					
						$window.location.href = 'inactive.html';					
					
					break;
					
				};			

			} else {

				scope.views.incorrect = true;
				scope.views.msg = "No record found. Your information might have not been added yet. Please inform the school office";
				return;				

			};
			
		},
		function myError(response) {

		});
		
		function validate(scope) {					

			return scope.formHolder.login.$invalid;
			
		};		
		
	};	
	
});
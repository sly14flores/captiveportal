angular.module('login-module', []).service('loginService', function($http, $window) {
	
	this.login = function(scope) {
		
		scope.views.incorrect = false;
		
		scope.ip_url = "http://192.168.10.1";

		if (validate(scope)) {
			scope.views.incorrect = true;			
			scope.views.msg = 'School ID and birthday are required';			
			return;
		};
		
		let authaction = document.querySelector('#login').dataset.authaction;
		let authaction_s = authaction.split("?");
		let clientip_s = authaction_s[1].split("=");

		scope.account.ip = clientip_s[1];
		scope.account.tok = document.querySelector('#login').dataset.tok;
		
		$http({
		  method: 'POST',
		  url: 'handlers/login.php',
		  data: scope.account,
		  headers : {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(function mySucces(response) {

			if (response.data.has_record) {
				
				switch (response.data.status) {
					
					case "new":
					
						var redir = scope.ip_url+':2050/nodogsplash_auth/?tok='+response.data.tok+'&redir=';
						$window.location.href = redir;
					
					break;
					
					case "old":
					
						var redir = scope.ip_url+':2050/nodogsplash_auth/?tok='+response.data.tok+'&redir=';
						$window.location.href = redir;
					
					break;					
					
					case "expired":
					
						var redir = scope.ip_url+':8000/expired.html';		
						$window.location.href = redir;
					
					break;
					
					case "inactive":
					
						var redir = scope.ip_url+':8000/inactive.html';
						$window.location.href = redir;
					
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
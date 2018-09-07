angular.module('users-module', ['ui.bootstrap','bootstrap-modal','pnotify-module','block-ui']).factory('users', function($http,$timeout,$compile,bootstrapModal,pnotify,blockUI) {
	
	function users() {
		
		var self = this;
		
		self.data = function(scope) {
			
			scope.views = {};
			
			scope.views.currentPage = 1;
			
			scope.filter = {};
			
			scope.devices = [];
			
			scope.data = {};
			scope.data.users = [];
			
			schoolYears(scope);
			schoolYear(scope);
			
		};
		
		function schoolYears(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/school-years.php'
			}).then(function mySucces(response) {

				scope.school_years = response.data;

			}, function myError(response) {

			  // error

			});		
			
		};

		function schoolYear(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/school-year.php'
			}).then(function mySucces(response) {

				scope.filter.school_year = response.data;

			}, function myError(response) {

			  // error

			});		
			
		};

		self.filter = function(scope) {

			list(scope);
		
		};
		
		function list(scope) {
			
			scope.currentPage = scope.views.currentPage;
			scope.pageSize = 15;
			scope.maxSize = 5;			
			
			$http({
			  method: 'POST',
			  url: 'handlers/users.php',
			  data: scope.filter.school_year
			}).then(function mySucces(response) {
				
				angular.copy(response.data, scope.data.users);
				scope.filterData = scope.data.users;
				scope.currentPage = scope.views.currentPage;				

			}, function myError(response) {

			  // error

			});				
			
		};
		
		self.view = function(scope,user) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/devices.php',
			  data: user
			}).then(function mySucces(response) {
				
				scope.devices = response.data;
				bootstrapModal.box3(scope,'User Devices','dialogs/devices.html');
				$timeout(function() { initSwitch(); },1000);				

			}, function myError(response) {

			  // error

			});				
			
		};
		
		self.device = function(scope,device) {
			
			if (device.edit) {
				
				$http({
				  method: 'POST',
				  url: 'handlers/update-device.php',
				  data: device
				}).then(function mySucces(response) {
					
					pnotify.show('success','Notification','Device updated');				

				}, function myError(response) {

				  // error

				});
				
			};
			
			device.edit = !device.edit;
			
		};
		
		function initSwitch() {

			var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
			elems.forEach(function (html) {
				var switchery = new Switchery(html, {
					color: '#26B99A'
				});
			});

		};		

	};
	
	return new users();

});
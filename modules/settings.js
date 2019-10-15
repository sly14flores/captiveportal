angular.module('settings-module', ['bootstrap-modal','pnotify-module','block-ui']).factory('settings', function($http,$timeout,$compile,bootstrapModal,pnotify,blockUI) {
	
	function settings() {
		
		var self = this;
		
		self.data = function(scope) {
			
			// scope.host = "localhost";
			// scope.host = "lzds.blogsite.org";
			scope.host = "192.168.0.20";
			
			scope.views = {};
			
			scope.settings = {};
			
			scope.import = {};			
			scope.import.progress = {};
			
			scope.import.school_years = [];
			scope.import.progress.school_years = {};
			scope.import.progress.school_years.status = '';
			scope.import.progress.school_years.progress = '0';
			
			scope.import.students = [];
			scope.import.progress.students = {};
			scope.import.progress.students.status = '';
			scope.import.progress.students.progress = '0';		
			scope.filter = {};
			
			schoolYears(scope);
			schoolYear(scope);
			internetDuration(scope);
			
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

				scope.settings.school_year = response.data;

			}, function myError(response) {

			  // error

			});				
			
		};
		
		function internetDuration(scope) {
			
			$http({
			  method: 'GET',
			  url: 'handlers/internet-duration.php'
			}).then(function mySucces(response) {

				scope.settings.internet_duration = parseInt(response.data);

			}, function myError(response) {

			  // error

			});				
			
		};		
		
		self.downloadSy = function(scope) {

			blockUI.show();
		
			scope.import.progress.school_years.status = '';
			scope.import.progress.school_years.progress = '0';			
			
			$http({
			  method: 'GET',
			  url: 'http://'+scope.host+'/lzds/api/fetch-school-years.php',
			  headers : {'Content-Type': 'application/x-www-form-urlencoded'}			  
			}).then(function mySucces(response) {
				
				scope.import.school_years = response.data;
				blockUI.hide();				
				bootstrapModal.box3(scope,'Import School Years','dialogs/download-school-years.html');
				
				
			}, function myError(response) {

				blockUI.hide();			
				
			});				
			
		};
		
		self.startDownloadSy = function(scope) {
			
			scope.import.progress.school_years.status = 'Initializing import...';
			
			processImportSy(scope,0);
			
		};
		
		function processImportSy(scope,i) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/process-import-sy.php',
			  data: {i: i, sy: scope.import.school_years[i]}
			}).then(function mySucces(response) {

				scope.import.progress.school_years.status = 'Importing '+scope.import.school_years[i].school_year+'...';			
			
				++i;
				
				$timeout(function() {
		
					scope.import.progress.school_years.progress = Math.ceil(i*100/(scope.import.school_years.length));		
		
					if (i < scope.import.school_years.length) {
						
						processImportSy(scope,i);
						
					} else {
						
						$timeout(function() {
						
							scope.import.progress.school_years.status = 'School years import completed';
							
							schoolYears(scope);
							
						}, 500);
						
					};
	
				}, 500);
				
			}, function myError(response) {
						  
				
			});			
			
		};
		
		self.setSy = function(scope) {

			if (scope.settings.school_year === "") {
				pnotify.show('danger','Notification','Please select school year');			
				return;
			};
			
			blockUI.show();
			
			$http({
			  method: 'POST',
			  url: 'handlers/set-sy.php',
			  data: scope.settings.school_year
			}).then(function mySucces(response) {

				pnotify.show('success','Notification','School year '+scope.settings.school_year.school_year+' activated');			
				blockUI.hide();
			
			}, function myError(response) {

				blockUI.hide();

			});
			
		};
		
		self.downloadStudents = function(scope) {
			
			bootstrapModal.box3(scope,'Import Students','dialogs/download-students.html');			
			
		};
		
		self.startDownloadStudents = function(scope) {
			
			if (scope.filter.school_year === undefined) {
				
				pnotify.show('danger','Notification','Please select school year');				
				return;
				
			};
			
			blockUI.show();
			
			$http({
			  method: 'POST',
			  url: 'http://'+scope.host+'/lzds/api/fetch-students.php',
			  headers : {'Content-Type': 'application/x-www-form-urlencoded'},	  
			  data: scope.filter.school_year
			}).then(function mySucces(response) {
				
				scope.import.students = response.data;
				
				blockUI.hide();	
				
				$timeout(function() { processImportStudents(scope,0) }, 200);
				
			}, function myError(response) {

				blockUI.hide();	
				
			});				
			
		};
		
		function processImportStudents(scope,i) {
			
			$http({
			  method: 'POST',
			  url: 'handlers/process-import-student.php',
			  data: {i: i, student: scope.import.students[i]}
			}).then(function mySucces(response) {

				scope.import.progress.students.status = 'Importing '+scope.import.students[i].school_id+'...';			
			
				++i;
				
				$timeout(function() {
		
					scope.import.progress.students.progress = Math.ceil(i*100/(scope.import.students.length));		
		
					if (i < scope.import.students.length) {
						
						processImportStudents(scope,i);
						
					} else {
						
						$timeout(function() {
						
							scope.import.progress.students.status = 'Students import completed';
							
						}, 500);
						
					};
	
				}, 100);
				
			}, function myError(response) {
						  
				
			});	
			
		};
		
		self.setDuration = function(scope) {
			
			if (scope.settings.internet_duration === "") {
				pnotify.show('danger','Notification','Please enter number of hour(s)');			
				return;
			};
			
			blockUI.show();
			
			$http({
			  method: 'POST',
			  url: 'handlers/set-internet-duration.php',
			  data: {internet_duration: scope.settings.internet_duration}
			}).then(function mySucces(response) {

				pnotify.show('success','Notification','Internet usage was set to '+scope.settings.internet_duration);
				blockUI.hide();
			
			}, function myError(response) {

				blockUI.hide();

			});		
			
		};
		
	};
	
	return new settings();
	
});
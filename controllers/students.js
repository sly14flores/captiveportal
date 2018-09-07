var app = angular.module('students',['account-module','toggle-fullscreen','users-module']);

app.controller('studentsCtrl',function($scope,fullscreen,users) {
	
	$scope.users = users;
	
	$scope.users.data($scope);
	
});

app.filter('pagination', function() {
	  return function(input, currentPage, pageSize) {
	    if(angular.isArray(input)) {
	      var start = (currentPage-1)*pageSize;
	      var end = currentPage*pageSize;
	      return input.slice(start, end);
	    }
	  };
});
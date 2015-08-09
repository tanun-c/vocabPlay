'use strict'

angular.module 'nisyvocabApp'
.controller 'QuestionCtrl', ($scope, $http) ->
  $scope.message = 'Hello'

  $http.get('/api/questions/stat').success (res) ->
  	console.log(res)
  	$scope.stat = res
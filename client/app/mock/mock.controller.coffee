'use strict'

angular.module 'nisyvocabApp'
.controller 'MockCtrl', ($scope) ->
  $scope.message = 'Hello'

  $scope.chooseMenu = (item) ->
  	$scope.showingSubmenu = true
  	$scope.activeMenu = item
'use strict'

angular.module 'nisyvocabApp'
.controller 'SetCtrl', ($scope, $http) ->
  $scope.message = 'Hello'

  $scope.newSet = () ->
    $http
      .post 'api/sets', {}
      .success (res) ->
        $scope.update()

  $scope.update = () ->
    $http
      .get 'api/sets'
      .success (res) ->
        console.log res
        $scope.sets = res

  $scope.update()
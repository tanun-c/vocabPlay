'use strict'

angular.module 'nisyvocabApp'
.controller 'MainCtrl', ($scope, $http, socket, $modal) ->

  $scope.openPrice = () ->
    $modal.open
      # animation: $scope.animationsEnabled,
      templateUrl: 'app/main/mainpricemodal.html'
      # controller: 'ModalInstanceCtrl'
      size: 'lg'

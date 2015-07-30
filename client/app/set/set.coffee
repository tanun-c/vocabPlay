'use strict'

angular.module 'nisyvocabApp'
.config ($stateProvider) ->
  $stateProvider
    .state 'set',
      url: '/set'
      templateUrl: 'app/set/setmain.html'
      controller: 'SetCtrl'
    .state 'set-edit',
      url: '/set/:id/edit'
      templateUrl: 'app/set/setedit.html'
      controller: 'SetEditCtrl'
    .state 'set-play',
      url: '/set/:id'
      templateUrl: 'app/set/setplay.html'
      controller: 'SetPlayCtrl'

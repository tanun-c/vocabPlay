'use strict'

angular.module 'nisyvocabApp'
.config ($stateProvider) ->
  $stateProvider.state 'mock',
    url: '/mock'
    templateUrl: 'app/mock/mock.html'
    controller: 'MockCtrl'

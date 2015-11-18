'use strict'

angular.module 'nisyvocabApp'
.config ($stateProvider) ->
  $stateProvider.state 'mock-super',
    url: '/mock-super'
    templateUrl: 'app/mock-super/mock-super.html'
    controller: 'MockSuperCtrl'

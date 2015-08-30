'use strict'

angular.module 'nisyvocabApp'
.config ($stateProvider) ->
  $stateProvider.state 'mocknews',
    url: '/mocknews'
    templateUrl: 'app/mocknews/mocknews.html'
    controller: 'MocknewsCtrl'

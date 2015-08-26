'use strict'

angular.module 'nisyvocabApp'
.config ($stateProvider) ->
  $stateProvider.state 'mockcomment',
    url: '/mock2'
    templateUrl: 'app/mockcomment/mockcomment.html'
    controller: 'MockcommentCtrl'

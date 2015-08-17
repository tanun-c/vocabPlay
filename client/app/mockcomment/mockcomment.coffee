'use strict'

angular.module 'nisyvocabApp'
.config ($stateProvider) ->
  $stateProvider.state 'mockcomment',
    url: '/mockcomment'
    templateUrl: 'app/mockcomment/mockcomment.html'
    controller: 'MockcommentCtrl'

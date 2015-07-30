'use strict'

angular.module 'nisyvocabApp'
.config ($stateProvider) ->
  $stateProvider.state 'question',
    url: '/question'
    templateUrl: 'app/question/question.html'
    controller: 'QuestionCtrl'

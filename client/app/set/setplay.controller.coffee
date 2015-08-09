'use strict'

angular.module 'nisyvocabApp'
.controller 'SetPlayCtrl', ($scope, $http, $stateParams, $state, ngAudio) ->
  id = $stateParams.id
  index = 0
  $scope.totalRight = 0
  $scope.totalWrong = 0

  $scope.sound = {}
  $scope.sound.correct = ngAudio.load "/assets/sound/correct-answer.mp3"
  $scope.sound.incorrect = ngAudio.load "/assets/sound/wrong-answer.mp3"

  $scope.load = () ->
    $http
      .get '/api/sets/' + id
      .success (res) ->
        $scope.i = res
        $scope.i.questions = _.shuffle $scope.i.questions
        $scope.activeQuestion = res.questions[index]
        $scope.activeQuestion.choices = _.shuffle $scope.activeQuestion.choices

  $scope.nextQuestion = () ->
    index++
    $scope.activeQuestion = $scope.i.questions[index]
    if $scope.activeQuestion then $scope.activeQuestion.choices = _.shuffle $scope.activeQuestion.choices
    if !$scope.activeQuestion then $scope.finished = true
    $scope.answerSelected = false
  
  $scope.end = () ->
    $state.go 'set'

  $scope.check = (answer) ->

    if answer.correct
      $scope.answerSelected = true
      answer.right = true
      $scope.totalRight++
      $scope.sound.correct.play()
    else
      answer.wrong = true
      $scope.totalWrong++
      $scope.sound.incorrect.play()

    $scope.saveStat $scope.activeQuestion.question, answer

  $scope.saveStat = (question, answer) ->
    $http
      .post '/api/stats/', 
        question: question,
        correct: answer.correct,
        answer: answer.text,
        fromSet: id
      .success (res) ->

  $scope.load()
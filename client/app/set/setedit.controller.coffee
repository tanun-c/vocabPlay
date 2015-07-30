'use strict'

angular.module 'nisyvocabApp'
.controller 'SetEditCtrl', ($scope, $http, $stateParams, $state) ->
  id = $stateParams.id

  $scope.load = () ->
    $http
      .get '/api/sets/' + id
      .success (res) ->
        $scope.i = res

  $scope.newQuestion = () ->
    $scope.i.questions = [] unless $scope.i.questions?
    $scope.i.questions.push 
      choices: []

  $scope.setCorrectAnswer = (question, choice) ->

    for loopChoice in question.choices
      do (loopChoice) ->
        loopChoice.correct = false

    choice.correct = true

  $scope.removeQuestion = ($index) ->
    $scope.i.questions.splice $index, 1

  $scope.newChoice = (question) ->
    question.choices = [] unless question.choices?
    question.choices.push({})

  $scope.removeChoice = (question, $index) ->
    question.choices.splice $index, 1

  $scope.save = () ->
    $http
      .put '/api/sets/' + id, $scope.i
      .success (res) ->
        $scope.load()

  $scope.menu = () ->
    $state.go 'set'

  $scope.load()
    
'use strict'

angular.module 'nisyvocabApp'
.directive 'showWhenScroll', ($window) ->
  # template: '<div></div>'
  restrict: 'EA'
  link: ($scope, element, attrs, $document) ->
  	angular.element($window).on 'scroll', ->
  	  if ($window.scrollY > $window.innerHeight)
  	  	$scope.showMenuBtn = true
  	  else
  	  	$scope.showMenuBtn = false
  	  console.log $scope.showMenuBtn
    # element.text 'this is the ShowWhenScroll directive'
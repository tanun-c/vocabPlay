'use strict'

describe 'Controller: MocknewsCtrl', ->

  # load the controller's module
  beforeEach module 'nisyvocabApp'
  MocknewsCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MocknewsCtrl = $controller 'MocknewsCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1

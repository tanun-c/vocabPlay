'use strict'

describe 'Controller: MockCtrl', ->

  # load the controller's module
  beforeEach module 'nisyvocabApp'
  MockCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MockCtrl = $controller 'MockCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1

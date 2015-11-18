'use strict'

describe 'Controller: MockSuperCtrl', ->

  # load the controller's module
  beforeEach module 'nisyvocabApp'
  MockSuperCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MockSuperCtrl = $controller 'MockSuperCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1

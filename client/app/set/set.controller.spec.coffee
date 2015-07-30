'use strict'

describe 'Controller: SetCtrl', ->

  # load the controller's module
  beforeEach module 'nisyvocabApp'
  SetCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SetCtrl = $controller 'SetCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1

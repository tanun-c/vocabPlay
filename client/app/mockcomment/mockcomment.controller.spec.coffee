'use strict'

describe 'Controller: MockcommentCtrl', ->

  # load the controller's module
  beforeEach module 'nisyvocabApp'
  MockcommentCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MockcommentCtrl = $controller 'MockcommentCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1

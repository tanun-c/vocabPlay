'use strict'

describe 'Directive: ShowWhenScroll', ->

  # load the directive's module
  beforeEach module 'nisyvocabApp'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<-show-when-scroll></-show-when-scroll>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ShowWhenScroll directive'

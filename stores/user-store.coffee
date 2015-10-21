UserConstants = require '../constants/user-constants'
AppDispatcher = require '../dispatchers/app-dispatcher'
assign        = require 'object-assign'
{ EventEmitter } = require 'events'

CHANGE_EVENT = 'change'

_user =
  name: 'john'

UserStore = assign {}, EventEmitter.prototype,

  getUser: ->
    _user

  updateUser: (user) ->
    _user = assign {}, _user, user

  addChangeListener: (callback) ->
    @on(CHANGE_EVENT, callback)

  emitChange: () ->
    @emit(CHANGE_EVENT)

AppDispatcher.register (action) ->

  switch action.type

    when UserConstants.CREATE
      UserStore.updateUser action.payload
      UserStore.emitChange()

module.exports = UserStore

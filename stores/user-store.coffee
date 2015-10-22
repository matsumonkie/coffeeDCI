UserConstants = require '../constants/user-constants'
AppDispatcher = require '../dispatchers/app-dispatcher'
assign        = require 'object-assign'
{ EventEmitter } = require 'events'

CHANGE_EVENT = 'change'

_user =
  email: 'visitor'

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

    when UserConstants.SUBMIT_SIGN_IN
      # signin
      R.get('/search').end (err, res) ->
        console.log err

      if true
        UserStore.updateUser action.payload
        UserStore.emitChange()
      else
        # do nothing



module.exports = UserStore

AppDispatcher = require '../dispatchers/app-dispatcher'
UserConstants = require '../constants/user-constants'

UserActions =

  create: (payload) ->
    AppDispatcher.dispatch
      type: UserConstants.CREATE
      payload: payload

module.exports = UserActions

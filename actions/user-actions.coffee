AppDispatcher = require '../dispatchers/app-dispatcher'
UserConstants = require '../constants/user-constants'

UserActions =

  submitSignIn: (payload) ->
    AppDispatcher.dispatch
      type: UserConstants.SUBMIT_SIGN_IN
      payload: payload

module.exports = UserActions

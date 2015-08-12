module.exports = class Controller

  constructor: (@routes, @all = []) ->

  that = @
  record = (route) ->
    #that.all.push route

  get: (route, func) =>
    record(route)
    @routes.get route, func
    @

  post: (route, func) ->
    @routes.post route, func
    @

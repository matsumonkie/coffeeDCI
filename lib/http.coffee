module.exports = class Http

  constructor: (@r = R) ->

  get: (path) ->
    @r.get(path)

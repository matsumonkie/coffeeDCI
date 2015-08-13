module.exports = class Controller

  constructor: (@name, @router) ->
    @routes = {}
    @routes[@name] = {}

  record = (routes, routeInfo) ->
    { method, route } = routeInfo
    routes[method] ||= []
    routes[method].push route

  get: (route, func) =>
    @router.get route, func
    record @routes[@name], { method: 'get', route: route }
    @

  post: (route, func) ->
    @router.post route, func
    @

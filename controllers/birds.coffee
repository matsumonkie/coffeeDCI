Controller = require "#{APP_PATH}/controllers/controller"

module.exports = (app) ->
  new Controller(app)

    .get '/birds', (i, o) ->
      o.send('index')

    .get '/birds/new', (i, o) ->
      o.send('new')

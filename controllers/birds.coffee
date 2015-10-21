Controller = require "#{APP_PATH}/lib/controller"

module.exports = (app) ->

  new Controller('birds', app)

    .get '/birds', (i, o) ->
      o.render('birds/index.jade', title: new Date);

    .get '/birds/new', (i, o) ->
      o.send('new')

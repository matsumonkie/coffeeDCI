Controller = require "#{APP_PATH}/lib/controller"

module.exports = (app) ->

  new Controller('users', app)

    .get '/users', (i, o) ->
      o.render('users/index.jade', title: new Date);

    .get '/users/new', (i, o) ->
      o.send('new')

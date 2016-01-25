Controller = require "#{APP_PATH}/lib/controller"

module.exports = (app) ->

  new Controller('courts', app)

    .get '/courts', (i, o) ->
      o.render('courts/index.jade', title: new Date);

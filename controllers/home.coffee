Controller = require "#{APP_PATH}/lib/controller"

module.exports = (app) ->

  new Controller('home', app)

    .get '/', (i, o) ->
      o.render('home/index.jade', title: new Date)

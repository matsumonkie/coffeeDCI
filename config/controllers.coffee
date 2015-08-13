fs = require 'fs'

module.exports = (app) ->

  folder = "#{APP_PATH}/controllers"

  fs.readdir folder, (err, files) ->
    controllers = _.map files, (file) ->
      require("#{folder}/#{file}")(app)

    _.each controllers, (controller) ->
      console.log controller.routes

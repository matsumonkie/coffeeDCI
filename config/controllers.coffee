fs = require 'fs'

module.exports = (app) ->

  folder = "#{APP_PATH}/controllers"

  fs.readdir folder, (err, files) ->
    _.each files, (file) ->
      require("#{folder}/#{file}")(app)

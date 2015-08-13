express = require 'express'
global._ = require 'lodash'
fs = require 'fs'
global.APP_PATH = __dirname

class Config

  CONFIG_PATH = "#{APP_PATH}/config"

  constructor: (@app) ->

  setup: () ->
    setTemplateEngines(@app)
    loadAppConfig(@app)

  setTemplateEngines = (app) ->
    app.set('views', "#{APP_PATH}/views")
    #app.engine('html', require('jade').__express)

  loadAppConfig = (app) ->
    fs.readdir CONFIG_PATH, (err, files) =>
      _.each files, (file) =>
        require("#{CONFIG_PATH}/#{file}")(app)

class Server

  PORT = 3000

  constructor: (@app, @port = PORT) ->

  run: () ->
    server = app.listen @port, () ->
      host = server.address().address
      port = server.address().port

app = express()
new Config(app).setup()
new Server(app).run()

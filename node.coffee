librairies = require './librairies'
express = require 'express'
fs = require 'fs'

class NodeConfig

  CONFIG_PATH = "#{APP_PATH}/config"

  constructor: (@app) ->

  setup: () ->
    setTemplateEngines(@app)
    loadAppConfig(@app)

  setTemplateEngines = (app) ->
    app.set('views', "#{APP_PATH}/views")

  loadAppConfig = (app) ->
    fs.readdir CONFIG_PATH, (err, files) =>
      _.each files, (file) =>
        require("#{CONFIG_PATH}/#{file}")(app)

class Node

  PORT = 3000

  constructor: (@app, @port = PORT) ->

  run: () ->
    server = app.listen @port, () ->
      host = server.address().address
      port = server.address().port

app = express()
new NodeConfig(app).setup()
new Node(app).run()

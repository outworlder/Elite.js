express = require 'express'
jade = require 'jade'
coffee = require 'coffee-script'

app = express.createServer express.logger()

app.configure ->
  app.set 'view engine', 'coffee'
  app.register '.coffee', require('coffeekup').adapters.express
  app.use express.bodyParser()
  app.use express.static(__dirname + '/public')
  app.use "/assets", express.static(__dirname + "/public/assets")
  app.use express.methodOverride()
  app.use app.router

app.configure 'development', ->
  app.use (express.errorHandler(dumpExceptions: true, showStack: true))

app.get '/', (request, response) ->
  response.render 'index', { layout: no }

port = process.env.PORT || 3000
app.listen port, ->
  console.log("Listening on " + port)

#
# Copyright 2012 Kenichi Sato
#
express = require 'express'

app = express.createServer()
app.configure ->
  app.use express.favicon()
  app.use express.logger "dev"
  app.use express.static __dirname + "/public"

app.configure "development", ->
  app.use express.errorHandler()

port = process.env.PORT || 3000
app.listen port

console.log "URL server listening on port #{port}"


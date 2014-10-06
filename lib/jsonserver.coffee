'use strict'

exports.init = (options) ->
  log = if options.log? then options.log else true

  if !options.path
    return console.log 'Specify a path (ex: --path /your/file.json)'

  port = if options.port then options.port else 3000

  express    = require 'express'
  bodyParser = require 'body-parser'
  multipart  = require 'connect-multiparty'
  logger     = require 'morgan'
  DB         = require 'somewhere'
  app        = do express

  app.use bodyParser.urlencoded extended: true
  app.use do bodyParser.json
  app.use do multipart
  app.use logger 'combined' if log

  app.use (req, res, next) ->
    res.setHeader 'Access-Control-Allow-Credentials', true
    res.setHeader 'Access-Control-Allow-Headers', 'Content-Type'
    res.setHeader 'Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE'
    res.setHeader 'Access-Control-Expose-Headers', '*'
    res.setHeader 'Access-Control-Allow-Origin', '*'
    do next

  db = new DB options.path

  app.get '/:resource', (req, res) ->
    res.jsonp db.find req.params.resource

  app.get '/search/:resource', (req, res) ->
    res.jsonp db.find req.params.resource, req.query

  app.get '/:resource/:id', (req, res) ->
    res.jsonp db.findOne req.params.resource, { id: req.params.id }

  app.post '/:resource', (req, res) ->
    res.jsonp db.save req.params.resource, req.body

  app.put '/:resource/:id', (req, res) ->
    res.jsonp db.update req.params.resource, req.params.id, req.body

  app.delete '/:resource/:id', (req, res) ->
    response = db.remove req.params.resource, req.params.id
    res.status(200).jsonp response

  if options.test
    return app

  app.listen port, ->
    console.log "Server running on port #{port}"
'use strict'

expect     = require('chai').expect
request    = require 'supertest'
DB         = require 'somewhere'
jsonserver = require '../lib/jsonserver'

app = jsonserver.init
  path: 'test.json'
  test: true
  log: false

describe "JSONServer", ->
  testUser = {}

  it "should create an item in a resource", (done) ->
    request app
      .post '/users'
      .send { username: 'dreyacosta', twitter: '@dreyacosta' }
      .end (err, res) ->
        return done err if err
        testUser = res.body
        expect(res.statusCode).to.equal 200
        expect(res.body.username).to.equal 'dreyacosta'
        do done

  it "should get items of a resource", (done) ->
    request app
      .get '/users'
      .end (err, res) ->
        return done err if err
        expect(res.statusCode).to.equal 200
        expect(res.body.length).to.equal 1
        expect(res.body[0].username).to.equal 'dreyacosta'
        do done

  it "should search on a resource", (done) ->
    request app
      .get '/search/users'
      .end (err, res) ->
        return done err if err
        expect(res.statusCode).to.equal 200
        expect(res.body[0].username).to.equal 'dreyacosta'
        do done

  it "should update an item on a resource", (done) ->
    request app
      .put "/users/#{testUser.id}"
      .send { site: 'dreyacosta.com' }
      .end (err, res) ->
        return done err if err
        expect(res.statusCode).to.equal 200
        expect(res.body.site).to.equal 'dreyacosta.com'
        do done

  it "should remove an item from a resource", (done) ->
    request app
      .del "/users/#{testUser.id}"
      .end (err, res) ->
        return done err if err
        expect(res.statusCode).to.equal 200
        expect(res.text).to.equal 'true'
        do done

  it "should delete database", ->
    db = new DB 'test.json'
    do db.clear
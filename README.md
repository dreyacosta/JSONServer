# JSONServer [![Build Status](https://travis-ci.org/dreyacosta/JSONServer.svg?branch=master)](https://travis-ci.org/dreyacosta/JSONServer)
Small JSON file server for REST API mock

## Installation
```sh
$ npm install -g jsonserver
```

## Usage
Run server:
```sh
$ jsonserver --path path/to/file.json
```

Change default server port:
```sh
$ jsonserver --path path/to/file.json --port 5000
```

## Entry points

### Return an array of items in a resource
```
GET /:resource
```

```bash
curl -i -H "Accept: application/json" -X GET http://localhost:3000/movies

HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: Content-Type
Access-Control-Allow-Methods: GET, PUT, POST, DELETE
Access-Control-Expose-Headers: *
Access-Control-Allow-Origin: *
Content-Type: application/json
Content-Length: 392
ETag: "-1191736009"
Date: Sat, 31 May 2014 17:51:29 GMT
Connection: keep-alive

[{"title":"Die Hard","genre":"Action","director":"John McTiernan","description":"John McClane, officer of the NYPD, tries to save...","id":"e757cd3b-caba-3f1c-a4ef-dc409691a820"},{"title":"Transporter","genre":"Action","director":"Corey Yuen","description":"This film is about a man whose job is to deliver packages without asking any questions.","id":"1a6d970e-abd8-8b44-50b1-9714d2525c4b"}]
```

### Return an array of match items in a resource
```
GET /search/:resource
```

```bash
curl -i -H "Accept: application/json" -X GET http://localhost:3000/search/movies?title="Transporter"

HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: Content-Type
Access-Control-Allow-Methods: GET, PUT, POST, DELETE
Access-Control-Expose-Headers: *
Access-Control-Allow-Origin: *
Content-Type: application/json
Content-Length: 214
ETag: "-29677262"
Date: Sat, 31 May 2014 17:54:21 GMT
Connection: keep-alive

[{"title":"Transporter","genre":"Action","director":"Corey Yuen","description":"This film is about a man whose job is to deliver packages without asking any questions.","id":"1a6d970e-abd8-8b44-50b1-9714d2525c4b"}]
```

### Return a resource object matching with the ID
```
GET /:resource/:id
```

```bash
curl -i -H "Accept: application/json" -X GET http://localhost:3000/movies/1a6d970e-abd8-8b44-50b1-9714d2525c4b

HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: Content-Type
Access-Control-Allow-Methods: GET, PUT, POST, DELETE
Access-Control-Expose-Headers: *
Access-Control-Allow-Origin: *
Content-Type: application/json
Content-Length: 212
ETag: "-2005851238"
Date: Sat, 31 May 2014 17:52:24 GMT
Connection: keep-alive

{"title":"Transporter","genre":"Action","director":"Corey Yuen","description":"This film is about a man whose job is to deliver packages without asking any questions.","id":"1a6d970e-abd8-8b44-50b1-9714d2525c4b"}
```

### Create a new object on a resource
```
POST /:resource
```

```bash
curl -i -H "Accept: application/json" -H "Content-type: application/json" -d '{"title": "Die Hard", "genre": "Action", "director": "John McTiernan", "description": "John McClane, officer of the NYPD, tries to save..."}' -X POST http://localhost:3000/movies

HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: Content-Type
Access-Control-Allow-Methods: GET, PUT, POST, DELETE
Access-Control-Expose-Headers: *
Access-Control-Allow-Origin: *
Content-Type: application/json
Content-Length: 177
Date: Sat, 31 May 2014 17:48:59 GMT
Connection: keep-alive

{"title":"Die Hard","genre":"Action","director":"John McTiernan","description":"John McClane, officer of the NYPD, tries to save...","id":"e757cd3b-caba-3f1c-a4ef-dc409691a820"}
```

### Updated a resource object giving the ID
```
PUT /:resource/:id
```

```bash
curl -i -H "Accept: application/json" -H "Content-type: application/json" -d '{"title": "Transporter 2"}' -X PUT http://localhost:3000/movies/1a6d970e-abd8-8b44-50b1-9714d2525c4b

HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: Content-Type
Access-Control-Allow-Methods: GET, PUT, POST, DELETE
Access-Control-Expose-Headers: *
Access-Control-Allow-Origin: *
Content-Type: application/json
Content-Length: 214
Date: Sat, 31 May 2014 17:58:41 GMT
Connection: keep-alive

{"title":"Transporter 2","genre":"Action","director":"Corey Yuen","description":"This film is about a man whose job is to deliver packages without asking any questions.","id":"1a6d970e-abd8-8b44-50b1-9714d2525c4b"}
```

### Deleted a resource object giving the ID
```
DELETE /:resource/:id
```

```bash
curl -i -H "Accept: application/json" -X DELETE http://localhost:3000/movies/1a6d970e-abd8-8b44-50b1-9714d2525c4b

HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: Content-Type
Access-Control-Allow-Methods: GET, PUT, POST, DELETE
Access-Control-Expose-Headers: *
Access-Control-Allow-Origin: *
Content-Type: application/json
Content-Length: 2
Date: Sat, 31 May 2014 17:59:23 GMT
Connection: keep-alive

true
```
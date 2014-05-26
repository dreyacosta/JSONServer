# JSONServer [![Build Status](https://travis-ci.org/dreyacosta/JSONServer.svg?branch=master)](https://travis-ci.org/dreyacosta/JSONServer)
Small JSON Server for REST API mocking

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

Return an array of items in a resource
```
GET /:resource
```

Return an array of items in a resource
```
GET /search/:resource
```
**Parameters**

| Type   | Description                                        |
| ------ |:--------------------------------------------------:|
| JSON   | An object with the query (ex: `{genre: 'Action'}`) |


Return a resource object matching with the ID
```
GET /:resource/:id
```

Create a new object on a resource
````
POST /:resource
```

Updated a resource object giving the ID
```
PUT /:resource/:id
```

Deleted a resource object giving the ID
```
DELETE /:resource/:id
```
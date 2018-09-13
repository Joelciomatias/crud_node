"use strict";

var express = require('express');
var http = require('http');
var path = require("path");
var serverPort = process.env.PORT || 3000;
var nodeEnv = process.env.NODE_ENV || 'development';

var dbOptions = buildDbOptions();
console.log('Utilizando MongoDB:', dbOptions);

// setup express
var app = exports.app = express();
var server = http.createServer(app);

// Generic error handler used by all endpoints.
function handleError(res, reason, message, code) {
  console.log("ERROR: " + reason);
  res.status(code || 500).json({"error": message});
}

/*  "/api/events"
 *    GET: finds all contacts
 *    POST: creates a new contact
 */

// Define a new route
app.get('api/events', function (req, res) {
  dpd.events.get(function(events,err){
    if (err) {
      handleError(res, err.message, "Não foi possível recuperar os eventos");
    } else {
        res.send(events);
    }
  })
});


app.get('/hello-express', function (req, res) {
  res.send('Hello Deployd!');
});

// setup deployd
require('deployd').attach(server, {
  env: nodeEnv,
  db: dbOptions
});

// After attach, express can use server.handleRequest as middleware
app.use(server.handleRequest);

// start server
server.listen(serverPort, function() {
  var serverAddr = server.address().address == '0.0.0.0' ? 'localhost' : server.address().address;
  console.log('Express & Deployd Iniciados.\n\nAbra o endereço http://localhost:%s', server.address().port);
});


// Build the options for the DB based on env
function buildDbOptions() {

  // On Heroku, Mongolab add this variable to
  if (process.env.MONGOLAB_URI) {
    console.log('Variable MONGOLAB_URI exists', process.env.MONGOLAB_URI);
    return { connectionString: process.env.MONGOLAB_URI };
  }

  return {
    host: process.env.WERCKER_MONGODB_HOST || 'localhost',
    port: process.env.WERCKER_MONGODB_PORT || 27017,
    name: 'cadastro_pessoa'
  }
}

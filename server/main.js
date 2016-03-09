// NODE EXPRESS SERVER MAIN FILE
'use strict'

// npm init
// sudo npm install --save express
// sudo npm install --save body-parser
// sudo npm install -g nodemon

var express = require("express");
var bodyParser = require("body-parser");
var app = express();

// CREATE A MIDDLEWARE FOR ALL REQUESTS
app.all("/*", function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
	res.header("Access-Control-Allow-Headers", "POST, GET");
	next();
});
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));


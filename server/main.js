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

// SERVER IMPLEMENTATION
var tutorials = [
	{
		id: 1,
		videoTitle: "Any name here",
		videoDescription: "Any description here",
		videoIframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/5esQqZIJ83g" frameborder="0" allowfullscreen></iframe>',
		thumbnailUrl: "https://i.ytimg.com/vi/4Zs0gUJ7eAM/maxresdefault.jpg"
	},
	{
		id: 2,
		videoTitle: "Any new name here",
		videoDescription: "Any new description here",
		videoIframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/5B7mJtiwbMg" frameborder="0" allowfullscreen></iframe>',
		thumbnailUrl: "https://i.ytimg.com/vi/4Zs0gUJ7eAM/maxresdefault.jpg"
	}
];

app.get("/tutorials", function(req, res) {
	console.log("GET from server");
	res.send(tutorials);
});

app.listen(6060);

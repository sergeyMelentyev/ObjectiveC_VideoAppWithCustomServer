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
		videoTitle: "[Objective]-C",
		videoDescription: "General-purpose, object-oriented programming language that adds Smalltalk-style messaging to the C programming language",
		videoIframe: '<div class="container"> <iframe class="video" src="https://www.youtube.com/embed/5esQqZIJ83g" frameborder="0" allowfullscreen></iframe></div>',
		thumbnailUrl: "https://hsto.org/storage2/679/58d/a41/67958da41af346027a93e0cb37076510.png"
	},
	{
		id: 2,
		videoTitle: "Swift",
		videoDescription: "General-purpose, multi-paradigm, compiled programming language created for iOS, OS X, watchOS, tvOS and Linux",
		videoIframe: '<div class="container"> <iframe class="video" src="https://www.youtube.com/embed/c8BGQ3CfPBs" frameborder="0" allowfullscreen></iframe> </iframe></div>',
		thumbnailUrl: "http://www.themobilemontage.com/wp-content/uploads/2015/05/apple-swift-logo-icon2.png"
	},
	{
		id: 3,
		videoTitle: "C",
		videoDescription: "General-purpose, imperative computer programming language, supporting structured programming, lexical variable scope and recursion",
		videoIframe: '<div class="container"> <iframe class="video" src="https://www.youtube.com/embed/de2Hsvxaf8M" frameborder="0" allowfullscreen></iframe> </div>',
		thumbnailUrl: "http://www.pskills.org/image/c.png"
	},
	{
		id: 4,
		videoTitle: "Java",
		videoDescription: "General-purpose computer programming language that is concurrent, class-based, object-oriented and specifically designed to have as few implementation dependencies as possible",
		videoIframe: '<div class="container"> <iframe class="video" src="https://www.youtube.com/embed/3u1fu6f8Hto" frameborder="0" allowfullscreen></iframe> </div>',
		thumbnailUrl: "https://upload.wikimedia.org/wikipedia/en/8/88/Java_logo.png"
	},
	{
		id: 5,
		videoTitle: "C++",
		videoDescription: "General-purpose programming language. It has imperative, object-oriented and generic programming features, while also providing facilities for low-level memory manipulation",
		videoIframe: '<div class="container"> <iframe class="video" src="https://www.youtube.com/embed/Rub-JsjMhWY" frameborder="0" allowfullscreen></iframe> </div>',
		thumbnailUrl: "http://static.jboss.org/rhd/images/images_products_multipath_cpp-logo-3.png"
	},
	{
		id: 6,
		videoTitle: "JavaScript",
		videoDescription: "High-level, dynamic, untyped, and interpreted programming language",
		videoIframe: '<div class="container"> <iframe class="video" src="https://www.youtube.com/embed/jXW5Z-MMYPA" frameborder="0" allowfullscreen></iframe> </div>',
		thumbnailUrl: "http://www.mixed-up.com/markb/about/visual/js-logo-badge-512-edit.png"
	},
	{
		id: 7,
		videoTitle: "Python",
		videoDescription: "High-level, general-purpose, interpreted, dynamic programming language",
		videoIframe: '<div class="container"> <iframe class="video" src="https://www.youtube.com/embed/N4mEzFDjqtA" frameborder="0" allowfullscreen></iframe> </div>',
		thumbnailUrl: "http://www.unixstickers.com/image/cache/data/stickers/python/python.sh-600x600.png"
	},
	{
		id: 8,
		videoTitle: "Ruby",
		videoDescription: "Dynamic, reflective, object-oriented, general-purpose programming language",
		videoIframe: '<div class="container"> <iframe class="video" src="https://www.youtube.com/embed/Dji9ALCgfpM" frameborder="0" allowfullscreen></iframe> </div>',
		thumbnailUrl: "http://cache.soometa.com/image/257842_kiranatama.com"
	}
];

app.get("/tutorials", function(req, res) {
	console.log("GET from server");
	res.send(tutorials);
});

app.listen(6060);

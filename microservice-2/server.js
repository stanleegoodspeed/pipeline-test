// BASE SETUP
// =============================================================================

// call the packages we need
var express    = require('express');        // call express
var app        = express();                 // define our app using express
var bodyParser = require('body-parser');

// configure app to use bodyParser()
// this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/microservice-2', function (req, res) {
	res.send('MICROSERVICE 2 - BOOM')
});
  
app.listen(4000, function () { console.log('started service')});
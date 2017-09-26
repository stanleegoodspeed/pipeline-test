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

app.get('/microservice-1', function (req, res) {
	res.send('MICROSERVICE 1 - BOOM2')
});
  
app.listen(5000, function () { console.log('started service')});
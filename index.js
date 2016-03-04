var express     = require('express');
var app         = express();
var bodyParser  = require('body-parser');

// Models
var Movie = require('./app/models/movie');


app.use(bodyParser.urlencoded({ extended: true})); // Allow us to get the data from a POST
app.use(bodyParser.json());

var port = process.env.PORT || 3000;

var router = express.Router();

// Midleware between routes: Validations, exceptions, analytics..all goes here
router.use(function (req, res, next) {
  console.log('Action taking course...' + req.body.name);
  next(); // Just to make sure we go to the next routes
});

router.get('/', function (req, res) {
  res.json({ message: 'Welcome to our app'});
});

// Our routes

// Routes for /movies
router.route('/movies')
  .post(function (req, res) {

    var movie = new Movie();
    movie.name = req.body.name;

    movie.save( function (err) {
      if (err) { res.send(err);  }
      res.json({ message: 'Movie created!' });
    });
  });


app.use('/api', router);

app.listen(port);
console.log('Listening on: ' + port);

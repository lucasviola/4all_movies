var express     = require('express');
var app         = express();
var bodyParser  = require('body-parser');
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/test');

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
  res.json({message: 'Welcome to our app'});
});

// Our routes

// Routes for /movies
router.route('/movies')
  .post(function (req, res) {
    var movie = new Movie();
    movie.name = req.body.name;

    movie.save(function (err) {
      if (err) { res.send(err);  }
      res.json({ message: 'Movie' + req.body.name + 'created!' });
    });
  })
  .get(function (req, res) {
    Movie.find(function (err, movies) {
      if (err) { res.send(err); }
      res.json(movies);
    })
  });

router.route('/movies/:movie_id')
  .get(function (req, res){
    Movie.findById(req.params.movie_id, function(err, movie) {
      if (err) {
        res.send(err);
      }
      res.json(movie);
    });
  })
  .put(function (req, res) {
    Movie.findById(req.params.movie_id, function(err, movie) {
      if (err) {
        res.send(err);
      }
      movie.name = req.body.name; // updates movie name

      // saves movie
      movie.save(function (err) {
        if (err) {
          res.send(err);
        }
        res.json({message:'Movie update'});
      });
    });
  })
  .delete(function (req, res) {
    Movie.remove({
      _id: req.params.movie_id
    }, function (err, movie) {
      if (err) {
        res.send(err);
      }
      res.json({message: 'Movie deleted'});
      });
  });


app.use('/api', router);

app.listen(port);
console.log('Listening on: ' + port);

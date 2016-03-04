var express     = require('express');
var app         = express();
var bodyParser  = require('body-parser');


app.use(bodyParser.urlencoded({ extended: true})); // Allow us to get the data from a POST
app.use(bodyParser.json());

var port = process.env.PORT || 3000;

var router = express.Router();

router.get('/', function (req, res) {
  res.json({ message: 'Welcome to our app'});
});

app.use('/api', router);

app.listen(port);
console.log('Listening on: ' + port);

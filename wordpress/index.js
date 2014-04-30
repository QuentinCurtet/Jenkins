var express = require('express');
var pg = require('pg');

// Constants
var PORT = process.env.NODE_LISTEN_PORT;
var BDD_PORT = process.env.DB_PORT_5432_TCP_PORT
var BDD_ADDR = process.env.DB_PORT_5432_TCP_ADDR
var conString = "postgres://postgres@"+ BDD_ADDR + ":" + BDD_PORT + "/postgres";

// App
var app = express();
app.get('/', function (req, res) {
	res.send('Hello World from node js listening on port ' + PORT + '\n');
});

app.get('/bdd', function (req, res) {
	var client = new pg.Client(conString);
	client.connect(function(err) {
		if(err) {
			return console.error('could not connect to postgres', err);
		}
		client.query('SELECT NOW() AS "theTime"', function(err, result) {
			if(err) {
				return console.error('error running query', err);
			}
			var reponseDate = result.rows[0].theTime;
			console.log(reponseDate);
			res.send('Hello ! It\'s ' + reponseDate + ' thru node js listening on port ' + PORT + ' \n');
			client.end();
		});
	});
});

app.listen(PORT)
console.log('Running on http://localhost:' + PORT);

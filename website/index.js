'use strict';

const bodyParser = require('body-parser');
const express = require('express');
const morgan = require('morgan');

const app = express();
const handlebars = require('express-handlebars').create({defaultLayout: 'main'});

app.engine('handlebars', handlebars.engine); 
app.set('view engine', 'handlebars'); 
app.set('views', './views');

app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/', async (req, res) => {
    res.render('home');
});

app.use((req, res) => {
    res.status(404).send(`Error 404: ${req.url} cannot be found :(`);
});

app.listen(53140, () => console.log('The server is up and running...')); 
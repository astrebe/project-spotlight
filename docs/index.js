'use strict';
const express = require('express');
const morgan = require('morgan');

const app = express();

app.use(morgan('dev'));
app.use(express.static('public')); 

app.use((req, res) => {
    res.status(404).send(`Error 404: ${req.url} cannot be found :(`);
});

app.listen(53140, () => console.log('The server is up and running...')); 
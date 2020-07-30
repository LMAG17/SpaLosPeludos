const express = require('express');
const morgan = require('morgan');
const engine = require('ejs-mate');
const path = require('path');

const app = express();
//Setting
app.set('port', 4000)

//middlewares
app.use(morgan('dev'));
app.engine('ejs', engine);
app.set('view engine', 'ejs');
console.log(__dirname);
app.set('views', path.join(__dirname, 'views'));
//routes
app.use(require('./routes/index'));
//static files


//start server
app.listen(app.get('port'), () => {
    console.log('Estamos trabajando en el puerto', app.get('port'));
});
const express = require("express");
const { render } = require("express/lib/response");
const ejs = require('ejs');

const app = express();
const port = process.env.PORT || 3050;
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.get('/', (req, res) => {
    res.render('home.ejs')
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}/`);
});

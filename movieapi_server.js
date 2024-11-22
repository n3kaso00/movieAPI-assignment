import express from 'express';

var app = express();


app.listen(3001, () => {
    console.log('The server is running!');
});

app.get('/', (req, res) => {
    res.send('Root endpoint');
});

app.get('/customer', (req, res) => {
    res.send('User information!')
});

app.get('/movie', (req, res) => {
    res.send('Movie information')
});

app.get('/movie_review', (req, res) => {
    res.send('Movie review information!')
});

app.get('/genre', (req, res) => {
    res.send('genre information!')
});
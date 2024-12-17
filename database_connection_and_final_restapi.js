import express from 'express';
import pg from 'pg';
import dotenv from 'dotenv';
dotenv.config();
var app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.listen(3001, () => {
    console.log('The server is running!');
});

app.get('/', (req, res) => {
    res.send('Root endpoint');
});


// Add new genres

app.post('/genre', async (req, res) => {
    const { name } = req.body; 

    
    if (!name) {
        return res.status(400).send('Missing required field: name');
    }

    try {
        
        const result = await client.query(
            'INSERT INTO genre (name) VALUES ($1) RETURNING *',
            [name]
        );

        
        res.status(201).json(result.rows[0]);
    } catch (error) {
        console.error('Error adding genre:', error.message);
        res.status(500).send('Something went wrong');
    }
});


// add movie

app.post('/movie', async (req, res) => {
    const { name, year, genre_id } = req.body;

    
    if (!name || !year || !genre_id) {
        return res.status(400).send('Missing required fields: name, year, genre_id');
    }

    try {
        const result = await client.query(
            'INSERT INTO movie (name, year, genre_id) VALUES ($1, $2, $3) RETURNING *',
            [name, year, genre_id]
        );
        res.status(201).json(result.rows[0]); 
    } catch (error) {
        console.error('Error during insert:', error.message);
        res.status(500).send('Something went wrong');
    }
});

// get movie by id

app.get('/movie/:id', async (req,res) => {
    const {id} = req.params;
    
    try {
        const result = await client.query('SELECT * FROM movie WHERE id = $1', [id]);
        if (result.rows.length > 0) {
            res.json(result.rows[0]);
        } else {
            res.status(404).send('Movie not found');
        }
        } catch (error) {
            console.error('Error fetching movie:', error.message);
            res.status(500).send('something went wrong');
        }
    
});


// get genre by id

app.get('/genre/:id', async (req,res) => {
    const {id} = req.params;
    
    try {
        const result = await client.query('SELECT * FROM genre WHERE id = $1', [id]);
        if (result.rows.length > 0) {
            res.json(result.rows[0]);
        } else {
            res.status(404).send('genre not found');
        }
        } catch (error) {
            console.error('Error fetching genre:', error.message);
            res.status(500).send('something went wrong');
        }
    
});


// delete movie by id

app.delete('/movie/:id', async (req, res) => {
    const { id } = req.params; 

    try {
        const result = await client.query(
            'DELETE FROM movie WHERE id = $1 RETURNING *',
            [id]
        );

        if (result.rowCount === 0) {
            return res.status(404).send('Movie not found');
        }

        res.json({
            message: 'Movie deleted successfully',
            deletedMovie: result.rows[0]
        });
    } catch (error) {
        console.error('Error deleting movie:', error.message);
        res.status(500).send('Something went wrong');
    }
});


// get all movies

app.get('/movies', async (req, res) => {
    const { page = 1 } = req.query;
    const limit = 10;
    const offset = (page - 1) * limit;
    try {
        const result = await client.query('SELECT * FROM movie LIMIT $1 OFFSET $2', [limit, offset]);
        res.json(result.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
});


const {Client} = pg;

const client = new Client();

// const client = new Client({
   // user: process.env.PG_USER,
   // password: process.env.PG_PW,
    //database: process.env.PG_DB,
   // host: process.env.PG_HOST,
   // port: process.env.PG_PORT
//});

connect()

async function connect() {

    try {
        await client.connect();
        await client.query
        console.log('Database connected');
    } catch (error) {
        console.log(error.message);
    }

}
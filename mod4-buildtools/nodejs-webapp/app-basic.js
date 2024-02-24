//app.js
const express = require('express');
const app = express();
const PORT = 3000;

// define routes
app.get('/', (req,res) => {
  res.send("Hello This is the homepage!");
});


app.get('/about', (req,res) => {
    res.send("This is the about page.");
  });

app.get('/contact', (req,res) => {
    res.send("Contact me @ contact@example.com");
  });

//start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});


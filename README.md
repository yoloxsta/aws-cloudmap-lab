# build-a-microservices-infrastructure-on-aws-using-terraform-ecs-fargate-and-cloudmap


- Build a microservices infrastructure on AWS using Terraform, ECS Fargate, and CloudMap
- Store your Terraform state file (.tfstate) remotely in Amazon S3.That means you can safely collaborate with your team, and the state isn't stored locally.

### Cinema

```
- 📁 due/index.js – Movies Service

const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.json({
    movies: ['Inception', 'Avatar 2', 'Interstellar']
  });
})

app.listen(port, () => {
  console.log(`Movie service listening on port ${port}`);
});


- 📁 tre/index.js – Price Service

const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.json({
    prices: {
      regular: '$10',
      premium: '$15',
      vip: '$20'
    }
  });
})

app.listen(port, () => {
  console.log(`Price service listening on port ${port}`);
});

- 📁 uno/index.js – Cinema Portal (Frontend)

const express = require('express');
const fetch = require('node-fetch');
const app = express();
const port = 3000;

// Show main page
app.get('/', (req, res) => {
  res.send(`
    <h1>🎬 Welcome to Soe's Cinema!</h1>
    <button onclick="window.location='/movies'">Show Movies</button>
    <button onclick="window.location='/prices'">Show Prices</button>
  `);
});

// Fetch movies from due
app.get('/movies', async (req, res) => {
  const response = await fetch(`${process.env.DUE_SERVICE_API_BASE}:3000`);
  const data = await response.json();
  res.send(`
    <h2>🎥 Movie List</h2>
    <ul>${data.movies.map(movie => `<li>${movie}</li>`).join('')}</ul>
    <a href="/">Back</a>
  `);
});

// Fetch prices from tre
app.get('/prices', async (req, res) => {
  const response = await fetch(`${process.env.TRE_SERVICE_API_BASE}:3000`);
  const data = await response.json();
  res.send(`
    <h2>💵 Ticket Prices</h2>
    <ul>
      <li>Regular: ${data.prices.regular}</li>
      <li>Premium: ${data.prices.premium}</li>
      <li>VIP: ${data.prices.vip}</li>
    </ul>
    <a href="/">Back</a>
  `);
});

app.listen(port, () => {
  console.log(`Cinema portal listening on port ${port}`);
});

```
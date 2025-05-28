// const express = require('express')
// const fetch = require('node-fetch');
// const app = express()
// const port = 3000

// app.get('/', async (req, res) => {
//   const dueResponse = await fetch(`${process.env.DUE_SERVICE_API_BASE}:3000`)
//   const treResponse = await fetch(`${process.env.TRE_SERVICE_API_BASE}:3000`)
//   const dueData = await dueResponse.json();
//   const treData = await treResponse.json();
//   res.json({
//     msg: "Hello world! (from uno)",
//     due:{
//       url: process.env.DUE_SERVICE_API_BASE,
//       data: dueData,
//     },
//     uno:{
//       url: process.env.TRE_SERVICE_API_BASE,
//       data: treData,
//     }
//   })
// })

// app.get('/healthcheck', (req, res) => {
//   res.send('Hello World!')
// })

// app.listen(port, () => {
//   console.log(`Example app listening on port ${port}`)
// })


const express = require('express');
const fetch = require('node-fetch');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.static('public'));

app.get('/call-due', async (req, res) => {
  try {
    const dueResponse = await fetch(`${process.env.DUE_SERVICE_API_BASE}:3000`);
    const dueData = await dueResponse.json();
    res.json(dueData);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch due service' });
  }
});

app.get('/call-tre', async (req, res) => {
  try {
    const treResponse = await fetch(`${process.env.TRE_SERVICE_API_BASE}:3000`);
    const treData = await treResponse.json();
    res.json(treData);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch tre service' });
  }
});

app.get('/healthcheck', (req, res) => {
  res.send('OK');
});

app.listen(port, () => {
  console.log(`uno app listening on port ${port}`);
});

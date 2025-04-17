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


```
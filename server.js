const { createServer } = require('node:http');
const executeDataBase = require('./index.js');

const app = createServer(async (request, response) => {
   
    if(request.url === '/') {
        response.writeHead(200, { 'Content-type': 'text/plain' })
        return response.end('Olá, eu sou o NodeJs')
    }

    if(request.url === '/usuarios') {
        response.writeHead(200, { 'Content-type': 'application/json' })
        const usuarios = await executeDataBase('select * from usuarios');
        console.log("Usuarios aqui", usuarios);
        return response.end(JSON.stringify(usuarios))
    }
})

app.listen(3000, () => {
    console.log("Servidor NodeJs Executando...");
})
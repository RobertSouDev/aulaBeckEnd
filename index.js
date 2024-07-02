const { Client } = require('pg');

const DataBase = new Client({
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: '1234',
    database: 'digitalStore'
});

const executeDataBase = async(sql)=>{
    await DataBase.connect();
    const resultados = await DataBase.query(sql)
    await DataBase.end();
    console.log(resultados.rows)
}

// module.exports = executeDataBase;

executeDataBase("SELECT * FROM usuarios")
// executeDataBase("INSERT INTO usuarios(nome, login, senha) VALUES('marcio', 'marcio2020', 123456)")
// executeDataBase("UPDATE usuarios SET login = 'roger22' WHERE id = '1'")
// executeDataBase("DELETE FROM usuarios WHERE id = 3")




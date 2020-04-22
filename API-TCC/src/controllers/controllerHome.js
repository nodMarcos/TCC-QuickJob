exports.visualizaServicos = (req,res) =>{
    const database = require("../model/database.js")()
    var cd_login = req.params.cd_login

    database.query(`call prExibeServicos(${cd_login});`,(err,rows,fields)=>{
        if(err){
            database.end()
            return res.json({
                erro:err
            }).end()
        }else{
            if(rows[0][0] == null){
                database.end()
                return res.send({
                    msg:"f"
                }).end();
            }else{
                let cd_servico = rows[0][0].cd_servico;
                let cd_empregado = rows[0][0].cd_empregado;                
                let nm_usuario = rows[0][0].nm_usuario;
                let ds_servico = rows[0][0].ds_servico;
            database.query(`select count(cd_servico) as contador from tb_servico as s join tb_empregado as em on em.cd_empregado = s.cd_empregado join tb_usuario as u on u.cd_usuario = em.cd_usuario join tb_login as l on l.cd_login = u.cd_login where l.cd_login = ${cd_login};`, function(err, resposta) {
                if(err) throw err.end();
                else{
                database.end()
                return res.json({
                    contador: resposta,
                    cd_servico: cd_servico,
                    nm_usuario:nm_usuario,
                    ds_servico:ds_servico,
                    cd_login:cd_login,
                    cd_empregado:cd_empregado,
                    servicos:rows
                    }).end()
                }
            })
            }
        }
    })
}

exports.visualizaTodosServicos = (req,res) =>{
    const database = require("../model/database.js")()
    
    database.query(`SELECT * FROM tb_servico`,(err,rows,fields)=>{
        if(err){
            database.end()
            return res.json({
                erro:err
            }).end()
        }else{
            if(rows.length == []){
                database.end()
                return res.send({
                    msg: "Nenhum serviço cadastrado"
                }).end();
            }else{
                database.end()
                let servicos = rows

                return res.send({servicos: servicos}).end()
            }
        }
    })
}
 // Deletar junto com as compras para não ter o erro de chave estrangeira (foreign key).
exports.deletaServicos = (req,res) => {
    const database = require("../model/database.js")()
    let numero = req.body.cdDelete;
    database.query(`delete from tb_servico where cd_servico = ${numero};`, (err, result) => {
        if(err){
        database.end()
         throw err.end();
    }
        else{
        database.end()
        return res.json(result).end();
        }
    })
}

exports.updateServicos = (req,res) => {
    const database = require("../model/database.js")()
    let nm_servico = req.body.nm_servico;
    let ds_servico = req.body.ds_servico;
    let vl_servico = req.body.vl_servico;
    let numero = req.body.cd_servico;

    console.log(`${nm_servico}, ${vl_servico}, ${ds_servico}, ${numero}`)

database.query(`UPDATE tb_servico set nm_servico = "${nm_servico}", ds_servico = "${ds_servico}", vl_servico = ${vl_servico} where cd_servico = ${numero};`, (err, result) => {
        if(err){
            database.end()
            throw err.end();
            
        }
        else{
        database.end()
        return res.json(result).end();
        }
    })
}

exports.buscar = (req,res) =>{
    const database = require("../model/database.js")()
    let buscar = req.body.busca;
    database.query("CALL prBusca_servico_pelo_nome(?)", buscar, (err, result) => {
    if(err){
        database.end()
        throw err.end();
    }
        else{
            if(result.length == []){
                database.end()
                return res.send({
                    msg:"Nenhum resultado encontrado!"
                }).end();
            }
            else{
                database.end()
                return res.send({
                    res: result
                }).end()
            }
        }
    });
}

exports.listarbuscar = (req,res) =>{
    const database = require("../model/database.js")()
    let cd_servico = req.params.cd_servico;
    database.query(`SELECT cd_servico, nm_servico, vl_servico, ds_servico, cd_key from tb_servico where cd_servico = ${cd_servico};`, function(err, result) {
        if(err){
            database.end() 
            throw err.end();
        }
        else{
            database.end()
            res.send(result).end();
        }
    });
}
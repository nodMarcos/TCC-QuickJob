exports.acessos = (req, res) => {
    const database = require("../model/database.js")()

    let cd_servico = req.body.cd_servico

    database.query("UPDATE tb_servico SET visualizacoes = (SELECT visualizacoes + 1) WHERE cd_servico = ?", [cd_servico, cd_servico], (err, rows) => {
        if(err){
            database.end()
            return res.send({
                err:err
            }).end()
        }
        else{
            database.end()
            return res.send({
                msg: "Ok"
            }).end()
        }
    })
}

exports.cadastraServicos = (req,res) => {

    const database = require("../model/database.js")()
    let nm_servico = req.body.nm_servico;
    let ds_servico = req.body.ds_servico;
    let vl_servico = req.body.vl_servico;
    let cd_usuario = req.body.cd_usuario;

    database.query("CALL prCadastraServico(?,?,?,?)",[nm_servico,ds_servico,vl_servico, cd_usuario], (err, rows) =>{
        if(err){
            database.end()
            return res.send({
                err:err
            }).end()
        }
        else{
            database.end()
            console.log(rows[0][0].msg)
            return res.send({
                msg:rows[0][0].msg
            }).end()
        }
    })
}

exports.altera_servico = (req, res) => {
    const database = require("../model/database.js")()

    let nm_servico = req.body.nm_servico
    let ds_servico = req.body.ds_servico
    let vl_servico = req.body.vl_servico
    let cd_servico = req.body.cd_servico

    database.query("UPDATE tb_servico SET nm_Servico = ?, ds_servico = ?, vl_servico = ? WHERE cd_servico = ?", [nm_servico, ds_servico, vl_servico, cd_servico], (err, rows) => {
        if(err){
            database.end()
            return res.send({
                err:err
            }).end()
        }
        else{
            database.end()
            return res.send({
                msg: "Serviço alterado com sucesso!"
            }).end()
        }
    })
}

exports.visualizaServicoUsuario = (req, res) =>{
    const database = require("../model/database.js")()
    const cd_usuario = req.params.cd_usuario
        database.query("CALL prBusca_servico_usuario(?)", cd_usuario, (err, rows) =>{
            if(err){
                database.end()
                return res.send({
                    err:err
                }).end()
            }
            else{
                database.end()
                return res.send({
                    servico:rows[0]
                }).end()
            }
        })
}

exports.deleta_servico = (req, res) => {
    const database = require("../model/database.js")()
    const cd_servico = req.body.cd_servico

    database.query("DELETE FROM tb_avaliacao WHERE cd_servico = ?", cd_servico, (err, rows) => {
        if(err){
            database.end()
            return res.send({
                err: err
            }).end()
        }else{
            database.query("DELETE FROM tb_servico WHERE cd_servico = ?", cd_servico, (err2, rows2) => {
                if(err2){
                    database.end()
                    return res.send({
                        err: err2
                    }).end()
                }else{
                    database.end()
                    return res.send({
                        msg: "Ok"
                    }).end()
                }       
            })
        }
    })
}


exports.visualizaServicoVisitante = (req, res) =>{
    const database = require("../model/database.js")()
    const cd_servico = req.params.cd_servico

        database.query("CALL prVisualiza_servico_visitante(?)", cd_servico, (err, rows) =>{
            if(err){
                database.end()
                return res.send({
                    err:err
                }).end()
            }
            else{
                database.query("select u.nm_usuario, a.comentario_avaliacao, a.nivel_avaliacao from tb_avaliacao as a join tb_usuario as u on a.cd_usuario = u.cd_usuario where a.cd_servico = ?", cd_servico, (err2, rows2) =>{                
                if(err2){
                    database.end()
                    return res.send({
                        err2:err2
                    }).end()
                }else{
                database.end()
                console.log(rows2)
                return res.send({
                    servico:rows[0],
                    comentarios:rows2
                }).end()
            }
            })
        
        }
    })
}
exports.visualizaServico = (req, res) => { 
    const database = require("../model/database.js")()
    const cd_servico = req.params.cd_servico;
    database.query(`CALL prExibeServico(?)`,cd_servico, (err, rows)=>{
        if(err){
            database.end()
            return res.send({
                err:err
            }).end()
        }
        else{
            database.end()
            return res.send({
                servico: rows[0]
            }).end()
        }
    });
}

exports.avaliacaoServico = (req, res) => {
    const database = require("../model/database.js")()

    let cd_servico = req.body.cd_servico
    let nota = req.body.nota
    let msg = req.body.mensagem
    let cd_usuario = req.body.cd_usuario

    database.query("SELECT * FROM tb_avaliacao WHERE cd_usuario = ? AND cd_servico = ?", [cd_usuario, cd_servico], (err2, rows2) => {
        if(err2){
            return res.send({err: err2}).end()
        }else{
            if(rows2.lenth == [] || rows2.length == 0){
                //insere
                database.query("INSERT INTO tb_avaliacao VALUES (default, ?, ?, ?, ?)", [nota, msg, cd_usuario, cd_servico], (err, rows) => {
                    if(err){
                        database.end()
                        return res.send({err: err}).end()
                    }else{
                        database.end()
                        return res.send({msg: "Avaliação registrada com sucesso!"}).end()
                    }
                })
            }else{
                // altera
                database.query("UPDATE tb_avaliacao SET nivel_avaliacao = ?, comentario_avaliacao = ? WHERE cd_usuario = ? AND cd_servico = ?", [nota, msg, cd_usuario, cd_servico], (err, rows) => {
                    if(err){
                        database.end()
                        return res.send({err: err}).end()
                    }else{
                        database.end()
                        return res.send({msg: "Avaliação alterada com sucesso!"}).end()
                    }
                })
            }
        }
    })

    
}
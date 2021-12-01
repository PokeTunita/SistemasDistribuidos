const {Router} = require('express');
const router = Router();
const mysql = require('mysql');

function IConexion(){
    const mysqlConnection = mysql.createConnection({
        host: '192.168.100.125',
        user: 'PokeTunita',
        password: '03042021',
        database: 'adaeweb',
        multipleStatements: true
        });
    mysqlConnection.connect(function (err) {
        if (err) {
          console.error(err);
          return;
        } 
      });
    return mysqlConnection;
}

router.post('/Registrar', (req, res)=>{
    const {usuario, contra} = req.body;
    var mysqlConnection = IConexion()
    const query = 'select * from usuario where nom_usu = ?'
    mysqlConnection.query(query, usuario, (err ,rows)=>{
        if(!err){
            if(rows.length == 0){
                const query2 = 'insert into usuario (nom_usu, contra_usu) values (?,?)'
                mysqlConnection.query(query2, [usuario, contra], (_err, _rows)=>{
                    if(!_err){
                        mysqlConnection.destroy();
                        res.json({
                            status: 'registrado'
                        })
                    }else{
                        console.error(_err)
                        mysqlConnection.destroy();
                        res.json({
                            status: 'error'
                        })
                    }
                })
            }else{
                mysqlConnection.destroy();
                res.json({
                    status: 'ya registrado'
                })
            }

        }else{
            console.error(err)
            mysqlConnection.destroy();
            res.json({
                status: 'error'
            })

        }
    });
})

router.post('/Iniciar', (req, res)=>{
    const {nombre, contra} = req.body
    var mysqlConnection = IConexion()
    const query = 'select  * from usuario where nom_usu = ? and contra_usu = ?'
    mysqlConnection.query(query, [nombre, contra], (err, rows)=>{
        if(!err){
            if(rows.length > 0){
                mysqlConnection.destroy();
                res.json({
                    status: 'encontrado',
                    usuario: rows[0]
                })
            }else{
                mysqlConnection.destroy();
                res.json({
                    status: 'no encontrado'
                })
            }
        }else{
            console.error(err)
            mysqlConnection.destroy();
            res.json({
                status: 'error'
            })
        }

    })
})

router.post('/Agregar/Tarea', (req, res)=>{
    const {des_tarea, fecha, id_mate, id_usu} = req.body
    var mysqlConnection = IConexion()
    const query = 'insert into tarea (des_tarea, estado, fecha, id_mate, id_usu) values (?, ?, ?, ?, ?)'
    mysqlConnection.query(query, [des_tarea,0, fecha, id_mate, id_usu], (err, rows)=>{
        if(!err){
            mysqlConnection.destroy();
            res.json({
                status: 'guardada'
            })
        }else{
            console.error(err)
            mysqlConnection.destroy();
            res.json({
                status: 'error'
            })
        }
    })
})


router.post('/Eliminar/Tarea', (req, res)=>{
    const {id_tarea, id_usu} = req.body
    var mysqlConnection = IConexion();
    const query = 'delete from tarea where id_tarea = ? and id_usu = ?'
    mysqlConnection.query(query, [id_tarea, id_usu], (err, rows)=>{
        if(!err){
            mysqlConnection.destroy();
            res.json({
                status: 'Eliminada'
            })
        }else{
            console.error(err)
            mysqlConnection.destroy();
            res.json({
                status: 'error'
            })
        }
    })
})

router.post('/Modificar/Estado/Tarea', (req, res)=>{
    const {id_tarea, estado, id_usu} = req.body
    var mysqlConnection = IConexion();
    const query = 'update tarea set estado = ? where id_tarea = ? and id_usu = ?'
    mysqlConnection.query(query, [estado, id_tarea, id_usu], (err, rows)=>{
        if(!err){
            mysqlConnection.destroy();
            res.json({
                status: 'modificado'
            })
        }else{
            console.error(err)
            mysqlConnection.destroy();
            res.json({
                status: 'error'
            })
        }
    })
})

router.post('/Tareas/Usuario', (req, res)=>{
    const {id_usu} = req.body
    var mysqlConnection = IConexion()
    const query = 'select tarea.id_tarea, tarea.fecha , tarea.estado, tarea.des_tarea, tarea.id_mate, materia.des_mate from tarea INNER JOIN materia ON materia.id_mate = tarea.id_mate where tarea.id_usu = ?'
    mysqlConnection.query(query, id_usu, (err, rows)=>{
        if(!err){
            mysqlConnection.destroy();
            res.json({
                status: 'encontrados',
                datos: rows
            })
        }else{
            console.error(err)
            mysqlConnection.destroy();
            res.json({
                status: 'error'
            })
        }
    })
})


module.exports = router;
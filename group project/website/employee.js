module.exports = function(){
    var express = require('express');
    var router = express.Router();

    function getBooks(res, mysql, context, complete){
        mysql.pool.query("SELECT id, title, author, checkedout FROM books", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.books = results;
            complete();
        });
    }
    function getEmployee(res, mysql, context, complete){
        mysql.pool.query("SELECT employeeId, fname, lname FROM employee", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.employee = results;
            complete();
        });
    }
    
    router.get('/', function(req,res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts= ["deleteemployee.js"];
        var mysql = req.app.get('mysql');
        getBooks(res, mysql, context, complete);
        getEmployee(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('employee', context);
            }
        }
    });

    router.get('/:employeeId', function(req, res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["selectedmovies.js", "updatebooks.js"];
        var mysql = req.app.get('mysql');
        getEmployee(res,mysql, context, req.params.employeeId, complete);
        getBooks(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('update-employee', context);
            }
        }
    });

    router.post('/', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = " INSERT INTO employee( fname, lname) VALUES(?,?)";
        var inserts = [req.body.fname, req.body.lname];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/employee');
            }
        });
    });

    router.put('/:employeeId', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "UPDATE employee SET fname=?, lname=? WHERE employeeId=?";
        var inserts = [req.body.fname, req.body.lname, req.params.employeeId];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
        });
    });

    router.delete('/:employeeId', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM employee WHERE employeeId = ?";
        var inserts = [req.params.employeeId];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.status(400);
                res.end();
            }else{
                res.status(202).end();
            }
        })
    })
    return router;
}();
module.exports = function(){
    var express = require('express');
    var router = express.Router();

    /*function getBooks(res, mysql, context, complete){
        mysql.pool.query("SELECT id, title, author, checkedout FROM movies", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.movies = results;
            complete();
        });
    }*/
    function getMovies(res, mysql, context, complete){
        mysql.pool.query("SELECT id, title, year FROM movies", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.movies = results;
            complete();
        });
    }
    
    router.get('/', function(req,res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts= ["deletemovies.js"];
        var mysql = req.app.get('mysql');
       // getBooks(res, mysql, context, complete);
        getMovies(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('movies', context);
            }
        }
    });

    router.get('/:id', function(req, res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["selectedmovie.js"];
        var mysql = req.app.get('mysql');
        getMovies(res,mysql, context, req.params.id, complete);
       // getBooks(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('update-movie', context);
            }
        }
    });

    router.post('/', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = " INSERT INTO movies( title, year, checkedout) VALUES(?,?,?)";
        var inserts = [req.body.title, req.body.author, req.body.checkedout];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/movies');
            }
        });
    });

    router.put('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "UPDATE movies SET title=?, year=?, checkedout=? WHERE id=?";
        var inserts = [req.body.title, req.body.year, req.body.checkedout, req.params.id];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
        });
    });

    router.delete('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM movies WHERE id = ?";
        var inserts = [req.params.id];
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
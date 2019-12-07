module.exports = function(){
    var express = requir('express');
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
    function getMovies(res, mysql, context, complete){
        mysql.pool.query("SELECT id, name FROM movies", function(error, results, fields){
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
        context.jsscripts= ["deleteitem.js"];
        var mysql = req.app.get('mysql');
        getBooks(res, mysql. context, complete);
        getMovies(res, mysql. context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('books', context);
            }
        }
    });

    router.get('/:id', function(req, res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["selectedmovies.js", "updatebooks.js"];
        var mysql = req.app.get('mysql');
        getMovies(res,mysql, context, req.params.id, complete);
        getBooks(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('update-movie', context);
            }
        }
    });

    router.post('/', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = " INSERT INTO books( title, author, checkedout) VALUES(?,?,?)";
        var inserts = [req.body.title, req.body.author, req.body.checkedout];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/books');
            }
        });
    });

    router.put('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "UPDATE books SET title=?, author=?, checkedout=? WHERE id=?";
        var inserts = [req.body.title, req.body.author, req.body.checkedout, req.params.id];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
        });
    });

    router.delete('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM books WHERE id = ?";
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
-- Find the film_title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
-- Order the results by film_title in descending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.
 SELECT f.title as film_title FROM film f INNER JOIN(SELECT f.film_id as film_id FROM film f INNER JOIN film_actor fa ON fa.film_id = f.film_id 
 INNER JOIN actor a ON a.actor_id = fa.actor_id WHERE a.first_name = 'KIRSTEN' AND a.last_name = 'PALTROW') as t1 ON t1.film_id = f.film_id
 INNER JOIN (SELECT f.film_id as film_id FROM film f INNER JOIN film_actor fa ON fa.film_id = f.film_id 
 INNER JOIN actor a ON a.actor_id = fa.actor_id WHERE a.first_name = 'WARREN' AND a.last_name = 'NOLTE') as t2 on t2.film_id = f.film_id ORDER BY f.title DESC;
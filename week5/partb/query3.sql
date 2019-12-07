-- Find the first_name, last_name and total_combined_film_length of Sci-Fi films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Sci-Fi films) and the total length of Sci-Fi films they have been in.
-- Look at the category table to figure out how to filter data for Sci-Fi films.
-- Order your results by the actor_id in descending order.
-- Put query for Q3 her
SELECT a.actor_id, a.first_name, a.last_name, IFNULL(tl.total,0) as total_combined_film_length FROM actor a LEFT JOIN
(SELECT a.actor_id, SUM(f.length) as total FROM film f INNER JOIN film_actor fa ON f.film_id = fa.film_id INNER JOIN actor a ON a.actor_id = fa.actor_id 
INNER JOIN film_category fc ON fc.film_id = f.film_id INNER JOIN
category c ON fc.category_id = c.category_id WHERE c.name = 'Sci-fi'  
GROUP BY a.actor_id) as tl ON a.actor_id = tl.actor_id
GROUP BY a.actor_id Order by a.actor_id DESC


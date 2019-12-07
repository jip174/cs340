-- Find the first_name and last_name of all actors who have never been in a Sci-Fi film.
-- Order by the actor_id in ascending order.

-- Put your query for q4 here

SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.actor_id NOT IN (SELECT a.actor_id FROM film f INNER JOIN
film_actor fa ON f.film_id = fa.film_id INNER JOIN actor a ON a.actor_id = fa.actor_id INNER JOIN
film_category fc ON fc.film_id = f.film_id INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-fi'GROUP BY a.actor_id) GROUP BY a.first_name, a.last_name ORDER by a.actor_id ASC
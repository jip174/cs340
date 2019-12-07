-- query for data manipulation

--get book id and title to populate the checkout dropdown
SELECT id, title FROM books
--get movie id and movies to populate the checkout dropdown
SELECT id, title FROM movies
--get customer id and names to populate the checkout dropdown
SELECT id, fname, lname FROM customer
--get employee id and names to populate the checkout dropdown
SELECT id, fname, lname FROM employee


-- get all books and their checkout transaction number for the checkout page
SELECT books.id, title, author, checkout.transnum AS title, transID FROM books INNER JOIN books ON books.id = checkout.id
-- get all movies and their checkout transaction number for the checkout page
SELECT movie.id, title, year, checkout.transnum AS title, transID FROM movies INNER JOIN movies ON movies.id = checkout.id

-- get a single book for the Update books form
SELECT id, title, author, checkedout FROM books WHERE id = :book_id_selected_from_browse_book_page
-- get a single movie for the Update movie form
SELECT id, title, year, checkedout FROM movies WHERE id = :movie_id_selected_from_browse_movie_page



-- get all book data to populate a dropdown
SELECT id AS id, title, author FROM books 
-- get all movie data to populate a dropdown   
SELECT id AS id, title, year FROM movies 


-- get all id to populate a dropdown for associating with books
SELECT id AS id, title FROM cust_books
-- get all id to populate a dropdown for associating with movies
SELECT id AS id, title FROM cust_movies



-- get all books with their current associated check out to list
SELECT books.id, CONCAT(title,' ', author) AS title, author FROM books 
INNER JOIN checkout ON books.id = checkout.id 
INNER JOIN cust_books on cust_books.id = checkout.id 
ORDER BY id, title
-- get all movies with their current associated check out to list
SELECT movies.id, CONCAT(title,' ', year) AS title, year FROM movies 
INNER JOIN checkout ON movies.id = checkout.id 
INNER JOIN cust_movies on cust_movies.id = checkout.id 
ORDER BY id, title




-- add a new books
INSERT INTO books (title, author, checkedout) VALUES (:titleInput, :authorInput, :checkedOutInput)
-- add a new movies
INSERT INTO movies (title, year, checkedout) VALUES (:titleInput, :authorInput, :checkedOutInput)
-- add a new customer
INSERT INTO customer (fname, lname, phone) VALUES (:fnameInput, :lnameInput, :phoneInput)
-- add a new employee
INSERT INTO employee (fname, lname) VALUES (:fnameInput, :lnameInput)


-- associate a book with a customer (M-to-M relationship addition)
INSERT INTO cust_books (id, transNum) VALUES (:book_id_from_dropdown_Input, :cust_id_from_dropdown_Input)
-- associate a movie with a cust (M-to-M relationship addition)
INSERT INTO cust_movies (id,transNum) VALUES (:movie_id_from_dropdown_Input, :cust_id_from_dropdown_Input)



-- update a books data based on submission of the Update form 
UPDATE books SET title = :titleInput, author= :authorInput, checkedout= :checkedoutInput WHERE id= :book_ID_from_the_update_form
-- update a movie's data based on submission of the Update form 
UPDATE movies SET title = :titleInput, year= :yearInput, checkedout= :checkedoutInput WHERE id= :movie_ID_from_the_update_form
-- update a customer's data based on submission of the Update form 
UPDATE customer SET fname = :fnameInput, lname= :lnameInput, phone= :phoneInput WHERE id= :customer_ID_from_the_update_form
-- update a employee's data based on submission of the Update form 
UPDATE employee SET fname = :fnameInput, lname= :lnameInput WHERE id= :employee_ID_from_the_update_form


-- delete a book
DELETE FROM books WHERE id = :books_ID_selected_from_browse_character_page
-- delete a movie
DELETE FROM movies WHERE id = :movies_ID_selected_from_browse_character_page



-- dis-associate a book or movie from a checkout (M-to-M relationship deletion)
DELETE FROM checkout WHERE books.id = :book_ID_selected_from_browse_character_page OR movies.id = :movie_ID_selected_from_browse_character_page
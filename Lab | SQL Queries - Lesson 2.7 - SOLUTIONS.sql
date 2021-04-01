-- Lab | SQL Join (Part I)
USE sakila
-- Instructions
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name as genre_name, COUNT(DISTINCT fc.film_id)
FROM sakila.film_category fc
JOIN sakila.category c
USING (category_id)
GROUP BY fc.category_id 

-- Display the total amount recorded (sales) by each staff member in August of 2005.
SELECT SUM(amount) AS Sum_sales, staff_id 
FROM sakila.payment p
WHERE DATE(p.payment_date) BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY p.staff_id;

-- Which actor has appeared in the most films?
-- actor nr 107
SELECT actor_id, COUNT(film_id) as Nr_film
FROM sakila.film_actor 
GROUP BY actor_id
ORDER BY Nr_film DESC
LIMIT 1

-- Most active customer (the customer that has rented the most number of films)
SELECT customer_id, COUNT(rental_id) as tot_rental
FROM sakila.rental 
GROUP BY customer_id
ORDER BY tot_rental DESC
LIMIT 1

-- Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
USING (address_id)

-- List each film and the number of actors who are listed for that film.
SELECT fa.film_id, f.title, COUNT(fa.actor_id) AS number_of_actors
FROM sakila.film_actor fa
JOIN sakila.film f
USING (film_id)
GROUP BY fa.film_id
ORDER BY number_of_actors DESC;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount) AS tot_amount
FROM sakila.customer c
JOIN sakila.payment p
USING (customer_id)
GROUP BY (customer_id)
ORDER BY c.last_name ASC;

-- List number of films per category.
SELECT c.name as genre_name, COUNT(DISTINCT fc.film_id)
FROM sakila.film_category fc
JOIN sakila.category c
USING (category_id)
GROUP BY fc.category_id 
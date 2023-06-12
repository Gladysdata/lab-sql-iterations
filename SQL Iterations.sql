USE sakila ;

#Write a query to find what is the total business done by each store
SELECT s.store_id, sum(amount) income FROM rental r
JOIN payment p ON r.rental_id = p.rental_id
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id ;

#Convert the previous query into a stored procedure.
delimiter //
CREATE PROCEDURE total_business ()
BEGIN
	SELECT s.store_id, sum(amount) income FROM rental r
	JOIN payment p ON r.rental_id = p.rental_id
    JOIN staff s ON p.staff_id = s.staff_id
	GROUP BY s.store_id ;
END ;
// delimiter ;

#Convert the previous query into a stored procedure that takes the input for store_id and displays the total sales for that store.
delimiter //
CREATE PROCEDURE total_per_store ()
BEGIN
	SELECT s.store_id, sum(amount) income FROM rental r
	JOIN payment p ON r.rental_id = p.rental_id
    JOIN staff s ON p.staff_id = s.staff_id
    WHERE s.store_id = store
	GROUP BY s.store_id ;
END ;
// delimiter ;

#Update the previous query. Declare a variable total_sales_value of float type, that will store the returned result (of the total sales amount for the store). Call the stored procedure and print the results.
#stuck on this question
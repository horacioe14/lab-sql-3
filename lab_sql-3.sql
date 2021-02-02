# How many distinct (different) actors' last names are there?
SELECT  COUNT(DISTINCT(last_name)) as different_actors_last_name
FROM sakila.actor;


# In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT  COUNT(DISTINCT(language_id))
FROM sakila.film;

# How many movies were released with "PG-13" rating?
SELECT  COUNT(rating)
FROM sakila.film
WHERE rating = 'PG-13';


# Get 10 the longest movies from 2006.
SELECT title, length, release_year
FROM sakila.film
WHERE release_year = '2006'
ORDER BY length DESC
LIMIT 10;

# How many days has been the company operating (check DATEDIFF() function)?
SELECT  DATEDIFF(MAX(rental_date), MIN(rental_date))
FROM sakila.rental;


# Show rental info with additional columns month and weekday. Get 20.
SELECT *, EXTRACT(MONTH from rental_date) as month, date_format(rental_date, '%W') as weekday
FROM sakila.rental
LIMIT 20;


# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
CASE 
WHEN date_format(rental_date, '%W') IN ('Saturday' , 'Sunday') THEN 'weekend'
ELSE 'Workday'
END AS day_type
FROM sakila.rental;


# How many rentals were in the last month of activity?
SELECT COUNT(rental_date) as last_month_rentals
FROM sakila.rental
WHERE EXTRACT(MONTH from rental_date) = '02' and EXTRACT(Year from rental_date) = '2006'
ORDER BY rental_date desc;




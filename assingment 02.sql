use mavenmovies;

-- QUE-1 Retrive the total no of rental in sakila database .

select count(rental_id) as total_no_rental from rental; 

-- QUE-2 Find the average rental duration (in days )of movies rented from sakila database .alter

select avg(rental_duration) as rental_duration ,day(rental_duration) from film group by rental_duration;

-- QUE-3 Display the first name and last name of customer in uppercase .

select upper(first_name) as first_name ,upper(last_name) as last_name from customer ;

-- QUE-4 Extract month from the rental date and display it alongside the rental id.

select rental_id, month(rental_date)  from rental;

-- QUE-5 Retrive the count of rental for each customer .

select concat(first_name,'   ',last_name) as customer_name ,count(rental_id) as no_of_rental from customer 
join rental on customer.customer_id = rental.customer_id group by customer_name order by no_of_rental ; 

-- QUE-6 Find the total revenue genreted by each store .

select store_id ,sum(amount) as revenue_genreted_by_store from staff
join payment on staff.staff_id= payment.staff_id group by store_id;

-- QUE-7 Display the title of movie ,customer first and last name who rented it.

select first_name,last_name,concat(title) as movie from film
join inventory on film.film_id=inventory.film_id
join rental on inventory.inventory_id =rental.inventory_Id 
join customer on rental.customer_id=customer.customer_id ;

-- QUE-8 Retrive the name of all actor who have appeared in the film 'gone with the wind '. 

select concat(first_name,'  ',last_name) as actor_name from actor 
inner join film_actor on actor.actor_id = film_actor.actor_id 
inner join film on film_actor.film_id = film.film_id where film.title = 'gone with the wind' ;

-- QUE-9 Determine the total no of rental for each category of movies . 

select concat(name) as category_name ,count(rental_id) as no_of_rental  from category 
join film_category on category.category_id = film_category.category_id
join inventory on film_category.film_id =inventory.film_id 
join rental on inventory.inventory_id =rental.inventory_id group by category_name order by no_of_rental desc;

-- QUE-10 Find average rental rate of movies in each language . 

select language_id, avg(rental_rate) from film group by language_id ;

-- QUE-11 Retrive the customer name alongwith the total amount they have spent on rental. 

select concat(first_name,last_name)as customer_name ,sum(amount) as total_amount from customer 
join payment on customer.customer_id=payment.customer_id group by customer_name order by total_amount  ;

-- QUE-12 List the title of movie rented by each customer in perticular city( e.g london)

select title as movie , city,rental_id from film 
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id=rental.inventory_id
join staff on rental.staff_id=staff.staff_id
join customer on staff.store_id=customer.store_id
join address on customer.address_id=address.address_id
join city on address.city_id=city.city_id where city='london' group by rental_id;

-- QUE-13 Display the top 5 rented movies alongwith the no of time they have been rented 

select title  ,count(rental_id) as no_of_times_rented from film
join inventory on film.film_id=inventory.film_id 
join rental on inventory.inventory_id=rental.inventory_id group by title order by no_of_times_rented desc limit 5;

-- QUE-14 Determine the customers who have rented movies from both store .

select concat(first_name , last_name) as customer_name ,rental_id ,customer.store_id from customer 
join rental on customer.customer_id= rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id order by customer_name ;
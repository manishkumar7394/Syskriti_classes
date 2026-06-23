-- 11. Subqueries

-- 60. Find the highest-priced product.
select 
	product_name,
	price
from flipkart
where price =(
select max(price) as highest_priced
from flipkart )
-- 61. Find products priced above average price.
select 
	product_name, 
	price 
from flipkart 
where price > (
	select avg(price) as avg_price 
	from flipkart)
	
-- 62. Find sellers with above-average seller ratings.
select seller, rating from flipkart
where rating > (
select avg(rating) from flipkart )

-- 63. Find products with maximum units sold.
select 
	product_name ,
	units_sold
from flipkart
where units_sold = 
	(select max(units_sold) from flipkart)
-- 64. Find products whose rating is above category average.
select 
	product_name, category,
	rating
from flipkart f1
where rating > (select avg(rating)from flipkart f2
where f1.category = f2.category) 

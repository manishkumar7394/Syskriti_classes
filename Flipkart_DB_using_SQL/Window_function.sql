-- 13. Window Functions

-- Use: ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), LEAD()
-- 69. Rank products by price.
select product_name , price,
	rank() over(partition by product_name order by  price ) as rnk
from flipkart
order by rnk
-- 70. Rank products within each category.
select
	product_name, 
	category,
	price,
	rank() over(partition by category order by price )as rnk_price
from flipkart

-- 71. Assign row numbers based on listing date.
select 
	listing_date, 
	row_number() over(order by listing_date ) as row_nmber
from flipkart
order by row_nmber desc
-- 72. Show previous product price using LAG().
select 
	product_name, 
	price , 
	listing_date,
	lag(price) over(order by listing_date)as lag_price
from flipkart

-- 73. Show next product rating using LEAD().
select 
	product_name,
	listing_date,
	
	lead(rating) over (order by listing_date) as lead_rating

from flipkart
-- 74. Rank products within each category.
select
	product_name,
	category,
	price,
	rank() over (partition by category order by price) as rnk_products
From flipkart
-- 75. Calculate average category price using window functions.
select 
	product_name,
	category, 
	price,
	round(
	avg(price) over (
	partition by category),2) as avg_category_price
from flipkart

-- 76. Calculate cumulative units sold by seller.
select 
	product_name,
	seller, 
	units_sold,
	sum(units_sold) over (
	partition by seller 
	order by listing_date) as comulative_units_sold
from flipkart

-- 77. Find category-wise running revenue.
select
	product_name,
	category,
	listing_date,
	price,
	sum(price) over (
	partition by category
	order by listing_date, product_id) as running_revenue

from flipkart

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

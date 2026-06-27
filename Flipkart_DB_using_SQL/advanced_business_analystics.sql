-- 15. Advanced Business Analytics

-- 78. Find the best-selling category.
select 
	category, 
	sum(final_price * units_sold) as high_sales_cate
from flipkart
group by category
order by high_sales_cate desc
limit 1
-- using window function
with best_selling_cate as(
select 
	category,
	sum(final_price * units_sold) as total_revenue
from flipkart
group by category 
)
select * from (
select	
	category,
	total_revenue,
	rank() over(order by total_revenue desc) as rnk
from best_selling_cate
) t
where rnk = 1
-- 79. Find the top 5 brands by revenue.
select 
	brand ,
	sum(final_price * units_sold) as total_revenue
from flipkart
group by brand
order by total_revenue desc limit 5
-- using windowfunction
with band_revenue as (
select 
	brand ,
	sum(final_price * units_sold) as total_revenue
from flipkart
group by brand
) 
select 
	brand,
	total_revenue,
	rank() over (order by total_revenue desc) as brand_total_revenue
from band_revenue
limit 5

-- 80. Find the highest-rated seller.
select 
	seller,
	round(avg(rating),2) as avg_highest_rating
from flipkart
group by seller
order by avg_highest_rating desc
limit 1


-- 81. Find average delivery days by city.
select seller_city,
	round(avg(delivery_days),2) as avg_delivery_days
from flipkart
group by seller_city
order by avg_delivery_days desc
-- 82. Find products with low stock but high sales.
select 
	product_name,
	stock_available,
	sum(final_price* units_sold ) as total_sales
from flipkart
group by product_name, stock_available
order by total_sales desc,stock_available

-- using rnk function
with product_stock as (
select 
	product_name,
	stock_available,
	sum(final_price* units_sold ) as total_sales
from flipkart
group by product_name, stock_available
)
select *, 
	rank() over (
	order by total_sales desc,
	stock_available asc) as rnk	
from product_stock

-- 83. Find products that need restocking.
select 
	product_name, 
	(stock_available) as low_stock
from flipkart

order by low_stock asc
	
-- 84. Find the best-rated product in each category.
with best_rated_product as (
select 
	product_name, 
	category,
	rating,
	rank() over(
	partition by category 
	order by rating desc) as rnk
from flipkart
)
select * from best_rated_product 
where rnk = 1
	

-- 85. Find inactive sellers with very low sales.

SELECT
    seller,
    MAX(listing_date) AS last_listing
FROM flipkart
GROUP BY seller
HAVING MAX(listing_date) < CURRENT_DATE - INTERVAL '6 months';

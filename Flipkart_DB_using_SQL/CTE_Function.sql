-- 12. Common Table Expressions (CTEs)

-- 65. Create a CTE to calculate category-wise average price.
with category_wise_avg as (
	select 
		category,
		round(avg(price)::numeric,2) as avg_atogory 
	from flipkart
	group by category
) 
select * from category_wise_avg;
-- 66. Find categories with average price above overall average.

with category_wise_avg as (
	select 
		category,
		round(avg(price)::numeric,2) as avg_category 
	from flipkart
	group by category
	
) 
select * from category_wise_avg
where avg_category> (
	select avg(price) as avg_price 
	from flipkart)
-- 67. Create seller sales summaries using a CTE.
with summry as (
	select 
		seller,
		count(*) as total_products, 
		sum(price) as revenue,
		sum(final_price* units_sold) as total_revenue,
		round(avg(rating),2) as avg_rating
	from flipkart
group by  seller)
select * from summry



-- 68. Find top-performing sellers using CTEs.
with summry as (
	select 
		seller,
		count(*) as total_products, 
		sum(price) as revenue,
		sum(final_price* units_sold) as total_revenue,
		round(avg(rating),2) as avg_rating
	from flipkart
	group by  seller)
select * from summry
order by total_revenue desc
limit 1
-- ⸻

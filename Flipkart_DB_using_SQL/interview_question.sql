-- 86. Find the top-selling product in each category.
with top_selling as 
	( SELECT 
			product_name,
			category,
			sum(units_sold) as total_sold,
			rank() over(partition by category order by sum(units_sold) desc) as rnk
		FROM flipkart
		GROUP BY category, product_name
		ORDER BY total_sold desc
	)
	
SELECT *
FROM top_selling
where rnk = 1


-- 87. Find the second highest-priced product.
SELECT 
	product_name,
	max(price) as max_price
FROM flipkart
GROUP BY product_name 
order by max_price desc
limit 1 offset 1

--OR with subquery

select product_name, price
from flipkart
where price <(
select max(price) as max_price from flipkart)
order by price desc
limit 1

-- or using Dense_rank function 

SELECT product_name ,  price, rank
FROM (
    SELECT product_name,price,
           DENSE_RANK() OVER ( ORDER BY price DESC) AS rank
    FROM flipkart
) ranked
WHERE rank = 2;


-- 88. Find the third highest-rated product.
SELECT  product_name, rating , rnk
FROM (
	SELECT
		product_name,
		rating, 
		DENSE_RANK() OVER (ORDER BY rating desc)  as rnk
	FROM flipkart
	  ) t
WHERE rnk= 3

-- 89. Find products priced above their category average.

-- 90. Find brands that sell products in multiple categories.
-- 91. Find the seller with the maximum number of products.
-- 92. Calculate each category’s percentage contribution to total revenue.
-- 93. Find duplicate product names.
-- 94. Find products with no sales.
-- 95. Find categories with the highest average rating.
-- 96. Find the most profitable seller.
-- 97. Find the top 3 products in every category.
-- 98. Calculate running total revenue.
-- 99. Identify products with increasing sales trends.

-- 100. Create a complete sales performance dashboard query using CTEs and window functions.

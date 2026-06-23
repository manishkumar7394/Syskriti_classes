
CREATE TABLE flipkart (
    product_id VARCHAR(15) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    seller VARCHAR(100),
    seller_city VARCHAR(50),
    price NUMERIC(10,2),
    discount_percent INT,
    final_price NUMERIC(10,2),
    rating NUMERIC(3,2),
    review_count INT,
    stock_available INT,
    units_sold INT,
    listing_date DATE,
    delivery_days INT,
    weight_g NUMERIC(10,2),
    warranty_months INT,
    color VARCHAR(20),
    size VARCHAR(10),
    return_policy_days INT,
    is_returnable BOOLEAN,
    payment_modes VARCHAR(100),
    shipping_weight_g NUMERIC(10,2),
    product_score NUMERIC(5,2),
    seller_rating NUMERIC(3,2)
);

-- 1. Basic SELECT & WHERE

-- 1. Retrieve all products.
select 
	category, 
	product_name 
from flipkart; 
-- 2. Display products from the Electronics category.
select 
	product_name,
	category 
from flipkart
where  category = 'Electronics';
-- 3. Find products with a rating greater than 4.
select product_name , rating 
from flipkart
where rating  >4 ;
-- 4. Show products priced below ₹5,000.
select product_name, price 
from flipkart
where price < 5000
order by price desc
-- 5. Find all returnable products.
select product_name, is_returnable
from flipkart
where is_returnable = true;
-- 6. Display products sold by a specific seller.
select product_name, seller
from flipkart
where seller = 'SmartDeals'
-- 7. Find products with stock greater than 100.
select product_name, stock_available 
from flipkart 
where stock_available > 100

-- 8. Show products with warranty greater than 12 months.
select product_name, warranty_months 
from flipkart 
where warranty_months  >12 
-- 9. Find products available in a specific color.
select product_name, stock_available, color
from flipkart
where color = 'White'
-- 10. Display products with delivery days less than 5.
select product_name , delivery_days 
from flipkart
where delivery_days  < 5
-- ⸻

-- 2. ORDER BY & LIMIT

-- 11. List products by highest price.
select product_name, price
from flipkart 
order by price desc
limit 1;

-- 12. List products by lowest price.
select product_name, price
from flipkart 
order by price 
limit 1;

-- 13. Show the top 10 highest-rated products.
select product_name, rating
from flipkart 
order by rating desc
limit 10;

-- 14. Show the top 5 most sold products.
select product_name, units_sold
from flipkart 
order by units_sold desc
limit 5;

-- 15. Display the 10 newest listed products.
select product_name, listing_date
from flipkart
order by listing_date desc
limit 10 ;
-- 16. Find the 5 products with the shortest delivery time.
select product_name, delivery_days
from flipkart
order by delivery_days 
limit 5 ;
-- ⸻

-- 3. Aggregate Functions

-- 17. Count total products.
select count(distinct(product_name)) as total_products
from flipkart;
-- 18. Calculate total units sold.
select sum(units_sold) as total_units
from flipkart;
-- 19. Find average product rating.
select   avg(rating ) as product_rating
from flipkart
-- 20. Find the highest price.
select max(price) as max_price
from flipkart
-- 21. Find the lowest price.
select min(price) as lowest_price from flipkart;
-- 22. Calculate average seller rating.
select avg(seller_rating) from flipkart
-- 23. Find total stock available.
select sum(stock_available) as total_stck_available
from flipkart
-- 24. Calculate average discount percentage.
select avg(discount_percent) as avg_discount from flipkart
-- ⸻

-- 4. GROUP BY

-- 25. Count products in each category.
select category,  count(product_name) as total_products 
from flipkart
group by category
order by total_products desc
-- 26. Find average price by category.
select category, round(avg(price)::numeric,2) as avg_price 
from flipkart
group by category

-- 27. Find average rating by brand.
select brand, round(avg(rating)::numeric,2) as avg_rating 
from flipkart
group by brand

-- 28. Calculate total units sold by seller.
select seller, round(sum(units_sold)::numeric,2) as total_sold_units
from flipkart
group by seller
order by seller desc;

-- 29. Count products by color.
select color, count(*) as total_color_prod
from flipkart
group by color 
order by total_color_prod desc
-- 30. Find total revenue by seller city.
select seller_city , sum(final_price) as total_revenue
from flipkart
group by seller_city
order by total_revenue desc
-- ⸻

-- 5. HAVING

-- 31. Find categories with average rating above 3.
select category, avg(rating) as avg_rating
from flipkart
group by category
having avg(rating) > 3
-- 32. Find brands having more than 5 products.
select brand, count(*) as total_prod
from flipkart
group by brand
having count(*) > 5
-- 33. Find sellers with total sales above 1,000 units.
select seller, sum(final_price) as total_seles
from flipkart
group by seller
having sum(final_price)> 1000
-- 34. Find cities with more than 10 sellers.
select seller_city, count(seller) as totaL_seller
from flipkart
group by seller_city
having count(seller) >10
-- 35. Find categories generating revenue above ₹1,000,000.
select category , sum(final_price) as total_revenue 
from flipkart
group by category
having sum(final_price)>1000000
-- ⸻

-- 6. String Functions

-- Use: UPPER()
-- LOWER()
-- INITCAP()
-- LENGTH()
-- SUBSTRING()
-- CONCAT()
-- REPLACE()
-- TRIM()

-- 36. Display product names in uppercase.
select upper(product_name)
from flipkart
-- 37. Display brand names in lowercase.
select lower(brand )from flipkart

-- 38. Find the length of each product name.
select product_name, length(product_name)
from flipkart
-- 39. Extract the first 5 characters from product names.
select product_name,left(product_name,5) as first_5_char_name
from flipkart
-- 40. Concatenate product name and brand.
select 
	product_name, 
	brand, 
	concat(upper(brand),'_',product_name) as concatee
from flipkart
-- 41. Replace spaces in product names with underscores.
select replace(product_name,' ', '_') as repalce_into_underscore from flipkart
-- 42. Display product names without leading/trailing spaces.
select trim(product_name) from flipkart
-- ⸻

-- 7. Numeric Functions

-- -- Use: ROUND() ,CEIL(), FLOOR(), ABS(), POWER(), MOD()

-- 43. Round product prices to whole numbers.
select round(price,2) as roundd from flipkart
-- 44. Calculate the square of final price.
select ceil(final_price)  from flipkart
-- 45. Find the remainder when discount_percent is divided by 5.
select * from flipkart

-- 46. Round seller ratings to one decimal place.
-- 47. Calculate the absolute difference between price and final_price.

-- ⸻

-- 8. Date Functions

-- Use: CURRENT_DATE ,AGE(), EXTRACT() ,DATE_PART()
-- 48. Find how many days ago each product was listed.
-- 49. Find products listed in the current year.
-- 50. Count products listed each month.
-- 51. Find the oldest listed product.
-- 52. Extract month and year from listing_date.
-- 53. Calculate average product age.

-- ⸻

-- 9. CASE Statements

-- 54. Classify ratings:

-- * 4.5+ = Excellent
-- * 4.0–4.49 = Good
-- * 3.0–3.99 = Average
-- * Below 3 = Poor

-- 55. Classify delivery speed:

-- * 1–3 Days = Fast
-- * 4–7 Days = Medium
-- * 8+ Days = Slow

-- 56. Categorize stock:

-- * 100 = High Stock
-- * 50–100 = Medium Stock
-- * <50 = Low Stock

-- ⸻

-- 10. NULL Handling

-- Use: COALESCE(), NULLIF() 
-- 57. Replace NULL seller ratings with 0.
-- 58. Convert rating value 0 to NULL.
-- 59. Replace NULL warranty values with “No Warranty”.

-- ⸻

-- 11. Subqueries

-- 60. Find the highest-priced product.
-- 61. Find products priced above average price.
-- 62. Find sellers with above-average seller ratings.
-- 63. Find products with maximum units sold.
-- 64. Find products whose rating is above category average.

-- ⸻

-- 12. Common Table Expressions (CTEs)

-- 65. Create a CTE to calculate category-wise average price.
-- 66. Find categories with average price above overall average.
-- 67. Create seller sales summaries using a CTE.
-- 68. Find top-performing sellers using CTEs.

-- ⸻

-- 13. Window Functions

-- Use: ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), LEAD()
-- 69. Rank products by price.
-- 70. Rank products within each category.
-- 71. Assign row numbers based on listing date.
-- 72. Show previous product price using LAG().
-- 73. Show next product rating using LEAD().

-- ⸻

-- 14. PARTITION BY

-- 74. Rank products within each category.
-- 75. Calculate average category price using window functions.
-- 76. Calculate cumulative units sold by seller.
-- 77. Find category-wise running revenue.

-- ⸻

-- 15. Advanced Business Analytics

-- 78. Find the best-selling category.
-- 79. Find the top 5 brands by revenue.
-- 80. Find the highest-rated seller.
-- 81. Find average delivery days by city.
-- 82. Find products with low stock but high sales.
-- 83. Find products that need restocking.
-- 84. Find the best-rated product in each category.
-- 85. Find inactive sellers with very low sales.

-- ⸻

-- 16. Interview-Level SQL Questions

-- 86. Find the top-selling product in each category.
-- 87. Find the second highest-priced product.
-- 88. Find the third highest-rated product.
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
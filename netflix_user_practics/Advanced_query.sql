-- 8. Window Functions Practice (20 Questions)

-- 1. Rank users by watch time.
select user_id, avg_watch_time_minutes, 
rank () over (order by avg_watch_time_minutes ) as watch_time
from netflix_user
order by watch_time desc

-- 2. Dense rank users by ratings.
select user_id, rating_given, 
dense_rank() over (order by rating_given desc) as rating_dense_rank
from netflix_user 

-- 3. Find top users per country.
with top_user as (
select user_id, country, avg_watch_time_minutes,
rank() over (partition by country order by avg_watch_time_minutes desc) as rnkk
from netflix_user
)
select * from top_user
where rnkk = 1;

-- 4. Calculate running total revenue.
select 
	user_id, country, monthly_fee,
	round(sum(monthly_fee) over (order by user_id)::numeric,2) as total_revenue
from netflix_user

-- 5. Find average fee by country using window function.
select 
	user_id,
	country,
	monthly_fee, 
	round(
	avg(monthly_fee) over (partition by country
	)::numeric, 2)  as avg_fee
from netflix_user

-- 6. Compare user fee with avg fee.
select
	user_id,
	monthly_fee,
	round(
		avg(monthly_fee) over ()::numeric,2) as avg_fee
from netflix_user

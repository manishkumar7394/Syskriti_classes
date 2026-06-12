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

-- 7. Rank genres by popularity.
select favorite_genre, 
	rank() over( order by count(*)) as total_user
from netflix_user
group by favorite_genre

-- OR
select favorite_genre,
	sum(content_interactions) total_interactions,
	rank () over(order by sum(content_interactions)) as rnk_genre
from netflix_user
group by favorite_genre

-- 8. Find previous user’s watch time.
select user_id, avg_watch_time_minutes,
lag(avg_watch_time_minutes) over (order by user_id)
from netflix_user
-- 9. Find next user’s rating.
select user_id, rating_given,
lead(rating_given) over (order by user_id) as next_user
from netflix_user

-- 10. Calculate cumulative watch sessions)
select user_id, 
		watch_sessions_per_week, 
		sum (watch_sessions_per_week) over(order by user_id) as cumulative_watches
from netflix_User

-- 11. Find top binge watcher in each subscription type.
with top_binge_watcher as(
select 
	user_id, 
	subscription_type, 
	binge_watch_sessions,
	rank() over (
	partition by subscription_type 
	order by binge_watch_sessions desc
	) as rank_binge
from netflix_User
)
select * from top_binge_watcher
where rank_binge = 1;

-- 12. Calculate percentage contribution of revenue.
SELECT
    user_id,
    monthly_fee,
    ROUND((
        (monthly_fee * 100.0) /
        SUM(monthly_fee) OVER ())::numeric,
        2
    ) AS revenue_percentage
from Netflix_User
-- 13. Rank users by interactions.
select 
	user_id,
	content_interactions,
	row() 
	over(order by content_interactions desc  ) as rnk
from netflix_user

-- 14. Find rolling average watch time.
select 
	user_id,
	avg_watch_time_minutes,
	round(
		avg(avg_watch_time_minutes)
		over(order by user_id)
	::numeric, 2) as avg_watcher
from netflix_user
-- 15. Find highest rated user per genre.
with highest_rated as (
select 
	user_id,
	favorite_genre,
	rating_given,
	rank() over(partition by favorite_genre order by rating_given) as rnk
from netflix_User
) 
select * from highest_rated
where rnk = 1;

-- 16. Compare user completion rate with genre avg.
select 
	user_id,
	completion_rate,
	favorite_genre,
	round(
	avg(completion_rate) 
	over (partition by favorite_genre )
	::numeric,2) as avg_genre,
	case
		when completion_rate > avg(completion_rate) 
			over (partition by favorite_genre ) then 'above_avg'
		when completion_rate < avg(completion_rate) 
			over (partition by favorite_genre ) then 'below_avg'
		else 'equal_avg'
	end as compare_user

from netflix_user

-- 17. Rank countries by churn count
select 
	country, count(*) as churned_count,
	dense_rank() over ( order by count(*) ) as rnk
from netflix_user
where churned = true
group by country

-- 18. Find lowest inactivity user per device.

with lowest_inactivity as (
select 
	user_id, 
	primary_device, 
	days_since_last_login,
	row_number() over ( 
	partition by primary_device
	order by days_since_last_login ) as rnk
from netflix_user
)
select * from lowest_inactivity
where rnk = 1 ;


-- 19. Find top 3 users per country.
select * from (
select 
	user_id, 
	country, 
	avg_watch_time_minutes,
	row_number() over (
	partition by country 
	order by avg_watch_time_minutes desc) as rnk
from netflix_user
) t
where rnk <=3

-- 20. Calculate moving average monthly fee.
select 
	user_id, 
	monthly_fee, 
	round(
	avg(monthly_fee) over ( 
		order by user_id 
		rows between 2 preceding 
		and current row )
	::numeric , 2 ) as avg_monthly_fee
from netflix_user

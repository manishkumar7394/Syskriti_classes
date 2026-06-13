-- 9. Subquery Practice (20 Questions)

-- 1. Find users with fee above average fee.
select user_id, monthly_fee   
from netflix_user
where monthly_fee >
( select avg(monthly_fee) as avg_fee from netflix_user)

-- 2. Find users with watch time above overall average.
select user_id, avg_watch_time_minutes 
from netflix_user
where avg_watch_time_minutes > (
select avg(avg_watch_time_minutes) as avg_watch_time
from netflix_user
)
-- 3. Retrieve countries having highest users.
select country , count(user_id ) as total_user
from netflix_user


-- 4. Find users whose rating equals max rating.
select user_id, rating_given 
from netflix_user
where rating_given >= (
select max(rating_given) max_rating 
from netflix_user
)
-- 5. Find users inactive more than avg inactivity.
select 
	user_id,
	days_since_last_login
from netflix_user
where days_since_last_login > (
select avg(days_since_last_login) as avg_last_login
from netflix_User
)
-- using  window function 

select * from (
select 
	user_id,
	days_since_last_login,
	round(
	avg(days_since_last_login) over()
	:: numeric , 2) as avg_last_login 
from netflix_user
) t
where days_since_last_login > avg_last_login 

-- 6. Show genres with highest avg rating.
with genre_avg as (
select favorite_genre , avg(rating_given) as avg_rating
from netflix_user 
group by favorite_genre
)
select * from genre_avg
where avg_rating =(
select max(avg_rating) as max_rating from genre_avg
)

-- using window function
with genre_avg as (
select 
	favorite_genre ,
	avg(rating_given) as avg_rating,
	rank() over (order by  avg(rating_given) desc) as max_genre_avg
from netflix_user
group by favorite_genre
)
select * from genre_avg
where max_genre_avg = 1;


-- 7. Find users using max devices.

select 
	user_id,
	devices_used 
from netflix_user
where devices_used =(
	select max(devices_used) as max_devices 
	from netflix_User
)

-- 8. Find countries with revenue above avg revenue.
with country_revenue as (
select 
	country ,
	sum(monthly_fee ) as revenue
from netflix_user
group by country
)
select * from country_revenue
where revenue > (
select avg( revenue) as avg_revenue 
from country_revenue
)

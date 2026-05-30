-- 1. Basic SELECT Queries (20 Questions)
----------------------------------------------------------------------

-- 1. Show all users from India.
select * from netflix_user
where country = 'India'
limit  10;

-- 2. Display users whose age is greater than 30.
select 
	user_id, 
	gender,
	subscription_type,
	age  
from netflix_user
where age >30;

-- 3. Find users with Premium subscriptions.
select 
	user_id,
	favorite_genre,
	subscription_type,
	primary_device,
	devices_used 
from netflix_user 
where Subscription_type = 'Premium';

-- 4. Show users who use Mobile as primary device.
select 
	user_id,
	favorite_genre, 
	subscription_type,
	primary_device,
	devices_used  
from netflix_user
where primary_device ='Mobile';

-- 5. Retrieve users who pay using Credit Card.
select 	user_id,
	subscription_type,
	primary_device,
	devices_used,
	payment_method
from netflix_user
where payment_method = 'Credit Card';

-- 6. Find users whose monthly fee is greater than 15.
select 	
	user_id, 
	favorite_genre,
	subscription_type,
	primary_device,
	devices_used 
from netflix_user
where monthly_fee > 15;

-- 7. Display users with binge watch sessions more than 10.
select
	user_id,
	favorite_genre,
	subscription_type,
	primary_device, 
	binge_watch_sessions
from netflix_user
where binge_watch_sessions > 10;

-- 8. Find users who rated content above 4.
select
	user_id,
	age,
	favorite_genre,
	avg_watch_time_minutes,
	rating_given
	
from netflix_user 
where rating_given >=4;

-- 9. Show users whose completion rate is above 80%.
select 	
	user_id,
	age,
	favorite_genre,
	avg_watch_time_minutes,
	rating_given ,
	completion_rate
from netflix_user
where completion_rate >80;

-- 10. Display users inactive for more than 30 days.
select
	user_id,
	gender,
	age,
	country,
	days_since_last_login
from netflix_user
where days_since_last_login >30;

-- 11. Retrieve users who watch Action genre.
select
	user_id, 
	gender, age,
	country,
	favorite_genre,
	avg_watch_time_minutes
from netflix_user
where favorite_genre = 'Action';

-- 12. Find users using more than 3 devices.
select 
	user_id, 
	gender, age,
	country,
	favorite_genre
from netflix_user
where devices_used  >3 ;

-- 13. Display female users from Canada.
select 
	user_id, 
	gender, age,
	country
from netflix_User
where gender = 'Female' and country = 'Canada';

-- 14. Find users with avg watch time above 200 minutes.
select
	user_id, 
	favorite_genre,
	avg_watch_time_minutes 
from netflix_user
where avg_watch_time_minutes > 200;

-- 15. Show users with recommendation click rate below 20%.
select * from netflix_user
where recommendation_click_rate  < 20;

-- 16. Find churned users.
select 
	user_id, 
	churned
from netflix_user
where churned = 'true'

-- 17. Display non-churned users.
select 
	count(churned)
from netflix_user
where churned = 'false'

-- 18. Find users aged between 18 and 25.
select 
	user_id,
	age,
	gender,
	country
from netflix_user
where age between 18 and 25
order by age ;

-- 19. Show users whose account age is more than 24 months.
select  * from netflix_user 
where account_age_months > 24;

-- 20. Retrieve users ordered by monthly fee descending.
select 
	user_id,
	favorite_genre,
	subscription_type,
	primary_device,
	devices_used ,
	monthly_fee
from netflix_user
order by monthly_fee desc;

-- ⸻
-----------------------------------------------------------------------------------------
-- 2. WHERE Clause Practice (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Find users from USA with Premium plan.
select 
	user_id,
	age,
	favorite_genre,
	subscription_type,
	primary_device,
	devices_used 
from netflix_user 
where country  = 'USA' and subscription_type = 'Premium';

-- 2. Show users aged less than 20.
select 
	user_id,
	age, 
	gender,
	country,
	favorite_genre
from netflix_user 
where age < 20;

-- 3. Find users with completion rate between 70 and 90.
select * from netflix_user
where completion_rate between 70 and 90;

-- 4. Display users who have not logged in for 60 days.
select * from netflix_user
where days_since_last_login > 60 
			-- or
SELECT 
    user_id,
    subscription_type,
    days_since_last_login
FROM netflix_user
WHERE days_since_last_login > 60
AND churned = 'Yes';

-- 5. Find users whose rating is exactly 5.
select * from netflix_user 
where rating_given = 5;

-- 6. Show users with watch sessions per week greater than 15.
select * from netflix_user
where watch_sessions_per_week > 15;

-- 7. Find users using TV as primary device.
select * from netflix_user 
where primary_device = 'Smart TV';

-- 8. Retrieve users who pay through PayPal.
select * from netflix_user 
where payment_method = 'PayPal'

-- 9. Find users with avg watch time less than 100.
select * from netflix_user
where avg_watch_time_minutes <100;

-- 10. Show users whose favorite genre is Comedy.
select * from netflix_user
where favorite_genre = 'Comedy';

-- 11. Find users with monthly fee between 10 and 20.
select * from netflix_user
where monthly_fee between 10 and 20;

-- 12. Display users whose recommendation click rate is above 50%.
select * from netflix_user
where recommendation_click_rate > 50;

-- 13. Find users who use exactly 2 devices.
select * from netflix_user
where devices_used = 2;

-- 14. Show churned users from UK.
select * from netflix_user
where country = 'UK' 
and churned = true;

-- 15. Find users whose account age is less than 6 months.
select user_id, country,subscription_type, account_age_months 
from netflix_user
where account_age_months < 6


-- 16. Retrieve users who binge watch frequently.
select 
	user_id ,
	favorite_genre, 
	avg_watch_time_minutes, 
	binge_watch_sessions
from netflix_user
where binge_watch_sessions > 11
order by binge_watch_sessions desc

-- 17. Find users with low completion rates.
select user_id, favorite_genre, avg_watch_time_minutes,completion_rate 
from netflix_user
where completion_rate <(
select avg(completion_rate) as avg_completion_rate from netflix_user)
order by completion_rate 

-- 18. Display users who interact with content more than 100 times.
select user_id, favorite_genre, content_interactions
from netflix_User
where content_interactions > 100
order by  content_interactions ;

-- 19. Find users whose age is not between 25 and 40.
select user_id , age   from netflix_user
where age not between 25 and 40
order by age;

-- 20. Show users who have not churned and use Laptop.
select user_id ,favorite_genre, avg_watch_time_minutes, churned  
from netflix_user 
where churned = false;
-- ⸻

-----------------------------------------------------------------------------------------
-- 3. Aggregate Functions (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Find average monthly fee.
select  avg(monthly_fee)  as avg_monthly_fee
from netflix_user;

-- 2. Find maximum age of users.
select max(age) as max_age from netflix_user

-- 3. Find minimum completion rate.
select miN(completion_rate) from netflix_user

-- 4. Count total users.
select count(user_id) from netflix_user

-- 5. Count churned users.
select count(churned) from netflix_user

-- 6. Find average watch time.
select avg(avg_watch_time_minutes) from netflix_user

-- 7. Find total revenue from subscriptions.
SELECT 
    ROUND(SUM(monthly_fee)::numeric, 2) AS total_revenue
FROM netflix_user;

-- 8. Find highest rating given.
select max(rating_given) as max from netflix_User;

-- 9. Find average recommendation click rate.
select avg(recommendation_click_rate) from netflix_user;

-- 10. Count users per country.
select   country, count(*) as total_user
from netflix_user
group by country;

-- 11. Find average binge watch sessions.
select avg(binge_watch_sessions) as avg_binge from netflix_user;

-- 12. Find total content interactions.
select sum(content_interactions) as total_interactions from netflix_user;

-- 13. Find average account age.
select avg(account_age_months) as avg_account_age from netflix_user;

-- 14. Find maximum days since last login.
select max(days_since_last_login) as max_last_login from netflix_user;

-- 15. Count Premium subscribers.
select count(subscription_type)as total_premium 
from netflix_user
where subscription_type = 'Premium';

-- 16. Find average devices used.
select avg(devices_used)  as avg_devices_used 
from netflix_user 

-- 17. Find total users by gender.
select gender, count(*) from netflix_user
group by gender;

-- 18. Find average monthly fee by subscription type.
select subscription_type, 
avg(monthly_fee) as avg_monthly_fee
from netflix_user
group by subscription_type;

-- 19. Find total watch sessions per week.
select sum(watch_sessions_per_week) as total_session_per_week from netflix_user;

-- 20. Find average rating grouped by favorite genre.
select favorite_genre, avg(rating_given) as avg_rating
from netflix_User
group by favorite_genre;

-- ⸻

-----------------------------------------------------------------------------------------
-- 4. GROUP BY Practice (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Count users by country.
select country, count(*)  as total_user 
from netflix_user
group by country;

-- 2. Count users by subscription type.
select subscription_type, count(*) as total_user
from netflix_user
group by subscription_type;

-- 3. Find average monthly fee by payment method.
select payment_method, round(avg(monthly_fee):: numeric, 2) as avg_monthly_fee
from netflix_user
group by payment_method;

-- 4. Find average watch time by genre.
select favorite_genre, round(avg(avg_watch_time_minutes)::numeric,2) as avg_watch_time
from netflix_user
 group by favorite_genre;
 
-- 5. Count churned users by country.
select country, count(churned ) as total_churned
from netflix_user
where churned = True
group by country;

-- 6. Find average rating by gender.
select favorite_genre, round(avg(rating_given):: numeric , 2) as avg_rating
from netflix_user
group by favorite_genre;

-- 7. Count users by primary device.
select primary_device, count(*)  as total_users
from netflix_user
group by primary_device;

-- 8. Find total revenue by subscription type.
select subscription_type, 
round(sum(monthly_fee)::numeric, 2) as total_revenue
from netflix_user
group by subscription_type;

-- 9. Find avg completion rate by genre.
select favorite_genre, round(avg(completion_rate):: numeric , 2) as avg_completion_rate
from netflix_user
group by favorite_genre;

-- 10. Count users by payment method.
select payment_method, round(count(*):: numeric , 2) as total_users
from netflix_user
group by payment_method;

-- 11. Find average binge sessions by subscription type.
select subscription_type, round(avg(binge_watch_sessions)::numeric,2) as avg_binge_watch
from netflix_user
group by subscription_type

-- 12. Count users by churn status.
select churned, count(*) as total_churn
from netflix_user
group by churned;

-- 13. Find average age by country.
select country, avg(age) as avg_age
from netflix_user
group by country;

-- 14. Count users by favorite genre.
select favorite_genre, count(*) as tootal_user
from netflix_user
group by favorite_genre;

-- 15. Find total interactions by genre.
select favorite_genre, sum(content_interactions) as total_interaction
from netflix_user
group by favorite_genre;

-- 16. Find average recommendation click rate by device.
select primary_device, avg(recommendation_click_rate) as avg_recomnedation_click_rate
from netflix_user 
group by primary_device
-- 17. Find avg account age by subscription type.
select subscription_type, round(avg(account_age_months):: numeric, 2  )avg_account_age 
from netflix_User
group by subscription_type

-- 18. Find maximum watch time by country.
select country, max(avg_watch_time_minutes) as max_watch_time
from netflix_User
group by country;

-- 19. Count users by gender and country.
select favorite_genre, country, count(*) total_user
from netflix_User
group by favorite_genre, country
order by  total_user desc;

-- 20. Find average rating by subscription type.
select subscription_type, round(avg(rating_given):: numeric, 2) as avg_rating
from netflix_User
group by subscription_type;

-- ⸻

-----------------------------------------------------------------------------------------
-- 5. HAVING Clause Practice (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Find countries having more than 100 users.
select 
	country,
	count(*) as total_user
from netflix_user
group by country
having count(*) >100
order by total_user;

-- 2. Show genres with average rating above 4.
select favorite_genre, avg(rating_given) as avg_rating
from netflix_user
group by favorite_genre
having avg(rating_given) >4

-- 3. Find subscription types generating revenue above 5000.
select subscription_type, round(sum(monthly_fee)::numeric,2) as total_revenue
from netflix_user
group by subscription_type
having sum(monthly_fee) > 5000
order by total_revenue desc;

-- 4. Show devices used by more than 50 users.
select devices_used, count(*) as total_user
from netflix_User
group by devices_used
having count(*) >50;

-- 5. Find countries with avg watch time below 200.
select  country, avg(avg_watch_time_minutes) as avg_watch_time
from netflix_user
group by country
having avg(avg_watch_time_minutes) < 200;

-- 6. Show payment methods used by more than 30 users.
select payment_method , count(*) as total_user 
from netflix_user
group by payment_method
having count(*) > 30
;
-- 7. Find genres with completion rate above 80%.
select favorite_genre,  avg(completion_rate) as total_completion_rate
from netflix_user
group  by favorite_genre
having avg(completion_rate) > 80;

-- 8. Show subscription plans with avg monthly fee above 15.
select subscription_type, avg(monthly_fee) as avg_monthlyfee
from netflix_user
group by subscription_type
having avg(monthly_fee) >15;

-- 9. Find countries where churned users exceed 20.
select country, count(churned) as total_user
from netflix_user
where churned = True
group by country
having count(*) >20;

-- 10. Show devices with avg click rate above 40%.
select primary_device, round(avg(recommendation_click_rate)::numeric,2) as avg_click_rate 
from netflix_user
group by primary_device
having avg(recommendation_click_rate) <40;

SELECT *
FROM (
    SELECT 
        primary_device,
        ROUND(AVG(recommendation_click_rate)::numeric, 2) AS avg_click_rate
    FROM netflix_user
    GROUP BY primary_device
) t
WHERE avg_click_rate > 40
ORDER BY avg_click_rate DESC;
-- 11. Find genres having avg binge sessions above 7.
select favorite_genre, avg(binge_watch_sessions) as avg_binge_watch
from netflix_user
group by favorite_genre 
having avg(binge_watch_sessions) >7;

-- 12. Show countries with avg account age above 24 months.
select country, round(avg(account_age_months)::numeric,2) as account_age
from netflix_user
group by country 
having avg(account_age_months) >24;

-- 13. Find genders with avg rating above 3.5.
select gender, round(avg(rating_given)::numeric,2) as rating
from netflix_user
group by gender
having avg(rating_given) >3.5
;
-- 14. Show payment methods generating revenue above 2000.
select payment_method , sum(monthly_fee ) as total_revenue
from netflix_user
group by payment_method
having sum(monthly_fee) > 2000;

-- 15. Find genres with more than 70 users.
select favorite_genre, count(*) as total_user
from netflix_user
group by favorite_genre
having count(*) > 70;

-- 16. Show countries with avg days since login above 15.
select country, avg(days_since_last_login) as avg_last_days_Login
from netflix_user
group by country
having avg(days_since_last_login) >15
;
-- 17. Find subscription types with avg interactions above 100.
select subscription_type, avg(content_interactions) as avg_interactions
from netflix_user
group by subscription_type
having  avg(content_interactions) >100;

-- 18. Show genres where avg watch sessions exceed 10.
select favorite_genre, avg(avg_watch_time_minutes) as avg_watch_session
from netflix_user
group by favorite_genre
having  avg(avg_watch_time_minutes) >10;

-- 19. Find devices with avg completion rate below 60%.
select 
	primary_device,
	round(avg(completion_rate)::numeric,1) as avg_completion_rate
from netflix_user
group by primary_device
having  avg(completion_rate) > 64.4
order by avg_completion_rate desc;

-- 20. Show countries having more non-churned users.
select country, count(*) as total_non_churned
from netflix_user
where churned = False
group by country
order by total_non_churned desc
-- ⸻

-----------------------------------------------------------------------------------------
-- 6. ORDER BY + LIMIT Practice (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Show top 10 users by watch time.
select user_id, favorite_genre, sum(avg_watch_time_minutes) as total_watch_time
from netflix_User
group by user_id, favorite_genre
order by total_watch_time desc
limit 10;

-- 2. Find top 5 countries by revenue.
select country, round(sum(monthly_fee)::numeric,2) as revenue
from netflix_user
group by country
order by revenue desc
limit 5;

-- 3. Display highest rated users.
select user_id,favorite_genre, rating_given  as highest_rating
from netflix_user
order by highest_rating desc
;
-- 4. Show lowest completion rate users.
select user_id, completion_rate as lowest_rate
from netflix_user
order by lowest_rate;

-- 5. Find top binge watchers.
select favorite_genre,max(binge_watch_sessions) as top_binge
from netflix_user
group by favorite_genre
order by top_binge desc;

-- 6. Display users with highest interactions.
select user_id,  content_interactions 
from netflix_user
order by content_interactions desc limit 3;

-- 7. Show newest account holders.
select user_id, account_age_months
from netflix_user
order by account_age_months limit 3;

-- 8. Find oldest accounts.
select user_id, account_age_months
from netflix_user
order by account_age_months  desc limit 3;

-- 9. Display top genres by avg watch time.
select
	favorite_genre, 
	round(avg(avg_watch_time_minutes)::numeric,2)  as avg_watch_time
from netflix_user
group by favorite_genre
order by avg_watch_time desc

-- 10. Find countries with lowest churn.
select country, count(churned) as total_churned
from netflix_User
where churned = True
group by country
order by total_churned asc;

-- 11. Show top users by recommendation clicks.
select user_id, recommendation_click_rate
from netflix_user
order by recommendation_click_rate desc

-- 12. Find top subscription plans by revenue.
select subscription_type , round(sum(monthly_fee)::numeric,1) as revenue
from netflix_user
group by subscription_type
order by revenue desc;

-- 13. Display lowest rated genres.
select favorite_genre, min(rating_given) as lowest_rating
from netflix_user
group by favorite_genre
limit 1;

-- 14. Show top countries by avg rating.
select country ,round(avg(rating_given)::numeric,2) as avg_rating
from netflix_user
group by country

-- 15. Find users with maximum devices used.
select user_id ,max(devices_used)as max_device_used
from netflix_user
group by user_id
order by max_device_used desc
limit 5;

-- 16. Display users inactive for longest time.
select user_id, days_since_last_login
from netflix_user
order by days_since_last_login desc

-- 17. Show highest monthly fee payers.
select user_id, monthly_fee 
from netflix_user
order by monthly_fee desc limit 1

-- 18. Find top genres by interactions
select favorite_genre, sum(content_interactions) as total_genres
from netflix_user
group by favorite_genre
order by total_genres desc limit 1

-- 19. Display lowest watch session users.
select 
    user_id,
    watch_sessions_per_week,
    favorite_genre,
    subscription_type
from netflix_user
order by  watch_sessions_per_week 
limit  1;
-- 20. Show most popular payment methods.
SELECT
    payment_method,
    COUNT(*) AS total_users
FROM netflix_user
GROUP BY payment_method
HAVING COUNT(*) = (
    SELECT MAX(method_count)
    FROM (
        SELECT COUNT(*) AS method_count
        FROM netflix_user
        GROUP BY payment_method
    ) t
);
 -- or-- 
select payment_method, count(*) as total_payment
from netflix_User
group by payment_method
order by total_payment desc limit 1;
-- ⸻

-----------------------------------------------------------------------------------------
-- 7. CASE WHEN Practice (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Categorize users as Young, Adult, Senior.
-- 2. Label users as Active/Inactive based on last login.
-- 3. Create High/Low watcher categories.
-- 4. Categorize ratings as Good/Bad.
-- 5. Label churn risk based on inactivity days.
-- 6. Categorize binge watchers.
-- 7. Create fee category: Low/Medium/High.
-- 8. Label recommendation engagement.
-- 9. Categorize account age.
-- 10. Label devices usage level.
-- 11. Categorize completion rate.
-- 12. Label users based on interaction count.
-- 13. Create genre popularity category.
-- 14. Categorize subscription value.
-- 15. Label users based on sessions per week.
-- 16. Create loyalty level using account age.
-- 17. Categorize payment behavior.
-- 18. Create activity score category.
-- 19. Label premium customers.
-- 20. Categorize users based on churn status.

-- ⸻

-----------------------------------------------------------------------------------------
-- 8. Window Functions Practice (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Rank users by watch time.
-- 2. Dense rank users by ratings.
-- 3. Find top users per country.
-- 4. Calculate running total revenue.
-- 5. Find average fee by country using window function.
-- 6. Compare user fee with avg fee.
-- 7. Rank genres by popularity.
-- 8. Find previous user’s watch time.
-- 9. Find next user’s rating.
-- 10. Calculate cumulative watch sessions.
-- 11. Find top binge watcher in each subscription type.
-- 12. Calculate percentage contribution of revenue.
-- 13. Rank users by interactions.
-- 14. Find rolling average watch time.
-- 15. Find highest rated user per genre.
-- 16. Compare user completion rate with genre avg.
-- 17. Rank countries by churn count.
-- 18. Find lowest inactivity user per device.
-- 19. Find top 3 users per country.
-- 20. Calculate moving average monthly fee.

-- ⸻

-----------------------------------------------------------------------------------------
-- 9. Subquery Practice (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Find users with fee above average fee.
-- 2. Find users with watch time above overall average.
-- 3. Retrieve countries having highest users.
-- 4. Find users whose rating equals max rating.
-- 5. Find users inactive more than avg inactivity.
-- 6. Show genres with highest avg rating.
-- 7. Find users using max devices.
-- 8. Find countries with revenue above avg revenue.
-- 9. Retrieve users with completion rate below avg.
-- 10. Find users with minimum monthly fee.
-- 11. Show top revenue subscription type.
-- 12. Find users with above avg interactions.
-- 13. Retrieve genres with lowest completion rate.
-- 14. Find countries with highest churn.
-- 15. Show users with highest binge sessions.
-- 16. Find users with account age above avg.
-- 17. Retrieve users with below avg click rate.
-- 18. Find most used payment method.
-- 19. Find least popular genre.
-- 20. Retrieve countries with maximum watch time.

-- ⸻

-----------------------------------------------------------------------------------------
-- 10. CTE (Common Table Expressions) Practice (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Create CTE for high-paying users.
-- 2. Find top binge watchers using CTE.
-- 3. Calculate country revenue using CTE.
-- 4. Find avg rating per genre using CTE.
-- 5. Identify churn risk users.
-- 6. Create CTE for active users.
-- 7. Find users with above avg watch time.
-- 8. Create revenue summary report.
-- 9. Find top countries by completion rate.
-- 10. Create engagement score using CTE.
-- 11. Find users with low interactions.
-- 12. Calculate avg sessions per device.
-- 13. Create subscription performance report.
-- 14. Find genres with highest engagement.
-- 15. Create user segmentation report.
-- 16. Find inactive Premium users.
-- 17. Calculate country-wise churn rate.
-- 18. Create monthly fee category report.
-- 19. Find highly loyal users.
-- 20. Build user activity leaderboard.

-- ⸻

-----------------------------------------------------------------------------------------
-- 11. Advanced Business Problems (20 Questions)
-----------------------------------------------------------------------------------------

-- 1. Which country generates maximum revenue?
-- 2. Which subscription type has highest churn?
-- 3. Which genre keeps users engaged longest?
-- 4. What factors affect churn most?
-- 5. Which payment method has lowest churn?
-- 6. Which device users watch most content?
-- 7. Which age group binge watches most?
-- 8. Which users are likely to upgrade plans?
-- 9. Which countries have low engagement?
-- 10. Which genre has highest completion rate?
-- 11. What is the retention rate by subscription type?
-- 12. Which users should receive recommendation emails?
-- 13. Which segment has highest lifetime value?
-- 14. Which device has highest user retention?
-- 15. Which country has highest Premium adoption?
-- 16. Which users are potential churn risks?
-- 17. Which payment method contributes most revenue?
-- 18. Which age group interacts most with content?
-- 19. Which subscription plan performs best overall?
-- 20. Build a customer loyalty score model using SQL.
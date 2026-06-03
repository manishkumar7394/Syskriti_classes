
-- 7. CASE WHEN Practice (20 Questions)

-- 1. Categorize users as Young, Adult, Senior.
select 
	user_id, age,
	case
		when age <30 then 'Young'
		when age < 45 then 'Adult'
		else 'Senior'
		end as age_cat

from netflix_user

-- 2. Label users as Active/Inactive based on last login.
select 
	user_id, days_since_last_login,
	case
		when days_since_last_login <30 then 'active'
		else 'Inactive'
		end as last_login

from netflix_user

-- 3. Create High/Low watcher categories.
select 
	favorite_genre, 
	watch_sessions_per_week ,
	case 
	when watch_sessions_per_week <9.5 then 'Low'
	else 'high'
	end as categories_watcher
from netflix_User

-- 4. Categorize ratings as Good/Bad.
select 
	user_id,
	favorite_genre,
	rating_given ,
	case
		when rating_given <2.5 then  'bad'
		else 'Good'
	end as cat_rating

from netflix_user
-- 5. Label churn risk based on inactivity days.
select 
	days_since_last_login ,
	case
		when days_since_last_login <30 then 'low_risk' 
		else 'High_risk'
	end as inactivity_days 
from netflix_user

-- 6. Categorize binge watchers.
select
	favorite_genre,
	binge_watch_sessions,
	case 
		when binge_watch_sessions<7 then 'light_binge_watcher'
		else 'heavy_binge_watcher'
	end as cat_binge_water
from netflix_user

-- 7. Create fee category: Low/Medium/High.
select 
	user_id,
	monthly_fee,
	case
		when monthly_fee <10 then 'Low'
		when monthly_fee < 14 then 'medium'
		else 'High'
	end as cat_monthly_fee
from netflix_user;

-- 8. Label recommendation engagement.
select 
	user_id,
	recommendation_click_rate,
	case
		when recommendation_click_rate >=70 then 'High_engagement'
		when recommendation_click_rate>= 40 then 'Medium_engagement'
		else 'Low_engagement'
	end as cat_engagement
from netflix_User;

-- 9. Categorize account age.
select 
	user_id,
	account_age_months ,
	case 
		when account_age_months <20 then 'fresh_acc'
		when account_age_months <40 then 'medium_acc'
		else 'heavy_acc'
	end as cate_acc_age

from netflix_user
	
-- 10. Label devices usage level.
select 
	user_id,
	subscription_type,
	devices_used,
	case 
		when devices_used <1 then 'waste'
		when devices_used = 1 then 'normal'
		when devices_used >1 then 'pro'
		else ' primium_user'
	end as device_lavel
from netflix_user

-- 11. Categorize completion rate and show the avg_user category name
with  avg_user as (
select 
	user_id,
	completion_rate,
	case 
		when completion_rate <=25 then 'not_intrested' 
		when completion_rate <=50 then 'avg_user'
		when completion_rate <=75 then 'good'
		else 'excellent '
	end as completion_rate_cat
		from netflix_user
	)
select * from avg_user
where completion_rate_cat = 'avg_user'

-- 12. Label users based on interaction count.

select user_id , 
	content_interactions ,
	case 
		when content_interactions < 15 then 'low_interaction'
		when content_interactions <30 then 'avg_interaction'
		else 'High_interation'
	end  as cat_interactions
from netflix_user

-- 13. Create genre popularity category.
select 
	favorite_genre,
	rating_given,
	case 
		when rating_given <1.5 then 'bad'
		when rating_given <3.5 then 'avg'
		else 'excellent'
	end as popularity_cat
from netflix_user

-- 14. Categorize subscription value.
select subscription_type, monthly_fee,
	case when monthly_fee < 10.5 then 'basic_subs'
		when monthly_fee < 14 then 'standard_subs'
		else 'premium-subs'
	end as cat_subs_value
from netflix_user
group by subscription_type

-- 15. Label users based on sessions per week.
select user_id, watch_sessions_per_week, 
case when watch_sessions_per_week < 9.5 then 'low_activity'
else 'high_activity'
end as lable_sessions_per_week
from netflix_user

-- 16. Create loyalty level using account age.
select 
	user_id,
	account_age_months,
	case
		when account_age_months < 15  then 'new_user'
		when account_age_months < 30  then 'loyal_user'
		else 'pro_loyal_user'
	end as loyalty 
	
	from netflix_user

-- 17. Categorize payment behavior.
select 
	user_id, monthly_fee, 
	case when monthly_fee < 10 then 'low_spender'
		when monthly_fee < 14 then 'mid_spender'
		else 'High_spender'
	end as cat_payments
from netflix_user

-- 18. Create activity score category.
select 
    user_id,
    content_interactions,
    case
        when content_interactions < 15 then 'Low Activity'
        when content_interactions < 30 then 'Moderate Activity'
      else 'High Activity'
    end as  activity_score_category
from  netflix_user
order by  activity_score_category

-- 19. Label premium customers.
select 
	user_id,
	subscription_type,
case 
	when subscription_type = 'Premium' then 'premium_customer'
	else 'regular_customer'
end as premium_customers
from netflix_user

-- 20. Categorize users based on churn status.
select 
	user_id, 
	churned,
	case
		when churned= True then ' churned_user'
		else 'active_user'
	end as churned_status
from netflix_user

-- ⸻

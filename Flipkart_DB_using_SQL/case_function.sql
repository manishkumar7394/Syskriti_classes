-- 9. CASE Statements

-- 54. Classify ratings:
-- * 4.5+ = Excellent
-- * 4.0–4.49 = Good
-- * 3.0–3.99 = Average
-- * Below 3 = Poor
select rating, 
	case 
		when rating >= 4.5 then 'excellent'
		when rating >= 4.0 then 'good'
		when rating>= 3.0 then 'avg'
		else 'poor'
		end as categories_rating
from flipkart

-- 55. Classify delivery speed:
-- * 1–3 Days = Fast
-- * 4–7 Days = Medium
-- * 8+ Days = Slow
select
	delivery_days,
	case when delivery_days <=3 then 'fast'
	when delivery_days <= 7 then 'medium'
	else 'slow' 
	end as delivery_speed 
from flipkart

-- 56. Categorize stock:
-- * 100 = High Stock
-- * 50–100 = Medium Stock
-- * <50 = Low Stock
select 
	stock_available, 
	case when stock_available >= 100 then 'high_stock'
		 when stock_available >= 50 then 'medium_stock'
		 else 'low_stock'
		 end as categorize_stock
from flipkart
order by stock_available ;


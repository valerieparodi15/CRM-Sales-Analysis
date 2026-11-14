-- Feature Engineering
create view crm_analysis as
select *,
	case
		when deal_stage ='Won' then 1
		else 0
		end as won_flag,
	case
		when deal_stage= 'Lost' then 1
		else 0
		end as lost_flag,
	datediff(day,engage_date,close_date) as days_to_close,
	case
		when deal_stage <> 'Won' then NULL
		when close_value < 2000 then 'Small'
		when close_value >5000 then 'Medium'
		else 'Large'
		end as deal_size,
	 year(engage_date)-year_established AS company_age_at_engagemnt
from crm_master;

select * from crm_analysis
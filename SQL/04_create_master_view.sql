-- create master table 
create view crm_master as
select
sp.*,
a.sector,
a.revenue as company_revenue,
a.employees,
a.office_location,
a.year_established,
p.series,
p.sales_price,
st.manager,
st.regional_office
from sales_pipeline_clean as sp
left join accounts as a
	on sp.account = a.account
left join products as p
	on sp.product  = p.product
left join sales_teams as st
	on sp.sales_agent = st.sales_agent;

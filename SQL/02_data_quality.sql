-- Inspecting mismatches within tables
select distinct sp.product
from sales_pipeline sp
left join products as p
	on sp.product =p.product
where p.product IS NULL;



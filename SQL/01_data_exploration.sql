/*===========================================
CRM-Sales-Analysis
Author: Valerie Parodi
Purpose: Initial Data Exploration
=============================================*/

-- Preview Tables

select top 10 * 
from accounts;

select top 10 * 
from products;

select top 10 * 
from sales_teams;

select top 10 * 
from sales_pipeline;

select top 10 * 
from crm_master;

-- Total Opportunities
select count(*)
from sales_pipeline;


-- Count Missing Accounts from Sales Pipeline

select count(*)
from sales_pipeline as sp
where sp.account IS NULL;

-- Distinct account sectors
select distinct sector
from accounts
order by sector;

-- Company Revenue Summary (in millions)
select 
round(min(revenue),2) as min_revenue,
round(avg(revenue),2) as avg_revenue,
round(max(revenue),2) as max_revenue
from accounts;

-- Product Pricing Summary
select
min(sales_price) as min_sale_price,
avg(sales_price) as avg_sale_price,
max(sales_price) as max_sale_price
from products;

-- Deal stages
select  distinct deal_stage
from sales_pipeline;

-- Company Employee Summary
select 
min(employees) as min_employees,
avg(employees) as avg_employees,
max(employees) as max_employees
from accounts;

-- Manager distribution
select manager,count(*) as num_reporting
from sales_teams
group by manager;

-- Deal stage distribution and proportions
select deal_stage, 
count(*) as deal_count,
count(*) * 1.0/(select count(*) from sales_pipeline) as proportion
from sales_pipeline
group by deal_stage


-- Opportunities by sales agent
select 
sales_agent,
count(*) as opportunities
from sales_pipeline
group by sales_agent
order by opportunities desc;

-- Opportunities by product
select 
product,
count(*) as opportunities
from sales_pipeline
group by product
order by opportunities desc;

-- Revenue by sales agent
select 
sales_agent,
sum(close_value) as total_revenue
from sales_pipeline
group by sales_agent
order by total_revenue desc;

-- Close revenue summary
select 
min(close_value) as min_close_value,
avg(close_value) as avg_close_value,
max(close_value) as max_close_value
from sales_pipeline;


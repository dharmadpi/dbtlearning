 {{ config(materialized='table') }}


select 1 as employee_id,'Jeeva' as employee_name,30 as age from dual
union
select 2 as employee_id,'Dharma' as employee_name,35 as age from dual
union
select 3 as employee_id,'karthik' as employee_name,40 as age from dual
union
select 4 as employee_id,'Prabha' as employee_name,25 as age from dual
union
select 5 as employee_id,'Narendra' as employee_name,50 as age from dual
union
select 6 as employee_id,'Narendra_baby' as employee_name,50 as age from dual
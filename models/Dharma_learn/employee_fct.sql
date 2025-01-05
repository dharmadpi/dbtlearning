{{
   config(
        materialized='incremental',
        on_schema_change='fail'
   )
}}

with emp_def as (select employee_id,employee_name,age from {{ ref("employee") }})

select employee_id,employee_name,age from emp_def

{% if is_incremental() %}
where employee_id > ( select max(employee_id) from {{ this }})
{% endif %}

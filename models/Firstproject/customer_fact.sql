/*

select customer.customer_name,city from {{ ref("CUSTOMER") }}
left join {{ ref("CUSTOMER_ADDRESS")}}
on customer.customer_name=CUSTOMER_ADDRESS.customer_name 

*/

{{
   config(
        materialized='incremental',
        on_schema_change='fail'
   )

}}

WITH SRC_CUSTOMER AS ( SELECT CUSTOMER_ID,CUSTOMER_NAME FROM {{ ref("CUSTOMER") }} ),
 SRC_ADDRESS AS ( SELECT CUSTOMER_NAME,CITY FROM {{ ref("CUSTOMER_ADDRESS")}})

select src_customer.customer_id,SRC_CUSTOMER.customer_name,city from SRC_CUSTOMER join SRC_ADDRESS on
SRC_CUSTOMER.customer_name=SRC_ADDRESS.customer_name
--where src_customer.customer_name='Ramya'

{% if is_incremental() %}
and customer_id > ( select max(customer_id) from {{this}})
{% endif %}
{% snapshot scd_customer %}

{{
   config (
     unique_key='customer_id',
     strategy='timestamp',
     updated_at='updated_time'
   )

}}

select * from {{ ref("CUSTOMER") }}

{% endsnapshot %}
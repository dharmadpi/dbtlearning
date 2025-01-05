{% snapshot scd_customer_check %}
{{
    config (
        unique_key='customer_name',
        strategy='check',
        check_cols='all'
    )
}}

select * from {{ ref("CUSTOMER")}}
{% endsnapshot %}
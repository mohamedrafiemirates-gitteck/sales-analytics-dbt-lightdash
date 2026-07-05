{{ config(schema='marts') }}

select
    customer_id,
    customer_name,
    country,
    segment
from {{ ref('stg_customers') }}
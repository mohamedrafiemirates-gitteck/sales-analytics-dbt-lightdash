select
    customer_id,
    customer_name,
    country,
    segment
from {{ source('raw', 'customers') }}
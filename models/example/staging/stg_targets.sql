select
    target_id,
    cast(month as date) as month,
    country,
    cast(sales_target as float64) as sales_target
from {{ source('raw', 'targets') }}


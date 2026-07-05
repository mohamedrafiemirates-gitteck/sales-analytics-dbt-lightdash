select
    product_id,
    product_name,
    category,
    cast(unit_cost as float64) as unit_cost
from {{ source('raw', 'products') }}
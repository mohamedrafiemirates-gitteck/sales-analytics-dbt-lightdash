select
    order_item_id,
    order_id,
    product_id,
    cast(quantity as int64) as quantity,
    cast(unit_price as float64) as unit_price
from {{ source('raw', 'order_items') }}
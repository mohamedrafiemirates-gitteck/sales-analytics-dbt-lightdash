{{ config(schema='marts') }}

select
    oi.order_item_id,
    oi.order_id,
    o.customer_id,
    oi.product_id,
    o.order_date,
    oi.quantity,
    oi.unit_price,
    p.unit_cost,
    oi.quantity * oi.unit_price as sales_amount,
    oi.quantity * p.unit_cost as cost_amount,
    (oi.quantity * oi.unit_price) - (oi.quantity * p.unit_cost) as gross_profit
from {{ ref('stg_order_items') }} oi
left join {{ ref('stg_orders') }} o
    on oi.order_id = o.order_id
left join {{ ref('stg_products') }} p
    on oi.product_id = p.product_id
    
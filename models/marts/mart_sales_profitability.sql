{{ config(schema='marts') }}

select
    fs.order_id,
    fs.order_item_id,
    fs.order_date,
    dc.customer_id,
    dc.customer_name,
    dc.country,
    dc.segment,
    dp.product_id,
    dp.product_name,
    dp.category,
    fs.quantity,
    fs.unit_price,
    fs.unit_cost,
    fs.sales_amount as total_sales,
    fs.cost_amount as total_cost,
    fs.gross_profit,
    fs.gross_profit as net_profit,
    safe_divide(fs.gross_profit, fs.sales_amount) as gross_margin_pct,
    safe_divide(fs.gross_profit, fs.sales_amount) as net_margin_pct
from {{ ref('fact_sales') }} fs
left join {{ ref('dim_customers') }} dc
    on fs.customer_id = dc.customer_id
left join {{ ref('dim_products') }} dp
    on fs.product_id = dp.product_id    
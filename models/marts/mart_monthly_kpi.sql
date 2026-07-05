{{ config(schema='marts') }}

with sales_monthly as (
    select
        date_trunc(order_date, month) as month,
        country,
        sum(sales_amount) as total_sales,
        sum(cost_amount) as total_cost,
        sum(gross_profit) as gross_profit
    from {{ ref('mart_sales_profitability') }}
    group by 1, 2
),

expenses_monthly as (
    select
        month,
        sum(expense_amount) as total_expenses
    from {{ ref('fact_expenses') }}
    group by 1
),

targets_monthly as (
    select
        month,
        country,
        sum(sales_target) as sales_target
    from {{ ref('stg_targets') }}
    group by 1, 2
)

select
    s.month,
    s.country,
    s.total_sales,
    s.total_cost,
    s.gross_profit,
    coalesce(e.total_expenses, 0) as total_expenses,
    s.gross_profit - coalesce(e.total_expenses, 0) as net_profit,
    safe_divide(s.gross_profit, s.total_sales) as gross_margin_pct,
    safe_divide(s.gross_profit - coalesce(e.total_expenses, 0), s.total_sales) as net_margin_pct,
    coalesce(t.sales_target, 0) as sales_target,
    s.total_sales - coalesce(t.sales_target, 0) as sales_variance
from sales_monthly s
left join expenses_monthly e
    on s.month = e.month
left join targets_monthly t
    on s.month = t.month
    and s.country = t.country
    
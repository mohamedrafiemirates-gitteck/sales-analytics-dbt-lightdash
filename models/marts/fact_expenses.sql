{{ config(schema='marts') }}

select
    expense_id,
    month,
    department,
    expense_amount
from {{ ref('stg_expenses') }}
select
    expense_id,
    cast(month as date) as month,
    department,
    cast(expense_amount as float64) as expense_amount
from {{ source('raw', 'expenses') }}


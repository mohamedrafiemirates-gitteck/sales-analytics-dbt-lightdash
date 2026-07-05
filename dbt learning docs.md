Perfect. Then next step is dbt documentation from the terminal side.
You now understand the UI. The learning point is:

## schema.yml = where we write business documentation and tests

## dbt docs generate = converts that YAML + SQL models into documentation site
## dbt docs serve = opens the documentation website

Lineage graph = shows source → staging → mart dependency flow

Now do this check:

## dbt ls --select mart_sales_profitability

This confirms dbt can identify that model.

Then run:
## dbt ls --select +mart_sales_profitability+

This shows the full lineage selection from terminal: parents + selected model + children.

This is important because in real projects, you do not only click lineage in docs. You also use dbt commands to understand and run dependency chains.

What you learned from this part:
dbt debug
Checks whether dbt can connect to BigQuery.
Your connection is working.

dbt run
Builds the models/views in BigQuery.
Example: staging views, dim tables/views, fact views, mart views.

dbt test
Validates data quality rules.
Example: not_null, unique.

schema.yml
Stores documentation and tests.
This is where you describe models and columns.

dbt docs generate
Creates the documentation files inside target/.
It combines SQL models, YAML descriptions, tests, lineage, and BigQuery metadata.

dbt docs serve
Opens the dbt documentation website.

Lineage graph
Shows how raw data becomes staging, then dimensions/facts, then final marts.

Interview wording:

“I built a dbt Core project on BigQuery with raw source tables, staging models, dimensional/fact models, and final mart views. I added schema.yml documentation and data quality tests, generated dbt docs, and used lineage graphs to validate upstream and downstream dependencies for BI-ready datasets.”
Next logical step: connect this final marts dataset to a BI layer like Lightdash, Looker Studio, or Power BI.


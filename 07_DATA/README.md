# Data & Provenance

This repository now includes a **reproducible synthetic sample dataset** so the Python and SQL layers can actually be executed from GitHub without inventing access to the original source system.

## Included data
- `retail_orders_sample.csv` — 600 synthetic retail orders for 2025.
- `enterprise_retail_sample.db` — SQLite database containing the same data in `retail_orders`.
- `schema.sql` — table definition for rebuilding the SQLite table.
- `DATA_DICTIONARY.csv` — column-level definitions.

## Important provenance note
The sample dataset is **synthetic and reproducible**, not a claim that it is the original source data used to create the supplied Power BI/Tableau visuals. The Excel dashboard explicitly describes 600 practice orders, while the supplied Tableau visuals contain a different analytical scale. Those artifacts remain separate and are not silently merged.

The Power BI report is included as a direct `.pbix` file. The supplied working Tableau workbook is included as one canonical packaged `.twbx` with its packaged Hyper data.

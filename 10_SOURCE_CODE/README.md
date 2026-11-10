# Source Code & Validation

The repository keeps one canonical Python analysis artifact: `05_PYTHON_ANALYTICS/Enterprise_Retail_Analytics.ipynb`.

The notebook reads the included synthetic sample dataset and performs data-quality checks, KPI analysis, monthly trend analysis, regional performance analysis, and category profitability analysis.

For a lightweight automated data check, run:

```bash
python 11_TESTS/validate_dataset.py
```

The SQL layer is executable against `07_DATA/enterprise_retail_sample.db` using `06_SQL/enterprise_retail_business_analysis.sql`.

The project also includes the supplied working Tableau packaged workbook at `04_TABLEAU/Enterprise_Retail_AI_Analytics_Tableau.twbx`; it is not a fabricated workbook.

from pathlib import Path
import csv
import sqlite3

ROOT = Path(__file__).resolve().parents[1]
CSV_PATH = ROOT / "07_DATA" / "retail_orders_sample.csv"
DB_PATH = ROOT / "07_DATA" / "enterprise_retail_sample.db"
REQUIRED = {"order_id","order_date","customer_id","region","category","product_name","quantity","revenue","cost","profit","order_status","discount_pct"}

with CSV_PATH.open(encoding="utf-8") as f:
    rows = list(csv.DictReader(f))
assert len(rows) == 600, f"Expected 600 rows, got {len(rows)}"
assert set(rows[0]) == REQUIRED, "CSV schema mismatch"
assert len({r["order_id"] for r in rows}) == len(rows), "Duplicate order IDs found"
assert not any(any(v == "" for v in r.values()) for r in rows), "Blank values found"

con = sqlite3.connect(DB_PATH)
count = con.execute("SELECT COUNT(*) FROM retail_orders").fetchone()[0]
assert count == len(rows), f"SQLite row count {count} != CSV row count {len(rows)}"
print("PASS: dataset schema, row count, uniqueness, blanks, and SQLite row count validated.")

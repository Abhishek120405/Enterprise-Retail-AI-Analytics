-- Enterprise Retail AI Analytics — SQLite schema
-- Recreates the table used by the included business SQL.

DROP TABLE IF EXISTS retail_orders;

CREATE TABLE retail_orders (
    order_id TEXT PRIMARY KEY,
    order_date TEXT NOT NULL,
    customer_id TEXT NOT NULL,
    region TEXT NOT NULL,
    category TEXT NOT NULL,
    product_name TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    revenue REAL NOT NULL,
    cost REAL NOT NULL,
    profit REAL NOT NULL,
    order_status TEXT NOT NULL,
    discount_pct REAL NOT NULL
);

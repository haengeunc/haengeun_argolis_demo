---
type: Table
title: User Order Facts
description: Derived table containing user lifetime order facts.
tags: [looker, view, derived, user_order_facts]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: user-order-facts-base
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/views_derived/user_order_facts.view.lkml
    title: User Order Facts Derived View
---

# Schema

Derived schema for `user_order_facts`, calculated via SQL from `order_items`.

| Field Name | Type | Description | Group Label |
| :--- | :--- | :--- | :--- |
| `user_id` | number | Primary Key (Hidden) | |
| `first_order` | time | Timeframes: date, week, month, year | |
| `latest_order` | time | Timeframes: date, week, month, year | |
| `days_as_customer` | number | Days between first and latest order | Lifetime Profile |
| `days_as_customer_tiered` | tier | Tiered days as customer | Lifetime Profile |
| `lifetime_orders` | number | | Lifetime Profile |
| `repeat_customer` | yesno | Lifetime Count of Orders > 1 | Lifetime Profile |
| `lifetime_orders_tier` | tier | | Lifetime Profile |
| `distinct_months_with_orders` | number | Number of Months with Active Orders | Lifetime Profile |
| `lifetime_revenue` | number | | Lifetime Profile |
| `lifetime_revenue_tier` | tier | | Lifetime Profile |
| `currently_active_customer` | yesno | Active in last 30 days | Lifetime Profile |

# Measures

| Measure Name | Type | Description |
| :--- | :--- | :--- |
| `average_lifetime_orders` | average | Average Lifetime Orders |
| `average_lifetime_revenue` | average | Average Lifetime Margin |
| `active_user_count` | sum | Conditional sum of user IDs |

# Computation

The derived table is computed using the following SQL:

```sql
SELECT
    user_id
    , COUNT(DISTINCT order_id) AS lifetime_orders
    , SUM(sale_price) AS lifetime_revenue
    , CAST(MIN(created_at)  AS TIMESTAMP) AS first_order
    , CAST(MAX(created_at)  AS TIMESTAMP)  AS latest_order
    , COUNT(DISTINCT FORMAT_TIMESTAMP('%Y%m', created_at))  AS number_of_distinct_months_with_orders
  FROM bigquery-public-data.thelook_ecommerce.order_items
  GROUP BY user_id
```

# Notes
- This is a Derived Table (PDT or ephemeral depending on configuration, triggered by `orders_datagroup`).
- It aggregates data from `order_items` to compute user lifetime value and profile.

---
type: Table
title: Orders
description: Effective orders data combining base schema and refinements.
tags: [looker, view, orders]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: orders-base
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/views/orders.view.lkml
    title: Orders Base View
  - id: orders-layer
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/staging_views/orders.layer.lkml
    title: Orders Layer (Refinement)
---

# Schema

Effective schema for the `orders` view, mapping to the underlying BigQuery table `bigquery-public-data.thelook_ecommerce.orders`.

| Field Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `order_id` | number | Primary Key | Base |
| `user_id` | number | Hidden in layer | Base / Layer |
| `created` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `delivered` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `num_of_item` | number | | Base |
| `returned` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `shipped` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `status` | string | | Base |

# Measures

| Measure Name | Type | Description | Group Label | Source |
| :--- | :--- | :--- | :--- | :--- |
| `count` | count | Drill fields available | | Base |
| `first_order` | date | `MIN(${created_date})` | | Layer |
| `latest_order` | date | `MAX(${created_date})` | | Layer |
| `order_count_last_month` | period_over_period | Previous month | Period-over-period | Layer |
| `order_count_last_year` | period_over_period | Previous year | Period-over-period | Layer |
| `order_count_last_year_difference` | period_over_period | Difference from previous year | Period-over-period | Layer |
| `order_count_last_year_percet_change` | period_over_period | % change from previous year | Period-over-period | Layer |
| `sales_previous_month` | period_over_period | Previous month sales | | Layer |
| `sales_month_over_month_change` | period_over_period | MoM % change | | Layer |

# Notes
- This view includes extensive Period-over-Period measures in the layer.
- `user_id` is hidden in the effective view.

---
type: Table
title: Order Items
description: Effective order items data combining base schema and refinements.
tags: [looker, view, order_items]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: order-items-base
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/views/order_items.view.lkml
    title: Order Items Base View
  - id: order-items-layer
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/staging_views/order_items.layer.lkml
    title: Order Items Layer (Refinement)
---

# Schema

Effective schema for the `order_items` view, mapping to the underlying BigQuery table `bigquery-public-data.thelook_ecommerce.order_items`.

| Field Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `id` | number | Primary Key | Base |
| `created` | time | Timeframes: raw, time, date, week, month, month_name, quarter, year | Base / Layer |
| `delivered` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `inventory_item_id` | number | | Base |
| `order_id` | number | | Base |
| `product_id` | number | | Base |
| `returned` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `sale_price` | number | | Base |
| `shipped` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `status` | string | With HTML formatting for status icons | Base / Layer |
| `user_id` | number | | Base |

# Measures

| Measure Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `count` | count | Drill fields available | Base |
| `total_sale_price` | sum | Total revenue generated per item. With custom formatting and synonyms. | Layer |
| `average_sale_price` | average | Average sale price | Layer |
| `first_order` | date | `MIN(${created_date})` | Layer |
| `latest_order` | date | `MAX(${created_date})` | Layer |

# Notes
- The `status` field has HTML conditional formatting.
- `total_sale_price` has synonyms defined: "revenue", "total value", "unit price", "line item value".

---
type: Table
title: Inventory Items
description: Effective inventory items data combining base schema and refinements.
tags: [looker, view, inventory_items]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: inventory-items-base
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/views/inventory_items.view.lkml
    title: Inventory Items Base View
  - id: inventory-items-layer
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/staging_views/inventory_items.layer.lkml
    title: Inventory Items Layer (Refinement)
---

# Schema

Effective schema for the `inventory_items` view, mapping to the underlying BigQuery table `bigquery-public-data.thelook_ecommerce.inventory_items`.

| Field Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `id` | number | Primary Key | Base |
| `cost` | number | | Base |
| `created` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `product_brand` | string | | Base |
| `product_category` | string | | Base |
| `product_department` | string | | Base |
| `product_distribution_center_id` | number | | Base |
| `product_id` | number | | Base |
| `product_name` | string | | Base |
| `product_retail_price` | number | | Base |
| `product_sku` | string | | Base |
| `sold` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `inventory_status` | string | 'In Stock' or 'Sold' based on `sold_raw` | Layer |
| `cost_tier` | string | Low (<20), Medium (20-100), High (>=100) | Layer |

# Measures

| Measure Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `count` | count | Drill fields available | Base |
| `total_cost` | sum | Total Inventory Cost | Layer |
| `average_cost` | average | Average Item Cost | Layer |
| `total_retail_price` | sum | Total Potential Retail Price | Layer |
| `average_retail_price` | average | Average Item Retail Price | Layer |
| `inventory_profit_margin` | sum | `product_retail_price - cost` | Layer |
| `in_stock_count` | sum | Items In Stock | Layer |
| `sold_items_count` | sum | Items Sold | Layer |
| `distinct_products_in_inventory` | count_distinct | Distinct Products in Inventory | Layer |
| `percentage_sold` | number | Percentage of Items Sold | Layer |

# Notes
- This view includes derived dimensions like `inventory_status` and `cost_tier`.
- It includes many financial measures related to inventory value and margin.

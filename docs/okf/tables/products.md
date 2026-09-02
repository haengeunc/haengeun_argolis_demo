---
type: Table
title: Products
description: Effective products data combining base schema and refinements.
tags: [looker, view, products]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: products-base
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/views/products.view.lkml
    title: Products Base View
  - id: products-layer
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/staging_views/products.layer.lkml
    title: Products Layer (Refinement)
---

# Schema

Effective schema for the `products` view, mapping to the underlying BigQuery table `bigquery-public-data.thelook_ecommerce.products`.

| Field Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `id` | number | Primary Key | Base |
| `brand` | string | With Google search link and suggest configuration | Base / Layer |
| `category` | string | | Base |
| `cost` | number | | Base |
| `department` | string | | Base |
| `distribution_center_id` | number | | Base |
| `name` | string | | Base |
| `retail_price` | number | | Base |
| `sku` | string | | Base |

# Measures

| Measure Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `count` | count | Drill fields available | Base |
| `total_cost` | sum | Total cost of an item | Layer |

# Notes
- The `brand` dimension includes a dynamic link to Google Search.
- Suggest parameters are configured for `brand`.

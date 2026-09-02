---
type: Dataset
title: Fulfillment Explore
description: Explore information about inventory, products, and distribution centers.
tags: [looker, explore, fulfillment]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: fulfillment-explore
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/explores/fulfillment.explore.lkml
    title: Fulfillment Explore Definition
---

# Definition

This Explore is rooted in `inventory_items` and joins products and distribution centers to analyze fulfillment and inventory.

## Joins

| View Name | Join Type | Relationship | SQL On |
| :--- | :--- | :--- | :--- |
| `products` | left_outer | many_to_one | `${inventory_items.product_id} = ${products.id}` |
| `distribution_centers` | left_outer | many_to_one | `${products.distribution_center_id} = ${distribution_centers.id}` |

# Notes
- Useful for inventory management, stock analysis, and distribution logistics.

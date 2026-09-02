---
type: Dataset
title: Customers & Orders Explore
description: Explore information about orders placed by customers, joining order items, users, and products.
tags: [looker, explore, customer_orders]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: customer-orders-explore
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/explores/customer_orders.explore.lkml
    title: Customer Orders Explore Definition
  - id: quick-starts-explore
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/explores/quick_starts.explore.lkml
    title: Quick Starts Queries
---

# Definition

This Explore is rooted in `order_items` and joins several related tables to provide a comprehensive view of customer orders.

## Joins

| View Name | Join Type | Relationship | SQL On / Notes |
| :--- | :--- | :--- | :--- |
| `users` | left_outer | many_to_one | `${order_items.user_id} = ${users.id}` |
| `user_order_facts` | left_outer | many_to_one | `${user_order_facts.user_id} = ${order_items.user_id}` |
| `products` | left_outer | many_to_one | `${order_items.product_id} = ${products.id}` |
| `orders` | left_outer | many_to_one | `${order_items.order_id} = ${orders.order_id}` |
| `fov_example` | | one_to_one | Bare join (no SQL on) |

# Pre-defined Queries (Quick Starts)

| Query Name | Description | Dimensions | Measures | Filters |
| :--- | :--- | :--- | :--- | :--- |
| `top_products_by_sales` | Top 10 products by revenue this year. | `products.name` | `order_items.total_sale_price` | `order_items.created_date`: "this year" |
| `daily_revenue` | Daily revenue and order count for the last 30 days. | `order_items.created_date` | `order_items.total_sale_price`, `order_items.count` | `order_items.created_date`: "30 days ago for 30 days" |
| `orders_YoY` | Orders count YoY comparison | `orders.created_month`, `orders.order_count_last_year`, `orders.order_count_last_year_difference` | `orders.count` | `orders.created_year`: "2024" |
| `yearly_sales_by_category` | Total sales by product category for the last 3 years. | `products.category` | `order_items.total_sale_price` | `orders.created_year`: "last 3 years" |

# Notes
- `fov_example` is a field-only view joined here to provide custom measures like `avg_orders_per_user`.

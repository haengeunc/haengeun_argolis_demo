---
type: Table
title: Users
description: Effective user data combining base schema and refinements.
tags: [looker, view, users]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: users-base
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/views/users.view.lkml
    title: Users Base View
  - id: users-layer
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/staging_views/users.layer.lkml
    title: Users Layer (Refinement)
---

# Schema

Effective schema for the `users` view, mapping to the underlying BigQuery table `bigquery-public-data.thelook_ecommerce.users`.

| Field Name | Type | Description | Group Label | Source |
| :--- | :--- | :--- | :--- | :--- |
| `id` | number | Primary Key (Modified: Label added) | User Details | Base / Layer |
| `age` | number | | User Details | Base |
| `city` | string | | Location | Base |
| `country` | string | With drill fields `state`, `city` | Location | Base / Layer |
| `created` | time | Timeframes: raw, time, date, week, month, quarter, year | | Base |
| `email` | string | Action: Send email | User Details | Base / Layer |
| `first_name` | string | | User Details | Base |
| `last_name` | string | | User Details | Base |
| `full_name` | string | `CONCAT( ${first_name}, ' ', ${last_name})` | User Details | Layer |
| `gender` | string | | User Details | Base |
| `latitude` | number | | Location | Base |
| `longitude` | number | | Location | Base |
| `postal_code` | string | | Location | Base |
| `state` | string | | Location | Base |
| `street_address` | string | | Location | Base |
| `traffic_source` | string | | User Details | Base |
| `user_geom` | string | | Location | Base |

# Measures

| Measure Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `count` | count | Drill fields: `detail*` | Base |
| `average_age` | average | Average of `age` | Layer |

# Notes
- This view is refined in `users.layer.lkml` to add labels, actions, and derived fields like `full_name`.
- It connects to the public dataset `bigquery-public-data.thelook_ecommerce.users`.

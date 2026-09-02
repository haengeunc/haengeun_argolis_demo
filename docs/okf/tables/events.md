---
type: Table
title: Events
description: Events data from Looker view.
tags: [looker, view, events]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: events-base
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/views/events.view.lkml
    title: Events Base View
  - id: events-layer
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/staging_views/events.layers.lkml
    title: Events Layer (Refinement)
---

# Schema

Schema for the `events` view, mapping to the underlying BigQuery table `bigquery-public-data.thelook_ecommerce.events`.

| Field Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `id` | number | Primary Key | Base |
| `browser` | string | | Base |
| `city` | string | | Base |
| `created` | time | Timeframes: raw, time, date, week, month, quarter, year | Base |
| `event_type` | string | | Base |
| `ip_address` | string | | Base |
| `postal_code` | string | | Base |
| `sequence_number` | number | | Base |
| `session_id` | string | | Base |
| `state` | string | | Base |
| `traffic_source` | string | | Base |
| `uri` | string | | Base |
| `user_id` | number | | Base |

# Measures

| Measure Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `count` | count | Drill fields available | Base |

# Notes
- The refinement layer for this view is currently empty.

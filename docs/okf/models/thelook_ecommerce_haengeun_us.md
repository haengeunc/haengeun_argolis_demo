---
type: Service
title: Haengeun E-commerce Model
description: Main model for Haengeun E-commerce, connecting to BigQuery.
tags: [looker, model, thelook_ecommerce]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: model-file
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/models/thelook_ecommerce_haengeun_us.model.lkml
    title: Model Definition
---

# Definition

This model configures the connection and caching for the Haengeun E-commerce application.

## Connection

- **Connection Name**: `haengeun_bq`

## Datagroups

| Datagroup Name | Trigger | Max Cache Age | Description |
| :--- | :--- | :--- | :--- |
| `thelook_ecommerce_default_datagroup` | | 1 hour | Default cache policy |
| `orders_datagroup` | `SELECT max(id) FROM bigquery-public-data.thelook_ecommerce.orders` | 24 hours | Triggered when new ID is added to ETL log |

## Persistence

- **Persist With**: `thelook_ecommerce_default_datagroup`

# Included Resources

- Includes all files from `/explores/*.lkml`
- Includes all files from `/data_tests/*.lkml`
- Includes all files from `/dashboards/*.dashboard`

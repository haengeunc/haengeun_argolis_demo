---
type: Table
title: Distribution Centers
description: Distribution centers data from Looker view.
tags: [looker, view, distribution_centers]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: distribution-centers-base
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/views/distribution_centers.view.lkml
    title: Distribution Centers Base View
  - id: distribution-centers-layer
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/staging_views/distribution_centers.layer.lkml
    title: Distribution Centers Layer (Refinement)
---

# Schema

Effective schema for the `distribution_centers` view, mapping to the underlying BigQuery table `bigquery-public-data.thelook_ecommerce.distribution_centers`.

| Field Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `id` | number | Primary Key | Base |
| `distribution_center_geom` | string | | Base |
| `latitude` | number | | Base |
| `longitude` | number | | Base |
| `name` | string | | Base |
| `location` | location | Derived location (lat, long) | Layer |

# Measures

| Measure Name | Type | Description | Source |
| :--- | :--- | :--- | :--- |
| `count` | count | Drill fields available | Base |

# Notes
- The layer adds a derived `location` dimension of type `location`.

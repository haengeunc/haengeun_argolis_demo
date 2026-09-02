---
type: Dataset
title: Customers Profile Explore
description: Explore information about customers, rooted in the Users view.
tags: [looker, explore, customers_profile]
status: stable
generated: { by: okf-agent/gemini-2.5-pro, at: 2026-09-02T09:50:00Z }
sources:
  - id: customers-profile-explore
    resource: https://github.com/haengeunc/haengeun_argolis_demo/blob/master/explores/customers_profile.explore.lkml
    title: Customers Profile Explore Definition
---

# Definition

This Explore is rooted in `users` and joins user order facts to provide a profile of customers.

## Joins

| View Name | Join Type | Relationship | SQL On |
| :--- | :--- | :--- | :--- |
| `user_order_facts` | left_outer | many_to_one | `${user_order_facts.user_id} = ${users.id}` |

# Notes
- Provides a customer-centric view, useful for demographic and lifetime value analysis.

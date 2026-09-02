view: user_order_facts {
  view_label: "Users"
  derived_table: {
    sql:
    SELECT
        user_id
        , COUNT(DISTINCT order_id) AS lifetime_orders
        , SUM(sale_price) AS lifetime_revenue
        , CAST(MIN(created_at)  AS TIMESTAMP) AS first_order
        , CAST(MAX(created_at)  AS TIMESTAMP)  AS latest_order
        , COUNT(DISTINCT FORMAT_TIMESTAMP('%Y%m', created_at))  AS number_of_distinct_months_with_orders
      FROM bigquery-public-data.thelook_ecommerce.order_items
      GROUP BY user_id
    ;;
    # persist_for: "4 hours"
      datagroup_trigger: orders_datagroup
    }

    dimension: user_id {
      label: "User ID"
      primary_key: yes
      hidden: yes
      sql: ${TABLE}.user_id ;;
    }


    ##### Time and Cohort Fields ######

    dimension_group: first_order {
      label: "First Order"
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.first_order ;;
    }

    dimension_group: latest_order {
      label: "Latest Orders"
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.latest_order ;;
    }


    dimension: days_as_customer {
      label: "Days As Customer"
      description: "Days between first and latest order"
      group_label: "Lifetime Profile"
      type: number
      sql: TIMESTAMP_DIFF(${TABLE}.latest_order, ${TABLE}.first_order, DAY)+1 ;;
    }

    dimension: days_as_customer_tiered {
      label: "Days as Customer Tiered"
      group_label: "Lifetime Profile"
      type: tier
      tiers: [0, 1, 7, 14, 21, 28, 30, 60, 90, 120]
      sql: ${days_as_customer} ;;
      style: integer
    }

    ##### Lifetime Behavior - Order Counts ######

    dimension: lifetime_orders {
      label: "Lifetime Orders"
      group_label: "Lifetime Profile"
      type: number
      sql: ${TABLE}.lifetime_orders ;;
    }

    dimension: repeat_customer {
      label: "Repeat Customer"
      group_label: "Lifetime Profile"
      description: "Lifetime Count of Orders > 1"
      type: yesno
      sql: ${lifetime_orders} > 1 ;;
    }

    dimension: lifetime_orders_tier {
      label: "Lifetime Orders Tier"
      group_label: "Lifetime Profile"
      type: tier
      tiers: [0, 1, 2, 3, 5, 10]
      sql: ${lifetime_orders} ;;
      style: integer
    }

    measure: average_lifetime_orders {
      label: "Average Lifetime Orders"
      type: average
      value_format_name: decimal_2
      sql: ${lifetime_orders} ;;
    }

    dimension: distinct_months_with_orders {
      label: "Number of Months with Active Orders"
      group_label: "Lifetime Profile"
      type: number
      sql: ${TABLE}.number_of_distinct_months_with_orders ;;
    }

    ##### Lifetime Behavior - Revenue ######

    dimension: lifetime_revenue {
      label: "Lifetime Revenue"
      group_label: "Lifetime Profile"
      type: number
      value_format_name: usd
      sql: ${TABLE}.lifetime_revenue ;;
    }

    dimension: lifetime_revenue_tier {
      label: "Lifetime Reveneue Tier"
      group_label: "Lifetime Profile"
      type: tier
      tiers: [0, 25, 50, 100, 200, 500, 1000]
      sql: ${lifetime_revenue} ;;
      style: integer
    }

    measure: average_lifetime_revenue {
      label: "Average Lifetime Margin"
      type: average
      value_format_name: usd
      sql: ${lifetime_revenue} ;;
    }

    dimension: currently_active_customer {
      group_label: "Lifetime Profile"
      type: yesno
      sql: ${latest_order_date} >= DATE_ADD(CURRENT_DATE, INTERVAL -30 DAY) ;;
    }

    measure: active_user_count {
      type: sum
      filters: [lifetime_orders: "< 2", first_order_date: "before 30 days ago"]
      sql: ${user_id} ;;
    }
  }

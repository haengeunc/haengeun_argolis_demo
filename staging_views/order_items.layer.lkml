include: "/views/order_items.view.lkml"

view: +order_items {

  dimension_group: created {
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      fiscal_year,
      fiscal_quarter
    ]
  }

  dimension: status {
    html: {% if value == 'Shipped' or value == 'Complete' %}
      <p>✅ {{value}}</p>
    {% elsif value == 'Processing' %}
      <p>⏳ {{value}}</p>
    {% else %}
      <p>❌ {{value}}</p>
    {% endif %}
   ;;
  }

  measure: total_items_sold {
    type: count
    label: "Total Items Sold"
    description: "Count of all order items sold"
    drill_fields: [products.name, products.brand, products.category, status, sale_price]
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd_0
  }

  measure: gross_revenue {
    type: sum
    alias: [total_sale_price]
    label: "Gross Revenue (Total)"
    group_label: "Revenue"
    description: "The total gross selling price across order items. Represents total revenue generated before cancellations or returns."
    sql: ${sale_price} ;;
    value_format_name: usd_0
    drill_fields: [products.name, products.brand, products.category, gross_revenue]
    synonyms: ["revenue", "total value", "unit price", "line item value", "total sale price"]
  }

  measure: net_revenue {
    type: sum
    label: "Net Revenue (Recognized)"
    group_label: "Revenue"
    description: "Total revenue excluding cancelled and returned items"
    sql: CASE WHEN ${TABLE}.status NOT IN ('Cancelled', 'Returned') THEN ${sale_price} ELSE 0 END ;;
    value_format_name: usd_0
    drill_fields: [products.name, products.brand, products.category, net_revenue]
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
    hidden: yes
  }

  measure: average_order_value {
    type: number
    label: "Average Order Value"
    description: "Average gross revenue generated per order (Gross Revenue / Distinct Orders)"
    sql: 1.0 * ${gross_revenue} / NULLIF(${order_count}, 0) ;;
    value_format_name: usd
  }

  # ----------------------------------------------------------------------
  # Persona-Driven Dynamic Metrics (User Attributes: Sales vs Finance)
  # ----------------------------------------------------------------------

  measure: dynamic_revenue {
    type: sum
    label: "{% if _user_attributes['department'] == 'sales' %}Total Bookings (Sales){% else %}Recognised Net Revenue (Finance){% endif %}"
    description: "{% if _user_attributes['department'] == 'sales' %}Gross booking value across all orders, regardless of return/cancellation status{% else %}Recognised revenue excluding cancelled and returned items{% endif %}"
    sql:
      {% if _user_attributes['department'] == 'sales' %}
        ${sale_price}
      {% elsif _user_attributes['department'] == 'finance' %}
        CASE
          WHEN ${TABLE}.status NOT IN ('Cancelled', 'Returned') THEN
          ${sale_price}
          ELSE 0
        END
      {% else %}
        ${sale_price}
      {% endif %} ;;

    value_format_name: usd_0

    drill_fields: [products.name, products.brand, dynamic_revenue]
  }

  measure: returned_or_cancelled_revenue {
    type: sum
    label: "Returned/Cancelled Revenue"
    group_label: "Revenue"
    description: "Lost revenue due to cancellations and returns."
    sql: CASE WHEN ${status} IN ('Cancelled', 'Returned') THEN ${sale_price} ELSE 0 END ;;
    value_format_name: usd_0
  }


  measure: return_cancellation_rate {
    type: number
    label: "Return & Cancellation Rate"
    description: "Percentage of revenue lost to returns and cancellations"
    sql: 1.0 * ${returned_or_cancelled_revenue} / NULLIF(${gross_revenue}, 0) ;;
    value_format_name: percent_1
  }

  measure: first_order {
    type: date
    sql: MIN(${created_date}) ;;
  }

  measure: latest_order {
    type: date
    sql: MAX(${created_date}) ;;
  }

  ###### --- Period over period --- ####

  measure: sales_previous_month {
    type: period_over_period
    description: "Total sales revenue from the previous month"
    based_on: order_items.gross_revenue
    based_on_time: order_items.created_date
    period: month
    kind: previous
    group_label: "Period-over-period"
  }

  measure: sales_month_over_month_change {
    type: period_over_period
    description: "Sales revenue % change month-over-month"
    based_on: order_items.gross_revenue
    based_on_time: order_items.created_date
    period: month
    kind: relative_change
    group_label: "Period-over-period"
    value_format_name: percent_0
  }

  # ----------------------------------------------------------------------
  # 1. Fulfillment Durations (Dimensions)
  # ----------------------------------------------------------------------

  dimension: days_to_process {
    type: number
    label: "Days to Process"
    description: "Number of fractional days from order creation to shipment"
    sql: DATE_DIFF(DATE(${shipped_raw}), DATE(${created_raw}), DAY) ;;
    # For sub-day fractional precision, use:
    # sql: TIMESTAMP_DIFF(${shipped_raw}, ${created_raw}, SECOND) / 86400.0 ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Timelines"
  }

  dimension: days_to_deliver {
    type: number
    label: "Days to Deliver"
    description: "Number of fractional days from shipment to delivery to customer"
    sql: DATE_DIFF(DATE(${delivered_raw}), DATE(${shipped_raw}), DAY) ;;
    # For sub-day fractional precision, use:
    # sql: TIMESTAMP_DIFF(${delivered_raw}, ${shipped_raw}, SECOND) / 86400.0 ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Timelines"
  }

  dimension: days_order_to_delivery {
    type: number
    label: "Total Days to Deliver (End-to-End)"
    description: "Total days from order creation to customer receipt"
    sql: DATE_DIFF(DATE(${delivered_raw}), DATE(${created_raw}), DAY) ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Timelines"
  }

  # ----------------------------------------------------------------------
  # 2. Tiers / Buckets (Useful for bar charts, filters, and histograms)
  # ----------------------------------------------------------------------

  dimension: days_to_deliver_tier {
    type: tier
    tiers: [0, 2, 4, 7, 10, 14]
    style: integer
    sql: ${days_to_deliver} ;;
    group_label: "Fulfillment Timelines"
    label: "Days to Deliver Tier"
  }

  # ----------------------------------------------------------------------
  # 3. Measures (Averages, Medians, and Metrics)
  # ----------------------------------------------------------------------

  measure: average_days_to_process {
    type: average
    label: "Average Days to Process"
    description: "Average duration between order creation and shipment"
    sql: ${days_to_process} ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Metrics"
  }

  measure: average_days_to_deliver {
    type: average
    label: "Average Days to Deliver"
    description: "Average duration between shipment and delivery"
    sql: ${days_to_deliver} ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Metrics"
  }

  measure: average_total_delivery_time {
    type: average
    label: "Average Total Delivery Time"
    description: "Average end-to-end days from order to delivery"
    sql: ${days_order_to_delivery} ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Metrics"
  }

}

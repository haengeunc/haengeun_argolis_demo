include: "/views/order_items.view.lkml"

view: +order_items {

  dimension_group: created {
    timeframes: [raw, time, date, week, month, month_name, quarter, year]
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

  measure: total_sale_price {
    description: "The final selling price of a single item in an order. Represents the revenue generated per item. Can also be referred to as 'Unit Price', 'Revenue', or 'Line Item Value'."
    type: sum
    sql: ${sale_price} ;;
    value_format:"[>=1000]$#,##0,\"K\";[<1000]$#,##0"
    drill_fields: [products.name, products.brand,total_sale_price]
    synonyms: ["revenue", "total value", "unit price", "line item value"]
    html: Total {{ rendered_value }} | Avg {{average_sale_price._rendered_value }};;
  }


  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd_0
  }

  measure: first_order {
    type: date
    sql: MIN(${created_date}) ;;
  }

  measure: latest_order {
    type: date
    sql: MAX(${created_date}) ;;
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

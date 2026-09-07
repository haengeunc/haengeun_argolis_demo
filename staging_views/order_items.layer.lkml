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
    description: "Current lifecycle status of the order item: Complete, Shipped, Processing, Cancelled, or Returned."
    synonyms: ["order status", "delivery status", "order state", "item status"]
    html: {% if value == 'Shipped' or value == 'Complete' %}
      <p>✅ {{value}}</p>
    {% elsif value == 'Processing' %}
      <p>⏳ {{value}}</p>
    {% else %}
      <p>❌ {{value}}</p>
    {% endif %}
   ;;
  }

  dimension: sale_price {
    label: "Sale Price"
    description: "Individual selling price of the order item in USD. Point of sale price."
    synonyms: ["item price", "unit price", "price", "retail price"]
    value_format_name: usd
  }

  measure: count {
    hidden: yes
  }

  measure: total_items_sold {
    type: count
    label: "Total Items Sold"
    description: "Total quantity of individual items sold across orders. Formula: COUNT(order_items.id)."
    drill_fields: [products.name, products.brand, products.category, status, sale_price]
    synonyms: ["units sold", "item volume", "quantity sold", "number of items", "product count", "total units"]
  }

  measure: average_sale_price {
    type: average
    label: "Average Sale Price"
    description: "Average price per individual unit/item sold. Formula: AVG(sale_price)."
    sql: ${sale_price} ;;
    value_format_name: usd
    synonyms: ["asp", "average item price", "average unit price", "mean unit price"]
  }

  measure: gross_revenue {
    type: sum
    alias: [total_sale_price]
    label: "Gross Revenue (Total)"
    group_label: "Revenue"
    description: "Total gross selling price across all order items before cancellations or returns. Formula: SUM(sale_price)."
    sql: ${sale_price} ;;
    value_format_name: usd_0
    drill_fields: [products.name, products.brand, products.category, gross_revenue]
    synonyms: ["gross sales", "total revenue", "gmv", "gross merchandise value", "total bookings", "turnover", "total sales", "topline revenue", "sales"]
  }

  measure: net_revenue {
    type: sum
    label: "Net Revenue (Recognized)"
    group_label: "Revenue"
    description: "Total recognized revenue excluding cancelled and returned items. Formula: SUM(sale_price WHERE status NOT IN ('Cancelled', 'Returned'))."
    sql: CASE WHEN ${TABLE}.status NOT IN ('Cancelled', 'Returned') THEN ${sale_price} ELSE 0 END ;;
    value_format_name: usd_0
    drill_fields: [products.name, products.brand, products.category, net_revenue]
    synonyms: ["net sales", "retained revenue", "actual revenue", "realized revenue", "recognized revenue", "bottom line revenue"]
  }

  measure: returned_or_cancelled_revenue {
    type: sum
    label: "Returned & Cancelled Revenue"
    group_label: "Revenue"
    description: "Total revenue lost to cancellations and returns. Formula: SUM(sale_price WHERE status IN ('Cancelled', 'Returned'))."
    sql: CASE WHEN ${status} IN ('Cancelled', 'Returned') THEN ${sale_price} ELSE 0 END ;;
    value_format_name: usd_0
    synonyms: ["lost revenue", "refunds", "returns", "cancellations", "refunded revenue", "returned amount"]
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
    hidden: yes
  }

  measure: average_order_value {
    type: number
    label: "Average Order Value (Gross)"
    group_label: "Order Value"
    description: "Average gross revenue generated per placed order at checkout, before cancellations or returns. Formula: Gross Revenue / Total Orders Placed."
    sql: 1.0 * ${gross_revenue} / NULLIF(${order_count}, 0) ;;
    value_format_name: usd
    synonyms: ["aov", "gross aov", "average order value", "average basket size", "order size", "cart size", "ticket size", "mean order value", "average checkout"]
  }

  measure: net_order_count {
    type: count_distinct
    sql: CASE WHEN ${TABLE}.status NOT IN ('Cancelled', 'Returned') THEN ${order_id} ELSE NULL END ;;
    hidden: yes
  }

  measure: net_average_order_value {
    type: number
    label: "Net Average Order Value"
    group_label: "Order Value"
    description: "Average realized revenue per fulfilled/retained order, excluding cancelled and returned orders. Formula: Net Revenue / Net Kept Orders."
    sql: 1.0 * ${net_revenue} / NULLIF(${net_order_count}, 0) ;;
    value_format_name: usd
    synonyms: ["net aov", "retained aov", "realized order value", "retained basket size", "net basket size", "net ticket size", "fulfilled aov"]
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
    synonyms: ["department revenue", "role based revenue", "persona revenue"]
  }

  measure: return_cancellation_rate {
    type: number
    label: "Return & Cancellation Rate"
    description: "Percentage of gross revenue lost to returns and cancellations. Formula: Returned/Cancelled Revenue / Gross Revenue."
    sql: 1.0 * ${returned_or_cancelled_revenue} / NULLIF(${gross_revenue}, 0) ;;
    value_format_name: percent_1
    synonyms: ["return rate", "cancellation rate", "refund rate", "churn rate", "return percentage"]
  }

  measure: first_order {
    type: date
    label: "First Order Date"
    description: "Date of the earliest customer order."
    sql: MIN(${created_date}) ;;
    synonyms: ["earliest order", "first purchase date", "start date"]
  }

  measure: latest_order {
    type: date
    label: "Latest Order Date"
    description: "Date of the most recent customer order."
    sql: MAX(${created_date}) ;;
    synonyms: ["most recent order", "last order date", "end date"]
  }

  ###### --- Period over period --- ####

  measure: sales_previous_month {
    type: period_over_period
    label: "Sales Previous Month"
    description: "Total gross sales revenue from the previous calendar month."
    based_on: order_items.gross_revenue
    based_on_time: order_items.created_date
    period: month
    kind: previous
    group_label: "Period-over-period"
    synonyms: ["prior month sales", "last month revenue", "previous month revenue"]
  }

  measure: sales_month_over_month_change {
    type: period_over_period
    label: "Sales MoM % Change"
    description: "Month-over-month percentage change in gross revenue."
    based_on: order_items.gross_revenue
    based_on_time: order_items.created_date
    period: month
    kind: relative_change
    group_label: "Period-over-period"
    value_format_name: percent_0
    synonyms: ["mom growth", "month over month growth", "monthly change"]
  }

  # ----------------------------------------------------------------------
  # 1. Fulfillment Durations (Dimensions)
  # ----------------------------------------------------------------------

  dimension: days_to_process {
    type: number
    label: "Days to Process"
    description: "Number of days from order creation to warehouse shipment."
    sql: DATE_DIFF(DATE(${shipped_raw}), DATE(${created_raw}), DAY) ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Timelines"
    synonyms: ["processing days", "warehouse handling time", "fulfillment lead time"]
  }

  dimension: days_to_deliver {
    type: number
    label: "Days to Deliver"
    description: "Number of days in transit from warehouse shipment to customer delivery."
    sql: DATE_DIFF(DATE(${delivered_raw}), DATE(${shipped_raw}), DAY) ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Timelines"
    synonyms: ["transit days", "shipping days", "delivery time"]
  }

  dimension: days_order_to_delivery {
    type: number
    label: "Total Days to Deliver (End-to-End)"
    description: "Total days elapsed from customer order placement to doorstep delivery."
    sql: DATE_DIFF(DATE(${delivered_raw}), DATE(${created_raw}), DAY) ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Timelines"
    synonyms: ["order to delivery days", "total delivery lead time", "end to end transit"]
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
    description: "Average days between order creation and warehouse shipment."
    sql: ${days_to_process} ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Metrics"
    synonyms: ["average processing time", "mean processing days", "mean handling time"]
  }

  measure: average_days_to_deliver {
    type: average
    label: "Average Days to Deliver"
    description: "Average days in transit between shipment and customer delivery."
    sql: ${days_to_deliver} ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Metrics"
    synonyms: ["average delivery time", "mean shipping duration", "mean transit days"]
  }

  measure: average_total_delivery_time {
    type: average
    label: "Average Total Delivery Time"
    description: "Average end-to-end days from order placement to customer delivery."
    sql: ${days_order_to_delivery} ;;
    value_format_name: decimal_1
    group_label: "Fulfillment Metrics"
    synonyms: ["average fulfillment time", "mean order to delivery", "average click to ship to deliver"]
  }

}

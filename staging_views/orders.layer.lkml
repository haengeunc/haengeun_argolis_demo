include: "/views/orders.view.lkml"

view: +orders {

  measure: first_order {
    type: date
    sql: MIN(${created_date}) ;;
  }

  measure: latest_order {
    type: date
    sql: MAX(${created_date}) ;;
  }

  dimension: user_id {
    hidden: yes
  }

  dimension_group: created {
    description: "When the line item order was created"
  }

  dimension_group: delivered {
    description: "When the line item was delivered to the user"
  }


  ###### --- Period over period --- ####

  measure: order_count_last_month {
    type: period_over_period
    description: "Order count from the previous month"
    based_on: orders.count
    based_on_time: orders.created_date
    period: month
    kind: previous
    group_label: "Period-over-period"
  }

  measure: order_count_last_year {
    type: period_over_period
    description: "Order count from the previous year"
    based_on: orders.count
    based_on_time: orders.created_month
    period: year
    kind: previous
    group_label: "Period-over-period"
  }

  measure: order_count_last_year_difference {
    type: period_over_period
    description: "Order count change from the previous year"
    based_on: orders.count
    based_on_time: orders.created_month
    period: year
    kind: difference
    group_label: "Period-over-period"
  }

  measure: order_count_last_year_percent_change {
    type: period_over_period
    description: "Order count % change from the previous year"
    based_on: orders.count
    based_on_time: orders.created_month
    period: year
    kind: relative_change
    group_label: "Period-over-period"
    value_format_name: "percent_0"
  }

}

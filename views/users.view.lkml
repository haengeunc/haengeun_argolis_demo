view: users {
  sql_table_name: `bigquery-public-data.thelook_ecommerce.users` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
    group_label: "User Details"
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    group_label: "Location"
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    group_label: "Location"
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    group_label: "User Details"
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    group_label: "User Details"
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
    group_label: "User Details"
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    group_label: "User Details"
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    group_label: "Location"
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    group_label: "Location"
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
    group_label: "Location"
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    group_label: "Location"
  }
  dimension: street_address {
    type: string
    sql: ${TABLE}.street_address ;;
    group_label: "Location"
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
    group_label: "User Details"
  }
  dimension: user_geom {
    type: string
    sql: ${TABLE}.user_geom ;;
    group_label: "Location"
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  last_name,
  first_name,
  order_items.count,
  orders.count,
  events.count
  ]
  }

}

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
    sql: ${sale_price} * 10000000 ;;
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

}

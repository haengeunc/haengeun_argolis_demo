include: "/views/inventory_items.view.lkml"

view: +inventory_items {


  dimension: inventory_status {
    type: string
    sql: CASE WHEN ${sold_raw} IS NULL THEN 'In Stock' ELSE 'Sold' END ;;
    label: "Inventory Status"
  }

  dimension: cost_tier {
    type: string
    case: {
      when: {
        sql: ${cost} < 20 ;;
        label: "Low Cost"
      }
      when: {
        sql: ${cost} >= 20 AND ${cost} < 100 ;;
        label: "Medium Cost"
      }
      else: "High Cost"
    }
    label: "Cost Tier"
  }


  ####--------


  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
    label: "Total Inventory Cost"
  }

  measure: average_cost {
    type: average
    sql: ${cost} ;;
    value_format_name: usd
    label: "Average Item Cost"
  }

  measure: total_retail_price {
    type: sum
    sql: ${product_retail_price} ;;
    value_format_name: usd
    label: "Total Potential Retail Price"
  }

  measure: average_retail_price {
    type: average
    sql: ${product_retail_price} ;;
    value_format_name: usd
    label: "Average Item Retail Price"
  }

  measure: inventory_profit_margin {
    type: sum
    sql: ${product_retail_price} - ${cost} ;;
    value_format_name: usd
    label: "Inventory Profit Margin"
  }

  measure: in_stock_count {
    type: sum
    sql: CASE WHEN ${sold_raw} IS NULL THEN 1 ELSE 0 END ;;
    label: "Items In Stock"
  }

  measure: sold_items_count {
    type: sum
    sql: CASE WHEN ${sold_raw} IS NOT NULL THEN 1 ELSE 0 END ;;
    label: "Items Sold"
  }

  measure: distinct_products_in_inventory {
    type: count_distinct
    sql: ${product_id} ;;
    label: "Distinct Products in Inventory"
  }


  measure: percentage_sold {
    type: number
    sql: 100.0 * ${sold_items_count} / ${count} ;;
    value_format: "0.00\"%\""
    label: "Percentage of Items Sold"
  }



}

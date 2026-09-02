#Ensuring that a primary key is unique

test: order_id_is_unique {
  explore_source: customer_orders {
    column: order_id { field: orders.order_id }
    column: count { field: orders.count }
    # Sort and limit to quickly find potential duplicates
    # If the count is > 1 for any ID, the test will fail
    sorts: [orders.count: desc]
    limit: 1
  }
  assert: order_id_is_unique {
    expression: ${orders.count} = 1 ;;
  }
}

# test: order_items_count_matches_historic_2024 {
#   explore_source: customer_orders {
#     column: count { field: order_items.count }
#     filters: {
#       field: order_items.created_year
#       value: "2024"
#     }
#   }
#   assert: matches_historic_value {
#       expression: ${order_items.count} = 51049    ;;
#   }
# }

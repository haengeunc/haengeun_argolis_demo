# Ensuring data integrity for financial measures and user derived facts

test: sale_price_is_positive {
  explore_source: customer_orders {
    column: total_sale_price {
      field: order_items.total_sale_price
    }
  }
  assert: total_sale_price_is_positive {
    expression: ${order_items.total_sale_price} >= 0 ;;
  }
}

test: user_order_facts_is_unique {
  explore_source: customer_orders {
    column: user_id {
      field: user_order_facts.user_id
    }
    column: count {
      field: user_order_facts.count
    }
    sorts: [user_order_facts.count: desc]
    limit: 1
  }
  assert: user_id_in_facts_is_unique {
    expression: ${user_order_facts.count} <= 1 ;;
  }
}

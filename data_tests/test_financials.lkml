# Ensuring data integrity for financial measures and user derived facts

test: gross_revenue_is_positive {
  explore_source: customer_orders {
    column: gross_revenue {
      field: order_items.gross_revenue
    }
  }
  assert: gross_revenue_is_positive {
    expression: ${order_items.gross_revenue} >= 0 ;;
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

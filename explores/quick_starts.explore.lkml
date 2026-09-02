include: "/explores/customer_orders.explore.lkml"

# Queries for quick start analysis

explore: +customer_orders {
  query: top_products_by_sales {
    description: "Top 10 products by revenue this year."
    dimensions: [products.name]
    measures: [order_items.total_sale_price]
    filters: [order_items.created_date: "this year"]
    sorts: [order_items.total_sale_price: desc]
    limit: 10
  }
}

explore: +customer_orders {
  query: daily_revenue {
    description: "Daily revenue and order count for the last 30 days."
    dimensions: [order_items.created_date]
    measures: [order_items.total_sale_price, order_items.count]
    filters: [order_items.created_date: "30 days ago for 30 days"]

  }
}

explore: +customer_orders {
  query: orders_YoY {
    description: "Orders count YoY comparison"
    dimensions: [orders.created_month, orders.order_count_last_year, orders.order_count_last_year_difference]
    measures: [orders.count]
    filters: {
      field: orders.created_year
      value: "2024"
    }
    sorts: [orders.created_month: asc]
  }
}


explore: +customer_orders {
  query: yearly_sales_by_category {
    description: "Total sales by product category for the last 3 years."
    dimensions: [products.category]
    measures: [order_items.total_sale_price]
    pivots: [orders.created_year]
    limit: 10
    filters: {
      field: orders.created_year
      value: "last 3 years"
    }
  }
}

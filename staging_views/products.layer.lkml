include: "/views/products.view.lkml"

view: +products {

  dimension: brand {
    description: "The brand name of the product. Examples include 'Calvin Klein', 'Nike', 'Adidas'."
    link: {
      label: "Google"
      url: "https://www.google.com/search?q={{ value }}"
      icon_url: "https://google.com/favicon.ico"
    }

    # suggestions: ["Nike", "Speedo", "PUMA", "adidas", "Lee", "error"]
    suggest_explore: fulfillment
    suggest_dimension: inventory_items.product_brand

  }

  measure: total_cost {
    description: "The total cost of an item"
    type: sum
    sql: ${cost} ;;
    value_format:"[>=1000]$#,##0,\"K\";[<1000]$#,##0"
  }

}

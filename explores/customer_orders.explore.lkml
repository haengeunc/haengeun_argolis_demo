include: "/staging_views/users.layer.lkml"
include: "/staging_views/order_items.layer.lkml"
include: "/staging_views/products.layer.lkml"
include: "/staging_views/orders.layer.lkml"
include: "/views_derived/user_order_facts.view.lkml"



explore: customer_orders {
  label: "Customers & Orders"
  description: "Explore information about orders placed by customers"
  # access_filter: {
  #   field: users.country
  #   user_attribute: country
  # }

  # sql_always_where:
  #       {% assign country_array = _user_attributes['country'] | split: "," %}
  #       ${users.country} IN (
  #       {% for country in country_array %}
  #       '{{ country | strip }}'
  #       {% unless forloop.last %}, {% endunless %}
  #       {% endfor %}
  #       ) ;;

  view_name: order_items

  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: user_order_facts {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${user_order_facts.user_id} = ${order_items.user_id} ;;
  }

  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }


  join: fov_example {
    relationship: one_to_one
    sql: ;; # leave blank for bare joins
  }
}

#-----------------------------------------------------

view: fov_example {
  #field-only view i.e. no sql_table_name argument
  view_label: "Orders"

  measure: avg_orders_per_user{
    sql: ${orders.count} / ${users.count} ;;
    type: number
    value_format_name: decimal_2
  }
}

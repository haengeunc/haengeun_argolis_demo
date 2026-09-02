include: "/staging_views/users.layer.lkml"
include: "/views_derived/user_order_facts.view.lkml"



explore: customers_profile {
  label: "Customers"
  description: "Explore information about customers"

  view_name: users

  join: user_order_facts {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${user_order_facts.user_id} = ${users.id} ;;
  }
}

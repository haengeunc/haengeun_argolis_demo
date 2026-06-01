include: "/staging_views/products.layer.lkml"
include: "/staging_views/inventory_items.layer.lkml"
include: "/staging_views/distribution_centers.layer.lkml"


explore: fulfillment {

  view_name: inventory_items

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}


# Define the database connection to be used for this model.
connection: "haengeun_bq"

# include all the views
include: "/explores/*.lkml"
include: "/data_tests/*.lkml"
include: "/dashboards/*.dashboard"


label: "Haengeun E-commerce"

datagroup: thelook_ecommerce_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: orders_datagroup {
  sql_trigger: SELECT max(id) FROM `bigquery-public-data.thelook_ecommerce.orders` ;;
  max_cache_age: "24 hours"
  label: "ETL ID added"
  description: "Triggered when new ID is added to ETL log"
}



persist_with: thelook_ecommerce_default_datagroup

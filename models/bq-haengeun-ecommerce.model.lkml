connection: "bq-haengeun-ecommerce-eu"

# # include: "/explores/*.lkml"
# include: "/dashboards/*.dashboard"

# # label: "Haengeun E-commerce EU connection"

# # datagroup: thelook_ecommerce_default_datagroup {
# #   # sql_trigger: SELECT MAX(id) FROM etl_log;;
# #   max_cache_age: "4 hour"
# # }

# # datagroup: orders_datagroup {
# #   sql_trigger: SELECT max(id) FROM `bigquery-public-data.thelook_ecommerce.orders` ;;
# #   max_cache_age: "24 hours"
# #   label: "ETL ID added"
# #   description: "Triggered when new ID is added to ETL log"
# # }



# # persist_with: thelook_ecommerce_default_datagroup

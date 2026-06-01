---
- dashboard: fulfillment_operations_dashboard
  title: "📦 Fulfillment Operations Dashboard"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Complete fulfillment and inventory analytics - Monitor inventory health, distribution center performance, and product fulfillment metrics across all channels."
  
  elements:
  
  # ===== KPI SECTION =====
  - title: Total Inventory Items
    name: Total Inventory Items
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: single_value
    fields: [inventory_items.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 3
    
  - title: Total Inventory Cost
    name: Total Inventory Cost
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: single_value
    fields: [inventory_items.cost]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    value_format: "$#,##0.00"
    row: 0
    col: 6
    width: 6
    height: 3
    
  - title: Average Item Cost
    name: Average Item Cost
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: single_value
    fields: [inventory_items.cost]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    value_format: "$#,##0.00"
    row: 0
    col: 12
    width: 6
    height: 3
    
  - title: Active Distribution Centers
    name: Active Distribution Centers
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: single_value
    fields: [distribution_centers.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 3
    
  # ===== INVENTORY BY CATEGORY =====
  - title: Inventory Distribution by Product Category
    name: Inventory Distribution by Category
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: looker_column
    fields: [inventory_items.product_category, inventory_items.count]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      inventory_items.count: "#4285F4"
    defaults_version: 1
    listen: {}
    row: 3
    col: 0
    width: 12
    height: 7
    
  # ===== INVENTORY BY DEPARTMENT =====
  - title: Inventory Count by Department
    name: Inventory Count by Department
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: looker_pie
    fields: [inventory_items.product_department, inventory_items.count]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    series_colors:
      Activewear: "#EA4335"
      Apparel: "#4285F4"
      Footwear: "#34A853"
      Outerwear: "#FBBC04"
      Swim: "#EA7B46"
      Underwear: "#AB47BC"
    defaults_version: 1
    listen: {}
    row: 3
    col: 12
    width: 12
    height: 7
    
  # ===== FULFILLMENT STATUS OVER TIME =====
  - title: Inventory Created vs Sold Timeline
    name: Fulfillment Timeline
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: looker_line
    fields: [inventory_items.created_date, inventory_items.sold_date, inventory_items.count]
    fill_fields: [inventory_items.created_date, inventory_items.sold_date]
    sorts: [inventory_items.created_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      inventory_items.count: "#1F2937"
    series_labels:
      inventory_items.count: Items
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen: {}
    row: 10
    col: 0
    width: 12
    height: 7
    
  # ===== INVENTORY BY DISTRIBUTION CENTER =====
  - title: "🏭 Inventory by Distribution Center"
    name: Inventory by Distribution Center
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: looker_bar
    fields: [distribution_centers.name, inventory_items.count]
    sorts: [inventory_items.count desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      inventory_items.count: "#9C27B0"
    defaults_version: 1
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 7
    
  # ===== TOP BRANDS =====
  - title: Top 15 Product Brands by Inventory
    name: Top Product Brands
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: looker_column
    fields: [inventory_items.product_brand, inventory_items.count]
    sorts: [inventory_items.count desc]
    limit: 15
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      inventory_items.count: "#E67E22"
    defaults_version: 1
    listen: {}
    row: 17
    col: 0
    width: 12
    height: 7
    
  # ===== PRICE ANALYSIS =====
  - title: "💰 Average Retail Price by Category"
    name: Average Retail Price by Category
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: looker_bar
    fields: [inventory_items.product_category, inventory_items.product_retail_price]
    sorts: [inventory_items.product_retail_price desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      inventory_items.product_retail_price: "#16A34A"
    value_format: "$#,##0.00"
    defaults_version: 1
    listen: {}
    row: 17
    col: 12
    width: 12
    height: 7
    
  # ===== DETAILED INVENTORY GRID =====
  - title: "📋 Detailed Inventory Items"
    name: Detailed Inventory
    model: bq-haengeun-ecommerce
    explore: fulfillment
    type: looker_grid
    fields: [inventory_items.id, inventory_items.product_name, inventory_items.product_brand, inventory_items.product_category, inventory_items.product_department, inventory_items.cost, inventory_items.product_retail_price, inventory_items.created_date, inventory_items.sold_date, distribution_centers.name]
    sorts: [inventory_items.created_date desc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    listen: {}
    row: 24
    col: 0
    width: 24
    height: 12

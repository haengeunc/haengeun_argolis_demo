---
- dashboard: haengeun_ecommerce_overviews_demo
  title: "Haengeun e-commerce overviews demo @{city_name}"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: gwaH85w2mPXQKdQkEcKGo3
  elements:
  - title: Customers Age Profile
    name: Customers Age Profile
    model: "@{model_name}"
    explore: customer_orders
    type: looker_grid
    fields: [users.country, users.average_age]
    sorts: [users.country]
    limit: 500
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
    hidden_pivots: {}
    truncate_column_names: false
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 14
    height: 7
  - title: Total Orders
    name: Total Orders
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [orders.count]
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
    listen:
      Country: users.country
    row: 0
    col: 0
    width: 7
    height: 2
  - title: Count of customers
    name: Count of customers
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_column
    fields: [users.country, users.count]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Country: users.country
    row: 0
    col: 14
    width: 10
    height: 9
  - title: Total Customers
    name: Total Customers
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [orders.count, users.count]
    limit: 500
    column_limit: 50
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
    listen:
      Country: users.country
    row: 0
    col: 7
    width: 7
    height: 2
  - title: Order Count Year-on-Year in 2024
    name: Order Count Year-on-Year in 2024
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_line
    fields: [orders.order_count_last_year, orders.count, orders.created_month, orders.order_count_last_year_difference]
    fill_fields: [orders.created_month]
    filters:
      orders.created_year: '2024'
    sorts: [orders.created_month]
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
    y_axes: [{label: Total Order Count, orientation: left, series: [{axisId: orders.order_count_last_year,
            id: orders.order_count_last_year, name: Last Year}, {axisId: orders.count,
            id: orders.count, name: This Year}, {axisId: orders.order_count_last_year_difference,
            id: orders.order_count_last_year_difference, name: Difference}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: orders.order_count_last_year_percet_change, id: orders.order_count_last_year_percet_change,
            name: Order Count Last Year Percet Change}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: '"$"0.0,"K"'
    series_types:
      orders.count: column
      orders.order_count_last_year: column
    series_colors:
      orders.order_count_last_year: "#12B5CB"
      orders.count: "#1A73E8"
      orders.order_count_last_year_difference: "#E8710A"
    series_labels:
      orders.order_count_last_year: Last Year
      orders.count: This Year
      orders.order_count_last_year_difference: Variance
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 9
    col: 0
    width: 24
    height: 8
  filters:
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    listens_to_filters: []
    field: users.country

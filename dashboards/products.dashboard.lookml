---
- dashboard: ecommerce_products_dashboard
  title: E-commerce Products Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: Xo1VkRWrPm0YvcBzw080ED
  elements:
  - title: Monthly Total Sale Revenue (YoY)
    name: Monthly Total Sale Revenue (YoY)
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_line
    fields: [order_items.created_month_name, order_items.total_sale_price, order_items.created_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_month_name]
    filters:
      order_items.created_date: before 0 months ago
      order_items.created_year: 4 years
    sorts: [order_items.created_year desc 0, order_items.created_month_name]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: '2018', name: '2018', axisId: order_items.total_sale_price},
          {id: '2017', name: '2017', axisId: order_items.total_sale_price}, {id: '2016',
            name: '2016', axisId: order_items.total_sale_price}, {id: '2015', name: '2015',
            axisId: order_items.total_sale_price}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear, valueFormat: "$0,\\\
          K\\"}]
    y_axis_value_format: "$#,##0"
    x_axis_label: Month of Year
    x_axis_zoom: true
    y_axis_zoom: true
    colors: ["#635189", "#B1A8C4", "#1EA8DF", "#8ED3EF"]
    label_value_format: $#,##0,"K"
    series_colors: {}
    swap_axes: false
    discontinuous_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [calculation_1]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      Category: products.category
      Brand: products.brand
      Country: users.country
    row: 17
    col: 0
    width: 24
    height: 8
  - title: Total Revenue
    name: Total Revenue
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [order_items.total_sale_price, order_items.created_year]
    fill_fields: [order_items.created_year]
    sorts: [order_items.created_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: vs last year
      value_format:
      value_format_name: percent_0
      calculation_type: percent_difference_from_previous
      table_calculation: vs_last_year
      args:
      - order_items.total_sale_price
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: $#,##0,"K"
    defaults_version: 1
    listen:
      Category: products.category
      Brand: products.brand
      Country: users.country
      Created Month Name: order_items.created_month_name
    row: 0
    col: 12
    width: 6
    height: 3
  - title: Total Orders
    name: Total Orders
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [order_items.created_year, orders.count]
    fill_fields: [order_items.created_year]
    sorts: [order_items.created_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: vs last year
      value_format:
      value_format_name: percent_0
      calculation_type: percent_difference_from_previous
      table_calculation: vs_last_year
      args:
      - orders.count
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Category: products.category
      Brand: products.brand
      Country: users.country
      Created Month Name: order_items.created_month_name
    row: 0
    col: 6
    width: 6
    height: 3
  - title: Total Users
    name: Total Users
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [order_items.created_year, users.count]
    fill_fields: [order_items.created_year]
    sorts: [order_items.created_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: vs last year
      value_format:
      value_format_name: percent_0
      calculation_type: percent_difference_from_previous
      table_calculation: vs_last_year
      args:
      - users.count
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    conditional_formatting: [{type: less than, value: 1000000, background_color: "#FFA500",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 1000000, background_color: "#ADD8E6", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Category: products.category
      Brand: products.brand
      Country: users.country
      Created Month Name: order_items.created_month_name
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Top 10 Brands
    name: Top 10 Brands
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_column
    fields: [products.brand, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
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
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, valueFormat: '$#,##0,"K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $#,##0,"K"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}, {reference_type: line, line_value: mean, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#000000"}, {reference_type: line, line_value: mean,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#000000"}]
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Total Sale Price',
          formatters: [{
            select: 'value >= mean',
            style: {
              color: 'blue'
            }
          }]
        }]
      }
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Created Month Name: order_items.created_month_name
    row: 3
    col: 12
    width: 12
    height: 7
  - type: button
    name: button_178
    rich_content_json: '{"text":"Guide","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://cloud.google.com/looker/docs/best-practices/considerations-when-building-performant-dashboards"}'
    row: 0
    col: 18
    width: 3
    height: 1
  - name: ''
    type: text
    title_text: ''
    body_text: <img src="https://upload.wikimedia.org/wikipedia/commons/4/4c/Looker.svg">
    row: 0
    col: 21
    width: 3
    height: 2
  - title: Top 10 Categories
    name: Top 10 Categories
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_column
    fields: [order_items.total_sale_price, products.category]
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
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
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, valueFormat: '$#,##0,"K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $#,##0,"K"
    series_colors:
      order_items.total_sale_price: "#7CB342"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}, {reference_type: line, line_value: mean, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#000000"}, {reference_type: line, line_value: mean,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#000000"}]
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Total Sale Price',
          formatters: [{
            select: 'value >= mean',
            style: {
              color: 'green'
            }
          }]
        }]
      }
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Created Month Name: order_items.created_month_name
    row: 10
    col: 0
    width: 12
    height: 7
  - title: Top 10 Products
    name: Top 10 Products
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_column
    fields: [order_items.total_sale_price, products.name]
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
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
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, valueFormat: '$#,##0,"K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $#,##0,"K"
    series_colors:
      order_items.total_sale_price: "#9334E6"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}, {reference_type: line, line_value: mean, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#000000"}, {reference_type: line, line_value: mean,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#000000"}]
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Total Sale Price',
          formatters: [{
            select: 'value >= mean',
            style: {
              color: 'purple'
            }
          }]
        }]
      }
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Created Month Name: order_items.created_month_name
    row: 10
    col: 12
    width: 12
    height: 7
  - title: Top 10 Countries
    name: Top 10 Countries
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_column
    fields: [order_items.total_sale_price, users.country]
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
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
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, valueFormat: '$#,##0,"K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $#,##0,"K"
    series_colors:
      order_items.total_sale_price: "#EA4335"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}, {reference_type: line, line_value: mean, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#000000"}, {reference_type: line, line_value: mean,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#000000"}]
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'Total Sale Price',
          formatters: [{
            select: 'value >= mean',
            style: {
              color: 'brown'
            }
          }]
        }]
      }
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    value_labels: legend
    label_type: labPer
    listen:
      Created Month Name: order_items.created_month_name
    row: 3
    col: 0
    width: 12
    height: 7
  filters:
  - name: Created Month Name
    title: Created Month Name
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
    field: order_items.created_month_name
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
  - name: Brand
    title: Brand
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
    field: products.brand
  - name: Category
    title: Category
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
    field: products.category

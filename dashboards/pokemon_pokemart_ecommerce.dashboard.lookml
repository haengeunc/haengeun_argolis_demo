---
- dashboard: _pokmart_global_operations__pokdex_analytics
  title: "⚡ PokéMart Global Operations & Pokédex Analytics"
  preferred_viewer: dashboards-next
  style: modern
  description: 'High-voltage Looker analytics for PokéMart e-commerce: total items
    sold, gross vs net revenue, global gym leaderboards, and best-selling merchandise.'
  preferred_slug: vnHSSXseNXzIGbJbBlN4ue
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: |
      <div style="background: linear-gradient(135deg, #1E1B4B 0%, #312E81 40%, #1E3A8A 70%, #0F172A 100%); border-radius: 16px; padding: 24px 32px; color: #FFFFFF; box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.4); border: 2px solid #FCD34D; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px;">
        <div style="display: flex; align-items: center; gap: 24px;">
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png" alt="Pikachu" style="height: 100px; width: 100px; filter: drop-shadow(0 6px 12px rgba(252, 211, 77, 0.5)); transform: scale(1.05);"/>
          <div>
            <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 6px;">
              <span style="background: #F59E0B; color: #000; font-weight: 800; font-size: 11px; padding: 3px 10px; border-radius: 9999px; text-transform: uppercase; letter-spacing: 0.08em;">Official PokéMart HQ</span>
              <span style="background: #10B981; color: #FFF; font-weight: 700; font-size: 11px; padding: 3px 10px; border-radius: 9999px;">Live Global Sync</span>
            </div>
            <h1 style="margin: 0; font-size: 28px; font-weight: 900; letter-spacing: -0.02em; color: #FDE047; text-shadow: 0 2px 8px rgba(0,0,0,0.5);">⚡ PokéMart Global Operations Command Center</h1>
            <p style="margin: 6px 0 0 0; font-size: 14px; color: #CBD5E1; max-width: 680px; line-height: 1.5;">
              Welcome, Pokémon Champion & Operations Master! Track global sales velocity, gross vs. net revenue margins, regional Gym performance, and top-selling merchandise with real-time Pokédex intelligence. <em>Gotta Sell 'Em All!</em>
            </p>
          </div>
        </div>
        <div style="display: flex; align-items: center; gap: 12px;">
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png" alt="Charizard" style="height: 85px; width: 85px; filter: drop-shadow(0 4px 10px rgba(239, 68, 68, 0.5));"/>
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/448.png" alt="Lucario" style="height: 85px; width: 85px; filter: drop-shadow(0 4px 10px rgba(59, 130, 246, 0.5));"/>
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png" alt="Gengar" style="height: 85px; width: 85px; filter: drop-shadow(0 4px 10px rgba(168, 85, 247, 0.5));"/>
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png" alt="Mewtwo" style="height: 85px; width: 85px; filter: drop-shadow(0 4px 10px rgba(236, 72, 153, 0.5));"/>
        </div>
      </div>
    row: 0
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: "⚡ Pikachu's Electro: Total Items Sold"
    name: "⚡ Pikachu's Electro: Total Items Sold"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [order_items.total_items_sold]
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
    custom_color: "#D97706"
    single_value_title: ''
    smart_single_value_size: false
    value_format: '[>=1000000] #,##0.0,,"M";[<1000000] #,##0.0,"K";General'
    defaults_version: 1
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 8
    col: 0
    width: 15
    height: 6
    tab_name: ''
  - title: "🪙 Gross Revenue"
    name: "🪙 Gross Revenue"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [order_items.gross_revenue]
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
    custom_color: "#2563EB"
    smart_single_value_size: false
    value_format: '[>=1000000] $#,##0.0,,"M";[<1000000] $#,##0.0,"K";General'
    defaults_version: 1
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 8
    col: 15
    width: 14
    height: 6
    tab_name: ''
  - title: "💖 Net Realized Revenue (Profit)"
    name: "💖 Net Realized Revenue (Profit)"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [order_items.net_revenue]
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
    custom_color: "#059669"
    smart_single_value_size: false
    value_format: '[>=1000000] $#,##0.0,,"M";[<1000000] $#,##0.0,"K";General'
    defaults_version: 1
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 8
    col: 29
    width: 14
    height: 6
    tab_name: ''
  - title: "✈️ In-flight: Processing / Shipped"
    name: "✈️ In-flight: Processing / Shipped"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [order_items.in_flight_revenue]
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
    custom_color: "#2BB8CA"
    smart_single_value_size: false
    value_format: '[>=1000000] $#,##0.0,,"M";[<1000000] $#,##0.0,"K";General'
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 8
    col: 43
    width: 14
    height: 6
    tab_name: ''
  - title: "😵 Returned / Cancelled"
    name: "😵 Returned / Cancelled"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: single_value
    fields: [order_items.returned_or_cancelled_revenue]
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
    custom_color: "#DC2626"
    single_value_title: ''
    smart_single_value_size: false
    value_format: '[>=1000000] $#,##0.0,,"M";[<1000000] $#,##0.0,"K";General'
    defaults_version: 1
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 8
    col: 57
    width: 14
    height: 6
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |
      <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 14px; background: #F8FAFC; border: 1px solid #E2E8F0; border-radius: 12px; padding: 14px;">
        <div style="background: #FFFBEB; border: 1px solid #FDE68A; border-radius: 10px; padding: 10px 14px; display: flex; align-items: center; gap: 12px;">
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png" style="height: 52px; width: 52px; object-fit: contain;"/>
          <div>
            <strong style="color: #92400E; font-size: 13px; display: block;">⚡ Pikachu (Speed & Volume)</strong>
            <span style="font-size: 12px; color: #B45309;">Over 180K units fulfilled with lightning-fast warehouse velocity.</span>
          </div>
        </div>
        <div style="background: #EFF6FF; border: 1px solid #BFDBFE; border-radius: 10px; padding: 10px 14px; display: flex; align-items: center; gap: 12px;">
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/52.png" style="height: 52px; width: 52px; object-fit: contain;"/>
          <div>
            <strong style="color: #1E40AF; font-size: 13px; display: block;">🪙 Meowth (Pay Day Revenue)</strong>
            <span style="font-size: 12px; color: #1D4ED8;">$10.7M gross merchandise transaction volume generated.</span>
          </div>
        </div>
        <div style="background: #ECFDF5; border: 1px solid #A7F3D0; border-radius: 10px; padding: 10px 14px; display: flex; align-items: center; gap: 12px;">
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/242.png" style="height: 52px; width: 52px; object-fit: contain;"/>
          <div>
            <strong style="color: #065F46; font-size: 13px; display: block;">💖 Blissey (Pure Profit Care)</strong>
            <span style="font-size: 12px; color: #047857;">$8.0M net retained after safe delivery & zero customer friction.</span>
          </div>
        </div>
        <div style="background: #FEF2F2; border: 1px solid #FECACA; border-radius: 10px; padding: 10px 14px; display: flex; align-items: center; gap: 12px;">
          <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png" style="height: 52px; width: 52px; object-fit: contain;"/>
          <div>
            <strong style="color: #991B1B; font-size: 13px; display: block;">😵 Psyduck (Return Management)</strong>
            <span style="font-size: 12px; color: #B91C1C;">$2.7M in refunds & cancellations quarantined for root-cause analysis.</span>
          </div>
        </div>
      </div>
    row: 14
    col: 0
    width: 72
    height: 8
    tab_name: ''
  - title: "📈 PokéMart Revenue Trajectory: Gross vs Net Realized (Monthly Trend)"
    name: "📈 PokéMart Revenue Trajectory: Gross vs Net Realized (Monthly Trend)"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_column
    fields: [order_items.created_month, order_items.gross_revenue, order_items.net_revenue,
      order_items.in_flight_revenue, order_items.returned_or_cancelled_revenue]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_date: 36 month ago for 36 month
    sorts: [order_items.created_month]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    hidden_fields: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      order_items.gross_revenue: line
    series_colors:
      order_items.in_flight_revenue: "#12B5CB"
      order_items.returned_or_cancelled_revenue: "#dadddf"
      order_items.net_revenue: "#1A73E8"
      order_items.gross_revenue: "#9334E6"
    series_labels:
      order_items.gross_revenue: Gross Revenue (Total)
      order_items.net_revenue: Net Realized Revenue
      order_items.returned_or_cancelled_revenue: Returned / Cancelled Loss
    show_null_points: false
    interpolation: monotone
    defaults_version: 1
    modern2026: true
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 22
    col: 0
    width: 42
    height: 16
    tab_name: ''
  - title: "🎯 Order Fulfillment Pipeline by Poké-Status"
    name: "🎯 Order Fulfillment Pipeline by Poké-Status"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_pie
    fields: [order_items.status, order_items.total_items_sold]
    sorts: [order_items.total_items_sold desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Shipped: "#3B82F6"
      Complete: "#10B981"
      Processing: "#F59E0B"
      Cancelled: "#EF4444"
      Returned: "#8B5CF6"
    defaults_version: 1
    modern2026: true
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 22
    col: 42
    width: 30
    height: 16
    tab_name: ''
  - title: "⚔️ Category Battle Arena: Gross vs Net Revenue Comparison"
    name: "⚔️ Category Battle Arena: Gross vs Net Revenue Comparison"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_column
    fields: [products.category, order_items.gross_revenue, order_items.net_revenue]
    sorts: [order_items.gross_revenue desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    color_application:
      collection_id: looker_2026
      palette_id: looker_2026_categorical_1
      options:
        steps: 5
        reverse: false
        mirror: false
    hidden_fields: []
    y_axes: [{showLabels: false, showValues: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      order_items.gross_revenue: "#1A73E8"
      order_items.net_revenue: "#12B5CB"
    series_labels:
      order_items.gross_revenue: Gross (Total) Revenue
      order_items.net_revenue: Net Realized Revenue
    defaults_version: 1
    modern2026: true
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 38
    col: 0
    width: 42
    height: 18
    tab_name: ''
  - title: "🐾 Category Champions: Pokémon Partner Leaderboard"
    name: "🐾 Category Champions: Pokémon Partner Leaderboard"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_grid
    fields: [products.pokemon_mascot, products.category, order_items.total_items_sold,
      order_items.gross_revenue, order_items.net_revenue]
    sorts: [order_items.gross_revenue desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    modern2026: true
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 38
    col: 42
    width: 30
    height: 18
    tab_name: ''
  - title: "🌍 Global Pokémon Gym Leaderboard: Top Selling Countries"
    name: "🌍 Global Pokémon Gym Leaderboard: Top Selling Countries"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_grid
    fields: [users.country_with_pokemon, users.regional_gym_badge, order_items.total_items_sold,
      order_items.gross_revenue, order_items.net_revenue]
    sorts: [order_items.gross_revenue desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    modern2026: true
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 56
    col: 0
    width: 42
    height: 18
    tab_name: ''
  - title: "🏆 Top Selling Countries by Total Revenue"
    name: "🏆 Top Selling Countries by Total Revenue"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_bar
    fields: [users.country, order_items.gross_revenue]
    sorts: [order_items.gross_revenue desc]
    limit: 8
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    series_colors:
      order_items.gross_revenue: "#F59E0B"
    defaults_version: 1
    modern2026: true
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 56
    col: 42
    width: 30
    height: 18
    tab_name: ''
  - title: "⭐ PokéMart Hall of Fame: Top Selling Products (Units Sold)"
    name: "⭐ PokéMart Hall of Fame: Top Selling Products (Units Sold)"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_grid
    fields: [products.pokemon_mascot, products.name, products.brand, products.category,
      order_items.total_items_sold, order_items.gross_revenue, order_items.net_revenue]
    sorts: [order_items.total_items_sold desc]
    limit: 12
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    modern2026: true
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 74
    col: 0
    width: 42
    height: 20
    tab_name: ''
  - title: "💎 Legendary Tier: Top 10 Products by Total Revenue"
    name: "💎 Legendary Tier: Top 10 Products by Total Revenue"
    model: thelook_ecommerce_haengeun_us
    explore: customer_orders
    type: looker_bar
    fields: [products.name, order_items.gross_revenue]
    sorts: [order_items.gross_revenue desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    series_colors:
      order_items.gross_revenue: "#8B5CF6"
    defaults_version: 1
    modern2026: true
    listen:
      Country: users.country
      Category: products.category
      Created Year: order_items.created_year
    row: 74
    col: 42
    width: 30
    height: 20
    tab_name: ''
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |
      <div style="background: linear-gradient(180deg, #F8FAFC 0%, #F1F5F9 100%); border: 2px solid #E2E8F0; border-radius: 16px; padding: 24px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);">
        <div style="display: flex; align-items: center; justify-content: space-between; border-bottom: 2px solid #CBD5E1; padding-bottom: 12px; margin-bottom: 16px;">
          <div>
            <h2 style="margin: 0; color: #1E293B; font-size: 20px; font-weight: 800; display: flex; align-items: center; gap: 8px;">
              <span>🏆 Official PokéMart Department Partner Roster</span>
            </h2>
            <p style="margin: 4px 0 0 0; color: #64748B; font-size: 13px;">Every merchandise category is backed by a certified Pokémon Partner to ensure maximum quality and battle-ready reliability.</p>
          </div>
          <span style="background: #FEF3C7; color: #92400E; font-weight: 700; font-size: 12px; padding: 4px 12px; border-radius: 9999px; border: 1px solid #FCD34D;">Pokédex Division v2.5</span>
        </div>

        <div style="display: grid; grid-template-columns: repeat(6, 1fr); gap: 14px;">
          <div style="background: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 12px; padding: 14px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.04);">
            <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png" style="height: 64px; width: 64px; object-fit: contain; margin-bottom: 8px;"/>
            <div style="font-weight: 800; font-size: 14px; color: #C2410C;">Charizard</div>
            <div style="font-size: 11px; font-weight: 600; color: #64748B; margin-bottom: 4px;">Outerwear & Coats</div>
            <span style="font-size: 11px; background: #FFEDD5; color: #9A3412; padding: 2px 6px; border-radius: 4px; font-weight: 700;">$1.33M Revenue</span>
          </div>

          <div style="background: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 12px; padding: 14px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.04);">
            <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/448.png" style="height: 64px; width: 64px; object-fit: contain; margin-bottom: 8px;"/>
            <div style="font-weight: 800; font-size: 14px; color: #1D4ED8;">Lucario</div>
            <div style="font-size: 11px; font-weight: 600; color: #64748B; margin-bottom: 4px;">Jeans & Denim</div>
            <span style="font-size: 11px; background: #DBEAFE; color: #1E40AF; padding: 2px 6px; border-radius: 4px; font-weight: 700;">$1.22M Revenue</span>
          </div>

          <div style="background: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 12px; padding: 14px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.04);">
            <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/143.png" style="height: 64px; width: 64px; object-fit: contain; margin-bottom: 8px;"/>
            <div style="font-weight: 800; font-size: 14px; color: #0F766E;">Snorlax</div>
            <div style="font-size: 11px; font-weight: 600; color: #64748B; margin-bottom: 4px;">Sweaters & Knits</div>
            <span style="font-size: 11px; background: #CCFBF1; color: #115E59; padding: 2px 6px; border-radius: 4px; font-weight: 700;">$831K Revenue</span>
          </div>

          <div style="background: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 12px; padding: 14px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.04);">
            <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png" style="height: 64px; width: 64px; object-fit: contain; margin-bottom: 8px;"/>
            <div style="font-weight: 800; font-size: 14px; color: #0284C7;">Squirtle</div>
            <div style="font-size: 11px; font-weight: 600; color: #64748B; margin-bottom: 4px;">Swimwear</div>
            <span style="font-size: 11px; background: #E0F2FE; color: #0369A1; padding: 2px 6px; border-radius: 4px; font-weight: 700;">$643K Revenue</span>
          </div>

          <div style="background: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 12px; padding: 14px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.04);">
            <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png" style="height: 64px; width: 64px; object-fit: contain; margin-bottom: 8px;"/>
            <div style="font-weight: 800; font-size: 14px; color: #7E22CE;">Gengar</div>
            <div style="font-size: 11px; font-weight: 600; color: #64748B; margin-bottom: 4px;">Hoodies & Sweats</div>
            <span style="font-size: 11px; background: #F3E8FF; color: #6B21A8; padding: 2px 6px; border-radius: 4px; font-weight: 700;">$639K Revenue</span>
          </div>

          <div style="background: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 12px; padding: 14px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.04);">
            <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png" style="height: 64px; width: 64px; object-fit: contain; margin-bottom: 8px;"/>
            <div style="font-weight: 800; font-size: 14px; color: #B45309;">Eevee</div>
            <div style="font-size: 11px; font-weight: 600; color: #64748B; margin-bottom: 4px;">Accessories</div>
            <span style="font-size: 11px; background: #FEF3C7; color: #92400E; padding: 2px 6px; border-radius: 4px; font-weight: 700;">$423K Revenue</span>
          </div>
        </div>
      </div>
    row: 94
    col: 0
    width: 72
    height: 16
    tab_name: ''
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
  - name: Created Year
    title: Created Year
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
    field: order_items.created_year

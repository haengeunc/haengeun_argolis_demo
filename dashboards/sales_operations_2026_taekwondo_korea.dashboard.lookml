---
- dashboard: sales_operations_2026_taekwondo_korea
  title: "🥋 Korea Taekwondo Sales Operations 2026"
  preferred_viewer: dashboards-next
  layout: newspaper
  description: 'Global Sales Operations 2026 Command Center with authentic Korean heritage, Kukkiwon martial arts precision, and real-time e-commerce intelligence.'
  
  filters:
    - name: Created Year
      title: "📅 Sales Year"
      type: field_filter
      default_value: "2026"
      allow_multiple_values: false
      required: false
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      field: order_items.created_year
      
    - name: Country
      title: "🌍 Regional Dojang / Country"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      field: users.country
      
    - name: Category
      title: "🥋 Product Category"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      field: products.category

    - name: Status
      title: "📦 Fulfillment Status"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      field: order_items.status

  elements:
    # Header Banner Element with Taekwondo & Korea Visuals (Full Width 24)
    - name: tkd_korea_header_banner
      type: text
      title_text: ''
      body_text: |
        <div style="background: linear-gradient(135deg, #0A1128 0%, #001F54 30%, #034078 60%, #8B0000 95%, #CD2E3A 100%); border-radius: 12px; padding: 22px 28px; color: #FFFFFF; box-shadow: 0 8px 20px -4px rgba(0, 0, 0, 0.4); border: 2px solid #FCD34D; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; width: 100%; box-sizing: border-box;">
          <div style="display: flex; align-items: center; gap: 20px;">
            <div style="position: relative; width: 90px; height: 90px; flex-shrink: 0; background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, rgba(0,0,0,0.5) 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; border: 2px solid #FDE047; box-shadow: 0 0 16px rgba(253, 224, 71, 0.5);">
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/320px-Flag_of_South_Korea.svg.png" alt="Taegeukgi" style="height: 56px; width: 56px; object-fit: cover; border-radius: 50%; box-shadow: 0 4px 8px rgba(0,0,0,0.6);"/>
            </div>
            <div>
              <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 6px; flex-wrap: wrap;">
                <span style="background: #CD2E3A; color: #FFFFFF; font-weight: 800; font-size: 11px; padding: 3px 10px; border-radius: 9999px; text-transform: uppercase; letter-spacing: 0.08em; border: 1px solid #FF8080;">🥋 KUKKIWON HQ OPS</span>
                <span style="background: #0047A0; color: #FFFFFF; font-weight: 700; font-size: 11px; padding: 3px 10px; border-radius: 9999px; border: 1px solid #60A5FA;">🇰🇷 TAEGEUK SPIRIT 2026</span>
                <span style="background: #10B981; color: #FFFFFF; font-weight: 700; font-size: 11px; padding: 3px 10px; border-radius: 9999px;">⚡ LIVE SALES VELOCITY</span>
              </div>
              <h1 style="margin: 0; font-size: 24px; font-weight: 900; letter-spacing: -0.02em; color: #FDE047; text-shadow: 0 2px 8px rgba(0,0,0,0.7);">
                🥋 대한민국 태권도 2026 Sales Operations Command Center
              </h1>
              <p style="margin: 4px 0 0 0; font-size: 13px; color: #E2E8F0; line-height: 1.4;">
                Welcome to the <strong>2026 Global Sales & Fulfillment Operations HQ</strong>. Powered by the precision, discipline, and dynamic power of Taekwondo — real-time sales velocity, recognized net revenue, regional dojang benchmarks, and high-velocity merchandise.
              </p>
            </div>
          </div>
          <div style="display: flex; align-items: center; gap: 12px; background: rgba(0,0,0,0.35); padding: 8px 14px; border-radius: 10px; border: 1px solid rgba(255,255,255,0.15);">
            <div style="text-align: center;">
              <span style="font-size: 26px; display: block;">🥋</span>
              <span style="font-size: 10px; color: #FDE047; font-weight: 700; text-transform: uppercase;">Black Belt</span>
            </div>
            <div style="text-align: center;">
              <span style="font-size: 26px; display: block;">🐅</span>
              <span style="font-size: 10px; color: #60A5FA; font-weight: 700; text-transform: uppercase;">Korean Tiger</span>
            </div>
            <div style="text-align: center;">
              <span style="font-size: 26px; display: block;">🏛️</span>
              <span style="font-size: 10px; color: #F472B6; font-weight: 700; text-transform: uppercase;">Seoul Hub</span>
            </div>
          </div>
        </div>
      row: 0
      col: 0
      width: 24
      height: 3

    # KPI Row (6 KPIs across width 24 = 4 width each)
    # KPI 1: 2026 Gross Revenue
    - name: kpi_gross_revenue
      title: "🥋 2026 Gross Sales (Total Bookings)"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: single_value
      fields: [order_items.gross_revenue]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#CD2E3A"
      value_format: '[>=1000000] $#,##0.00,,"M";[<1000000] $#,##0.0,"K";$#,##0'
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 3
      col: 0
      width: 4
      height: 3

    # KPI 2: 2026 Net Recognized Revenue
    - name: kpi_net_revenue
      title: "🏆 2026 Net Revenue (Completed)"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: single_value
      fields: [order_items.net_revenue]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#0047A0"
      value_format: '[>=1000000] $#,##0.00,,"M";[<1000000] $#,##0.0,"K";$#,##0'
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 3
      col: 4
      width: 4
      height: 3

    # KPI 3: 2026 Total Items Sold
    - name: kpi_items_sold
      title: "⚡ 2026 Total Units Sold"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: single_value
      fields: [order_items.total_items_sold]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#D97706"
      value_format: '[>=1000000] #,##0.0,,"M";[<1000000] #,##0.0,"K";#,##0'
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 3
      col: 8
      width: 4
      height: 3

    # KPI 4: 2026 Average Order Value
    - name: kpi_aov
      title: "🎯 2026 Average Order Value"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: single_value
      fields: [order_items.average_order_value]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#2563EB"
      value_format: '$#,##0.00'
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 3
      col: 12
      width: 4
      height: 3

    # KPI 5: 2026 In-Flight Fulfillment
    - name: kpi_in_flight_revenue
      title: "📦 2026 In-Flight Pipeline"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: single_value
      fields: [order_items.in_flight_revenue]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#0D9488"
      value_format: '[>=1000000] $#,##0.00,,"M";[<1000000] $#,##0.0,"K";$#,##0'
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 3
      col: 16
      width: 4
      height: 3

    # KPI 6: Return & Cancellation Rate
    - name: kpi_return_rate
      title: "🛡️ Return & Churn Rate"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: single_value
      fields: [order_items.return_cancellation_rate]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#9333EA"
      value_format: '0.0%'
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 3
      col: 20
      width: 4
      height: 3

    # Section Banner 1: Poomsae Sales Velocity & Run-Rate
    - name: section_poomsae_velocity
      type: text
      title_text: ''
      body_text: |
        <div style="background: linear-gradient(90deg, #001F54 0%, #034078 50%, #0A1128 100%); padding: 10px 18px; border-radius: 8px; border-left: 6px solid #CD2E3A; display: flex; align-items: center; justify-content: space-between; width: 100%; box-sizing: border-box;">
          <span style="font-size: 15px; font-weight: 800; color: #FFFFFF; letter-spacing: 0.02em;">
            🥋 1. TAEKWONDO POOMSAE (품새) MONTHLY SALES VELOCITY & TRAJECTORY (2026)
          </span>
          <span style="font-size: 11px; font-weight: 700; color: #FDE047; background: rgba(255,255,255,0.12); padding: 3px 10px; border-radius: 20px;">
            Dynamic Pace Analysis
          </span>
        </div>
      row: 6
      col: 0
      width: 24
      height: 2

    # Chart 1: Monthly Sales Velocity (Width 14)
    - name: monthly_sales_trajectory_2026
      title: "📈 2026 Monthly Sales Velocity & Run-Rate Progression"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: looker_area
      fields: [order_items.created_month, order_items.gross_revenue, order_items.net_revenue]
      sorts: [order_items.created_month asc]
      limit: 500
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      show_x_axis_label: true
      x_axis_label: "2026 Poomsae Month"
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      series_colors:
        order_items.gross_revenue: "#CD2E3A"
        order_items.net_revenue: "#0047A0"
      series_labels:
        order_items.gross_revenue: "Gross Sales (Taegeuk Red)"
        order_items.net_revenue: "Net Recognized (Taegeuk Blue)"
      show_value_labels: true
      label_density: 25
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 8
      col: 0
      width: 14
      height: 8

    # Chart 2: Order Fulfillment Discipline (Width 10)
    - name: order_status_breakdown_2026
      title: "🥋 2026 Order Operations & Delivery Discipline"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: looker_pie
      fields: [order_items.status, order_items.total_items_sold]
      sorts: [order_items.total_items_sold desc]
      limit: 500
      value_format: '#,##0'
      series_colors:
        Shipped: "#0047A0"
        Complete: "#10B981"
        Processing: "#F59E0B"
        Cancelled: "#CD2E3A"
        Returned: "#6B7280"
      inner_radius: 50
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 8
      col: 14
      width: 10
      height: 8

    # Section Banner 2: Regional Dojang Benchmarks
    - name: section_regional_dojangs
      type: text
      title_text: ''
      body_text: |
        <div style="background: linear-gradient(90deg, #8B0000 0%, #CD2E3A 50%, #0A1128 100%); padding: 10px 18px; border-radius: 8px; border-left: 6px solid #FCD34D; display: flex; align-items: center; justify-content: space-between; width: 100%; box-sizing: border-box;">
          <span style="font-size: 15px; font-weight: 800; color: #FFFFFF; letter-spacing: 0.02em;">
            🇰🇷 2. GLOBAL DOJANG (도장) & REGIONAL PERFORMANCE LEADERBOARDS (2026)
          </span>
          <span style="font-size: 11px; font-weight: 700; color: #FFFFFF; background: rgba(0,0,0,0.3); padding: 3px 10px; border-radius: 20px;">
            Kukkiwon Worldwide Network
          </span>
        </div>
      row: 16
      col: 0
      width: 24
      height: 2

    # Chart 3: Top Regional Dojangs (Width 12)
    - name: top_dojangs_by_revenue
      title: "🌍 2026 Top Regional Dojangs & Country Revenue"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: looker_column
      fields: [users.country, order_items.gross_revenue, order_items.total_items_sold]
      sorts: [order_items.gross_revenue desc]
      limit: 10
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      show_x_axis_label: true
      x_axis_label: "Regional Dojang"
      show_value_labels: true
      series_colors:
        order_items.gross_revenue: "#0047A0"
        order_items.total_items_sold: "#CD2E3A"
      series_labels:
        order_items.gross_revenue: "Gross Revenue ($)"
        order_items.total_items_sold: "Units Sold"
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 18
      col: 0
      width: 12
      height: 8

    # Chart 4: Product Category Battle Arena (Width 12)
    - name: category_battle_arena
      title: "🥋 Product Category Martial Arts Battle Arena (2026)"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: looker_bar
      fields: [products.category, order_items.gross_revenue]
      sorts: [order_items.gross_revenue desc]
      limit: 12
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      show_x_axis_label: true
      x_axis_label: "Product Category"
      show_value_labels: true
      series_colors:
        order_items.gross_revenue: "#CD2E3A"
      series_labels:
        order_items.gross_revenue: "Category Sales ($)"
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 18
      col: 12
      width: 12
      height: 8

    # Section Banner 3: Operations Roster
    - name: section_high_velocity_roster
      type: text
      title_text: ''
      body_text: |
        <div style="background: linear-gradient(90deg, #0A1128 0%, #1E3A8A 50%, #001F54 100%); padding: 10px 18px; border-radius: 8px; border-left: 6px solid #10B981; display: flex; align-items: center; justify-content: space-between; width: 100%; box-sizing: border-box;">
          <span style="font-size: 15px; font-weight: 800; color: #FFFFFF; letter-spacing: 0.02em;">
            🐅 3. GRANDMASTER MERCHANDISE ROSTER & OPERATIONS LOG (2026)
          </span>
          <span style="font-size: 11px; font-weight: 700; color: #FDE047; background: rgba(255,255,255,0.12); padding: 3px 10px; border-radius: 20px;">
            Top 15 High-Velocity Items
          </span>
        </div>
      row: 26
      col: 0
      width: 24
      height: 2

    # Chart 5: Top 15 Products Table (Width 24, size_to_fit: true, clean formatting)
    - name: top_products_roster_2026
      title: "🥋 Top Performing Merchandise & Operations Roster (2026)"
      model: thelook_ecommerce_haengeun_us
      explore: customer_orders
      type: looker_grid
      fields: [products.name, products.brand, products.category, order_items.total_items_sold, order_items.gross_revenue, order_items.average_sale_price]
      sorts: [order_items.gross_revenue desc]
      limit: 15
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
      truncate_column_names: false
      defaults_version: 1
      listen:
        Created Year: order_items.created_year
        Country: users.country
        Category: products.category
        Status: order_items.status
      row: 28
      col: 0
      width: 24
      height: 8

    # Footer Card with Korean Cultural & Martial Arts Elements
    - name: tkd_korea_footer
      type: text
      title_text: ''
      body_text: |
        <div style="background: linear-gradient(135deg, #0A1128 0%, #001F54 50%, #034078 100%); border-radius: 12px; padding: 16px 24px; color: #CBD5E1; border: 1px solid rgba(253, 224, 71, 0.3); display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 14px; width: 100%; box-sizing: border-box;">
          <div style="display: flex; align-items: center; gap: 14px;">
            <span style="font-size: 26px;">🇰🇷</span>
            <div>
              <div style="font-weight: 700; color: #FDE047; font-size: 13px;">국기원 태권도 세일즈 오퍼레이션 (Kukkiwon Taekwondo Sales Operations 2026)</div>
              <div style="font-size: 11px; color: #94A3B8;">Built with Looker LookML & Google BigQuery • TheLook E-Commerce Dataset • All Rights Reserved 2026</div>
            </div>
          </div>
          <div style="display: flex; align-items: center; gap: 10px; font-size: 11px; color: #E2E8F0;">
            <span style="background: rgba(205, 46, 58, 0.3); padding: 4px 8px; border-radius: 6px; border: 1px solid #CD2E3A;">백절불굴 (Indomitable Spirit)</span>
            <span style="background: rgba(0, 71, 160, 0.3); padding: 4px 8px; border-radius: 6px; border: 1px solid #0047A0;">극기 (Self-Control)</span>
            <span style="background: rgba(245, 158, 11, 0.3); padding: 4px 8px; border-radius: 6px; border: 1px solid #F59E0B;">예의 (Courtesy)</span>
          </div>
        </div>
      row: 36
      col: 0
      width: 24
      height: 2

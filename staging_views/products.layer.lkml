include: "/views/products.view.lkml"

view: +products {

  dimension: brand {
    description: "The brand name of the product. Examples include 'Calvin Klein', 'Nike', 'Adidas'."
    link: {
      label: "Google"
      url: "https://www.google.com/search?q={{ value }}"
      icon_url: "https://google.com/favicon.ico"
    }

    # suggestions: ["Nike", "Speedo", "PUMA", "adidas", "Lee", "error"]
    suggest_explore: fulfillment
    suggest_dimension: inventory_items.product_brand

  }

  measure: total_cost {
    description: "The total cost of an item"
    type: sum
    sql: ${cost} ;;
    value_format:"[>=1000]$#,##0,\"K\";[<1000]$#,##0"
  }

  dimension: pokemon_mascot {
    type: string
    label: "Pokémon Partner"
    description: "PokéMart designated Pokémon partner mascot for this category"
    sql:
      CASE ${category}
        WHEN 'Outerwear & Coats' THEN 'Charizard'
        WHEN 'Jeans' THEN 'Lucario'
        WHEN 'Sweaters' THEN 'Snorlax'
        WHEN 'Swim' THEN 'Squirtle'
        WHEN 'Fashion Hoodies & Sweatshirts' THEN 'Gengar'
        WHEN 'Suits & Sport Coats' THEN 'Mewtwo'
        WHEN 'Sleep & Lounge' THEN 'Jigglypuff'
        WHEN 'Tops & Tees' THEN 'Pikachu'
        WHEN 'Shorts' THEN 'Scorbunny'
        WHEN 'Active' THEN 'Greninja'
        WHEN 'Accessories' THEN 'Eevee'
        WHEN 'Intimates' THEN 'Sylveon'
        WHEN 'Pants' THEN 'Machamp'
        WHEN 'Underwear' THEN 'Slowpoke'
        WHEN 'Dresses' THEN 'Gardevoir'
        WHEN 'Socks' THEN 'Meowth'
        WHEN 'Maternity' THEN 'Chansey'
        WHEN 'Plus' THEN 'Blastoise'
        WHEN 'Leggings' THEN 'Dragonite'
        WHEN 'Blazers & Jackets' THEN 'Blaziken'
        WHEN 'Skirts' THEN 'Togekiss'
        WHEN 'Suits' THEN 'Alakazam'
        WHEN 'Jumpsuits & Rompers' THEN 'Bulbasaur'
        WHEN 'Pants & Capris' THEN 'Hitmonlee'
        WHEN 'Socks & Hosiery' THEN 'Pichu'
        WHEN 'Clothing Sets' THEN 'Ditto'
        ELSE 'Pikachu'
      END ;;
    html:
      <div style="display: inline-flex; align-items: center; gap: 8px; font-weight: 600;">
        <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{% if value == 'Charizard' %}6{% elsif value == 'Lucario' %}448{% elsif value == 'Snorlax' %}143{% elsif value == 'Squirtle' %}7{% elsif value == 'Gengar' %}94{% elsif value == 'Mewtwo' %}150{% elsif value == 'Jigglypuff' %}39{% elsif value == 'Pikachu' %}25{% elsif value == 'Scorbunny' %}813{% elsif value == 'Greninja' %}658{% elsif value == 'Eevee' %}133{% elsif value == 'Sylveon' %}700{% elsif value == 'Machamp' %}68{% elsif value == 'Slowpoke' %}79{% elsif value == 'Gardevoir' %}282{% elsif value == 'Meowth' %}52{% elsif value == 'Chansey' %}113{% elsif value == 'Blastoise' %}9{% elsif value == 'Dragonite' %}149{% elsif value == 'Blaziken' %}257{% elsif value == 'Togekiss' %}468{% elsif value == 'Alakazam' %}65{% elsif value == 'Bulbasaur' %}1{% elsif value == 'Hitmonlee' %}106{% elsif value == 'Pichu' %}172{% else %}132{% endif %}.png" height="32" width="32" style="object-fit: contain; vertical-align: middle; border-radius: 4px;"/>
        <span>{{ value }}</span>
      </div> ;;
  }

  dimension: pokemon_image {
    type: string
    label: "Pokémon Image"
    description: "Visual badge of the category Pokémon"
    sql: ${pokemon_mascot} ;;
    html: <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{% if value == 'Charizard' %}6{% elsif value == 'Lucario' %}448{% elsif value == 'Snorlax' %}143{% elsif value == 'Squirtle' %}7{% elsif value == 'Gengar' %}94{% elsif value == 'Mewtwo' %}150{% elsif value == 'Jigglypuff' %}39{% elsif value == 'Pikachu' %}25{% elsif value == 'Scorbunny' %}813{% elsif value == 'Greninja' %}658{% elsif value == 'Eevee' %}133{% elsif value == 'Sylveon' %}700{% elsif value == 'Machamp' %}68{% elsif value == 'Slowpoke' %}79{% elsif value == 'Gardevoir' %}282{% elsif value == 'Meowth' %}52{% elsif value == 'Chansey' %}113{% elsif value == 'Blastoise' %}9{% elsif value == 'Dragonite' %}149{% elsif value == 'Blaziken' %}257{% elsif value == 'Togekiss' %}468{% elsif value == 'Alakazam' %}65{% elsif value == 'Bulbasaur' %}1{% elsif value == 'Hitmonlee' %}106{% elsif value == 'Pichu' %}172{% else %}132{% endif %}.png" height="42" width="42" style="object-fit: contain; vertical-align: middle;"/> ;;
  }

}

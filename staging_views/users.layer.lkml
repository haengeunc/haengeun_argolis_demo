include: "/views/users.view.lkml"


view: +users {
  label: "Users"

  dimension: id {
    label: "User ID"
    group_label: "User Details"
  }

  dimension: email {
    description: "Click to send email to the user."
    action: {
      label: "Send email"
      url: "https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&{{ value }}"
      # form_url: "https://example.com/api/send_foo_form.json"

      form_param: {
        name: "title"
        type: select
        label: "desired label name"
        option: {
          name: "name string"
          label: "send email"
        }
        required: yes
        description: "Send email to the user"
        default: "value string"
      }


    }
  }




  dimension: full_name {
    type: string
    sql: CONCAT( ${first_name}, ' ', ${last_name}) ;;
    group_label: "User Details"
  }

  dimension: country {
    drill_fields: [state, city]
  }

  dimension: country_with_pokemon {
    type: string
    label: "Regional League & Mascot"
    description: "Country with regional Pokémon Gym mascot"
    sql: ${country} ;;
    html:
      <div style="display: inline-flex; align-items: center; gap: 8px; font-weight: 600;">
        <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{% if value == 'China' %}384{% elsif value == 'United States' %}25{% elsif value == 'Brasil' %}151{% elsif value == 'South Korea' %}448{% elsif value == 'United Kingdom' %}94{% elsif value == 'France' %}658{% elsif value == 'Germany' %}9{% elsif value == 'Spain' %}815{% elsif value == 'Japan' %}26{% elsif value == 'Australia' %}115{% elsif value == 'Belgium' %}131{% elsif value == 'Poland' %}445{% else %}133{% endif %}.png" height="32" width="32" style="object-fit: contain; vertical-align: middle; border-radius: 4px;"/>
        <span>{{ value }}</span>
      </div> ;;
  }

  dimension: regional_gym_badge {
    type: string
    label: "Regional Gym Badge & Champion"
    description: "Regional Champion Pokémon Title"
    sql:
      CASE ${country}
        WHEN 'China' THEN '🐉 Rayquaza (Sky Pillar Gym)'
        WHEN 'United States' THEN '⚡ Pikachu (Thunderbolt Gym)'
        WHEN 'Brasil' THEN '🌿 Mew (Amazonian Gym)'
        WHEN 'South Korea' THEN '🥊 Lucario (Aura Guardian Gym)'
        WHEN 'United Kingdom' THEN '👻 Gengar (Crown Shadow Gym)'
        WHEN 'France' THEN '🌊 Greninja (Kalos Torrent Gym)'
        WHEN 'Germany' THEN '🛡️ Blastoise (Hydro Fortress Gym)'
        WHEN 'Spain' THEN '🔥 Cinderace (Pyro Arena Gym)'
        WHEN 'Japan' THEN '⚡ Raichu (Indigo Plateau Gym)'
        WHEN 'Australia' THEN '🥊 Kangaskhan (Outback Gym)'
        WHEN 'Belgium' THEN '❄️ Lapras (Glacier Bay Gym)'
        WHEN 'Poland' THEN '🌪️ Garchomp (Sinnoh Peak Gym)'
        ELSE '⭐ Eevee (Discovery Gym)'
      END ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
    value_format_name: decimal_2
  }

}

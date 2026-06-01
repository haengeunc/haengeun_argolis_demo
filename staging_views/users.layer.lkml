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

  measure: average_age {
    type: average
    sql: ${age} ;;
    value_format_name: decimal_2
  }

}


test: users_age_should_be_in_expected_range {
  explore_source: customer_orders {
    column: age {
      field: users.age
    }
  }
  assert: age_should_be_greater_than_ten {
    expression: ${users.age} > 10 ;;
  }
  assert: age_should_be_less_than_130 {
    expression: ${users.age} < 130 ;;
  }
}

include: "/views/distribution_centers.view.lkml"

view: +distribution_centers {

  dimension: location {
    description: "Distribution center location (lat, long)"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

}

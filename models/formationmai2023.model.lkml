connection: "renault-gcp-sub-react"

# include all the views
include: "/views/**/*.view"

datagroup: formationmai2023_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: formationmai2023_default_datagroup

explore: pareto {}

explore: vin_data {}

explore: data_pareto_v2 {}

explore: ig_2j {}

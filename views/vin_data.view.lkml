view: vin_data {
  sql_table_name: `REACT_DEV_DATA.Vin_Data`
    ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: catalogue_price {
    type: number
    sql: ${TABLE}.catalogue_price ;;
  }

  dimension: client_discount {
    type: number
    sql: ${TABLE}.client_discount ;;
  }

  dimension: dealer_name {
    type: string
    sql: ${TABLE}.dealer_name ;;
  }

  dimension: engine {
    type: string
    sql: ${TABLE}.engine ;;
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}.fuel_type ;;
  }

  dimension_group: invoice {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: marginal_profit {
    type: number
    sql: ${TABLE}.marginal_profit ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: order {
    type: string
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [dealer_name]
  }

  measure: dist_count_abdou {
    type: count_distinct
    sql:  ${model} ;;
  }

  measure: discount {
    type: count_distinct
    sql: ${version};;
  }

  measure: nombre_distinct_modeles_junaid {
    group_label: "junaid"
    type: count_distinct
    sql: ${model};;
    drill_fields: [model]
  }

  measure: count_distinct_DEB {
    type: count_distinct
    drill_fields: [model, count]
    sql: ${model};;
  }

  measure: models_zobir {
    group_label: "zobir"
    type: count_distinct
    drill_fields: [model, count]
    sql: ${model};;
  }
  dimension: dealer_name_zobir {
    group_label: "zobir"
    type: string
    #sql: ${dealer_name};;
    sql: REPLACE(${dealer_name}, ‘-’, ‘ ‘);;
  }
  measure: count_distinct_pedram {
    type: count_distinct
    sql: ${model};;
    drill_fields: [version,brand,dealer_name]
  }

  measure: uniq_model_matveeva {
    type:  count_distinct
    sql:  ${model} ;;
    drill_fields: [ model ]
  }

}

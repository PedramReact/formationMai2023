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

  dimension: d_name_abdou {
    type: string
    sql: replace( ${dealer_name}, " ", "-" );;

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
    drill_fields: [ model]
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
  measure: modelchaymae {
    group_label: "chaymae"
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

  measure: count_distinct_pedram {
    type: count_distinct
    sql: ${model};;
    drill_fields: [version,brand,dealer_name]
  }

  measure: uniq_model_matveeva {
    group_label: "anastasiia"
    type:  count_distinct
    sql:  ${model} ;;
    drill_fields: [ model, count ]
  }


  dimension: DealerNameModif_Matveeva {
    type: string
    sql: REPLACE(${TABLE}.dealer_name, " ", "_") ;;
  }

  dimension: Type_de_carburant_matveeva {
    type:  string
    sql:
    CASE
    WHEN ${fuel_type} = "DIESEL" THEN "Gasoil"
    WHEN ${fuel_type} = "ELECTRIC" THEN "Electrique"
    WHEN ${fuel_type} = "PETROL" THEN "Essence"
    WHEN ${fuel_type} = "PETROL CNGGAZ" THEN "GAZ"
    WHEN ${fuel_type} = "PETROL LPG" THEN "GAZ"
    END;;
  }

  dimension: concat_model_version_matveeva {
    group_label: "anastasiia"
    type:  string
    sql: CONCAT(model, "-", version) ;;
    drill_fields: [brand, model, version, catalogue_price]
  }

  dimension_group: order {
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
    sql: ${TABLE}.order_date ;;
  }

  dimension: new_invoice {
    group_label: "anastasiia"
    sql: ${invoice_date} ;;
    html: {{rendered_value | date:"%A %d %b %y"}} ;;
  }

  measure: min_price_matveeva {
    group_label: "anastasiia"
    type:  min
    value_format: "$#.0"
    sql:  ${catalogue_price} ;;
  }

  measure: max_price_matveeva {
    group_label: "anastasiia"
    type:  max
    value_format: "$#.0"
    sql:  ${catalogue_price} ;;
  }

  measure: avg_price_matveeva {
    group_label: "anastasiia"
    type:  average
    value_format: "$#.0"
    sql:  ${catalogue_price} ;;
  }

  dimension: dif_date_matveeva {
    sql: DATE_DIFF(${invoice_date}, ${order_date}, day) ;;
  }

  measure: min_dif_matveeva {
    group_label: "anastasiia"
    type:  min
    sql:  ${dif_date_matveeva} ;;
  }

  measure: max_dif_matveeva {
    group_label: "anastasiia"
    type:  max
    sql:  ${dif_date_matveeva} ;;
  }

  measure: avg_dif_matveeva {
    group_label: "anastasiia"
    type:  average
    sql:  ${dif_date_matveeva} ;;
  }

  dimension:  brand_logo_matveeva{
    sql: ${brand} ;;
    html: {% if brand._value == "RENAULT" %}
    <img src = "https://www.largus.fr/images/styles/max_1300x1300/public/images/logo-renault-fond-noir.jpg?itok=RQr9UQLF" height="170" width="255">
    {% elsif brand._value == "DACIA" %}
    <img src = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Dacia-logo.png/900px-Dacia-logo.png" height="170" width="255">
    {% else %}
    <img src="https://upload.wikimedia.org/wikipedia/fr/thumb/1/1f/Alpine.svg/langfr-420px-Alpine.svg.png" height="170" width="255">
    {% endif %} ;;
  }
}

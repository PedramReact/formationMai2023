view: vin_data {
  sql_table_name: `REACT_DEV_DATA.Vin_Data`
    ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_logo_junaid {
    group_label: "junaid"
    type: string
    sql: ${brand};;
    html:
    {% if brand._value == "ALPINE" %}
    <img src="https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg" height="170" width="255">
    {% elsif brand._value == "DACIA" %}
    <img src="https://upload.wikimedia.org/wikipedia/fr/4/4d/Logo_Dacia.svg" height="170" width="255">
    {% elsif brand._value == "RENAULT" %}
    <img src="https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg" height="170" width="255">
    {% endif %} ;;
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

  dimension: dealer_name_modifie_junaid {
    label: "Dealer name modifié"
    group_label: "junaid"
    type: string
    sql: replace(${dealer_name}, " ", "_") ;;
  }

  dimension: engine {
    type: string
    sql: ${TABLE}.engine ;;
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}.fuel_type ;;
  }

  dimension: fuel_type_french_junaid {
    label: "Type de carburant"
    group_label: "junaid"
    type: string
    sql: CASE
      when fuel_type = 'DIESEL' then 'gasoil'
      when fuel_type = "ELECTRIC" then 'Electrique'
      when fuel_type = 'PETROL' then 'Essence'
      when fuel_type = 'PETROL CNGGAZ' then 'GAZ'
      when fuel_type = 'PETROL LPG' then 'GAZ'
      END;;
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

  dimension: invoice_date_formate_junaid {
    label: "Invoice date formaté"
    group_label: "date_junaid"
    type: date
    sql: ${invoice_date} ;;
    html: {{ rendered_value | date: "%A %d %b %y" }} ;;
  }

  dimension: marginal_profit {
    type: number
    sql: ${TABLE}.marginal_profit ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: order_date {
    type: string
    sql: ${TABLE}.order_date ;;
  }

  dimension_group: order_date_junaid {
    type: time
    timeframes: [
      date,
      day_of_week,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql:${order_date} ;;
  }

  dimension: dif_order_invoice_date {
    type: number
    sql:  DATETIME_DIFF(${invoice_date}, ${order_date_junaid_date}, DAY);;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: concat_model_version_junaid {
    label: "Modèle avec version"
    group_label: "junaid"
    type: string
    sql: CONCAT(${model}, "-",${version});;
    drill_fields: [brand, model, version, catalogue_price]
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

  measure: avg_catalogue_price_junaid{
    group_label: "junaid"
    type: average
    value_format:"0.0€"
    sql: ${catalogue_price};;

  }

  measure: max_catalogue_price_junaid {
    group_label: "junaid"
    type: max
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
  }

  measure: min_catalogue_price_junaid {
    group_label: "junaid"
    type: min
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
  }

  measure: avg_dif_order_invoice_junaid{
    group_label: "junaid"
    type: average
    sql: ${dif_order_invoice_date};;
    value_format: "0"
  }

  measure: max_dif_order_invoice_junaid {
    group_label: "junaid"
    type: max
    sql: ${dif_order_invoice_date} ;;
  }

  measure: min_dif_order_invoice_junaid {
    group_label: "junaid"
    type: min
    sql: ${dif_order_invoice_date} ;;
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

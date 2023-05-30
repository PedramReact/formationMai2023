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
    group_label: "DEB"
    type: count_distinct
    drill_fields: [model, count]
    sql: model;;
  }

  dimension: dealer_name_DEB {
    group_label: "DEB"
    type: string
    sql: REPLACE(dealer_name," ","_") ;;
  }

  dimension: fuel_type_DEB {
    group_label: "DEB"
    type: string
    sql: REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(fuel_type,"DIESEL","Gasoil"),"ELECTRIC","Electrique"),"PETROL CNGGAZ","GAZ"),"PETROL LPG","GAZ"),"PETROL","Essence") ;;
  }

  dimension: model_version_DEB {
    group_label: "DEB"
    type: string
    drill_fields: [brand, model, version, catalogue_price]
    sql: CONCAT(model,"-",version);;
  }

  dimension_group: order_date_DEB {
    type: time
    timeframes: [date, day_of_week, month, week, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: invoice_DEB {
    group_label: "DEB"
    type: date
    sql: ${invoice_date} ;;
    html: {{rendered_value | date: "%A %e %b %Y"}} ;;
  }

  measure: min_catalogue_price_DEB {
    group_label: "DEB"
    type: min
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
  }

  measure: max_catalogue_price_DEB {
    group_label: "DEB"
    type: max
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
  }

  measure: avg_catalogue_price_DEB {
    group_label: "DEB"
    type: average
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
  }

  dimension: diff_invoice_order_DEB {
    group_label: "DEB"
    type: number
    sql: DATE_DIFF(${invoice_date},${order_date_DEB_date}, day) ;;
  }

  measure: min_diff_DEB {
    group_label: "DEB"
    type: min
    sql: ${diff_invoice_order_DEB} ;;
  }

  measure: max_diff_DEB {
    group_label: "DEB"
    type: max
    sql: ${diff_invoice_order_DEB} ;;
  }

  measure: avg_diff_DEB {
    group_label: "DEB"
    type: average
    sql: ${diff_invoice_order_DEB} ;;
  }

  dimension: logo_DEB {
    group_label: "DEB"
    type: string
    sql: ${brand} ;;
    html: {% if brand._value == "RENAULT" %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg" height="80" width="80">
              {% elsif brand._value == "ALPINE" %}
              <img src="https://upload.wikimedia.org/wikipedia/fr/b/b7/Alpine_F1_Team_2021_Logo.svg" height="80" width="80">
              {% elsif brand._value == "DACIA" %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/a/a1/Dacia-logo.png" height="80" width="80">
              {% else %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="170" width="170">
              {% endif %} ;;
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

  dimension: dealer_name_zobir {
    group_label: "zobir"
    type: string
    #sql: ${dealer_name};;
    sql: REPLACE(${TABLE}.dealer_name, " ", "-");;
  }


  dimension: DealerNameModif_Matveeva {
    type: string
    sql: REPLACE(${TABLE}.dealer_name, " ", "_") ;;
  }



}

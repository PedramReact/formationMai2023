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
  dimension: Type_de_Carburant_zobir {
    group_label: "zobir"
    type: string
    sql:(
      CASE
        WHEN ${TABLE}.fuel_type = "DIESEL" THEN "Gasoil"
        WHEN ${TABLE}.fuel_type = "ELECTRIC" THEN "Electrique"
        WHEN ${TABLE}.fuel_type = "PETROL" THEN "Essence"
        WHEN ${TABLE}.fuel_type = "PETROL ONGAZ" THEN "GAZ"
        WHEN ${TABLE}.fuel_type = "PETROL LPG" THEN "GAZ"
        ELSE "Other"
       END
    ) ;;
    #sql: REPLACE(${TABLE}.fuel_type, " ", "-");;
    }
  dimension: Concat_Model_Version_zobir {
    group_label: "zobir"
    type: string
    drill_fields: [brand, model, count]
    sql: concat(${model}, "-", ${version})  ;;
  }

  dimension_group: order_date_zobir {
    #group_label: "zobir"
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
    sql: ${TABLE}.order_date ;;
  }

  dimension: invoice_date_formatted_zobir {
    group_label: "zobir"
    sql: ${TABLE}.invoice_date} ;;
    html: {{ rendered_value | date: "%A, %B %e, %YY" }};;
  }


  dimension: DealerNameModif_Matveeva {
    type: string
    sql: REPLACE(${TABLE}.dealer_name, " ", "_") ;;
  }



}

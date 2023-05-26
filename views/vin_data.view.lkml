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
    group_label: "order_date_DEB"
    type: time
    timeframes: [date, day_of_week, month, week, year]
    datatype: date
    sql: ${TABLE}.order_date ;;
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
    sql: ${TABLE}.invoice_date ;;
    html: {{ rendered_value | date: "%A %d %b %y" }};;
  }

  measure: catalogue_price_avg_zobir {
    group_label: "zobir"
    type: average
    sql: ${TABLE}.catalogue_price ;;
    value_format_name: usd
  }

  measure: catalogue_price_max_zobir {
    group_label: "zobir"
    type: max
    sql: ${TABLE}.catalogue_price ;;
    value_format_name: usd
  }
  measure: catalogue_price_min_zobir {
    group_label: "zobir"
    type: min
    sql: ${TABLE}.catalogue_price ;;
    value_format_name: usd
  }

  dimension: order_date_v2_zobir {
    group_label: "zobir"
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  measure: diff_order_invoice_dt_zobir {
    group_label: "zobir"
    type: number
    sql:  DATE_DIFF(${TABLE}.invoice_date, ${order_date_v2_zobir}) ;;
    #sql:  DATETIME_DIFF(${TABLE}.invoice_date, ${TABLE}.order_date_v2_zobir) ;;
    drill_fields: [ diff_ord_inv_dt_MIN_zobir, diff_ord_inv_dt_AVG_zobir, diff_ord_inv_dt_MAX_zobir ]
  }
  measure: diff_ord_inv_dt_MAX_zobir {
    group_label: "zobir"
    type: max
    sql: ${TABLE}.diff_order_invoice_dt_zobir ;;
    #value_format_name: usd
  }
  measure: diff_ord_inv_dt_MIN_zobir {
    group_label: "zobir"
    type: min
    sql: ${TABLE}.diff_order_invoice_dt_zobir ;;
    #value_format_name: usd
  }
  measure: diff_ord_inv_dt_AVG_zobir {
    group_label: "zobir"
    type: average
    sql: ${TABLE}.diff_order_invoice_dt_zobir ;;
    #value_format_name: usd
  }

  dimension: brand_logo_zobir {
    group_label: "zobir"
    type: string
    sql: ${brand} ;;
    html:
              {% if brand._value == "ALPINE" %}
              <img src="https://logo-marque.com/wp-content/uploads/2021/08/Alpine-Logo-650x366.png" height="170" width="255">
              {% elsif brand._value == "RENAULT" %}
              <img src="https://logo-marque.com/wp-content/uploads/2021/04/Renault-Logo-650x366.png" height="170" width="255">
              {% elsif brand._value == "DACIA" %}
              <img src="https://logo-marque.com/wp-content/uploads/2021/06/Dacia-Logo-650x366.jpg" height="170" width="255">
              {% else %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="170" width="170">
              {% endif %} ;;
  }

  measure: count_distinct_models_C_zobir {
    group_label: "zobir"
    type: number
    #sql: COUNT_DISTINCT(IF(substring(${model}, 1, 1) = "C", ${model},NULL)) ;;
    sql:  (
    count(case when substring(${model}, 1, 1) = "C" then 1 end)
    ) ;;
  }

# COUNT_DISTINCT(IF(Category="Stationery", Transaction ID,NULL))
# substring(${model}, 1, 1) = “C”


  dimension: DealerNameModif_Matveeva {
    type: string
    sql: REPLACE(${TABLE}.dealer_name, " ", "_") ;;
  }

  dimension: Fuel_type_CQAS{
    group_label: "CQAS" label: "Fuel_type"
    type: string
    sql: (case
      when ${TABLE}.fuel_type = "DIESEL" then "Gasoil"
      when ${TABLE}.fuel_type = "ELECTRIC" then "Electrique"
      when ${TABLE}.fuel_type = "PETROL" then "Essence"
      when ${TABLE}.fuel_type = "PETROL CNGGAZ" then "GAZ"
      when ${TABLE}.fuel_type = "PETROL LPG" then "GAZ"
      else "null"
      end
      )
    ;;
  }

 dimension: Model_versionCQAS {
  group_label: "CQAS" label: "CONCAT_Medel_Version"
   type: string
   drill_fields: [brand, model, version]
   sql: concat(${model},"-", ${version});;
 }

 dimension: formatDateCQAS {
  group_label: "CQAS" label: "FormatDate"
   #type: date
   sql: ${invoice_date};;
  html: {{rendered_value | date: "%A,  %e, %b,, %y"}} ;;

 }

measure: Min_Catal_price {
  group_label: "CQA" label: "MIN"
  type: min
  sql: ${catalogue_price} ;;
  value_format: "\"€\"0.0"

}
  measure: Max_Catal_price {
    group_label: "CQA" label: "MAX"
    type: max
    sql: ${catalogue_price} ;;
    value_format: "\"€\"0.0"

  }

  measure: Avg_Catal_price {
   group_label: "CQA" label: "AVG"
    type: average
    sql: ${catalogue_price} ;;
    value_format: "\"€\"0.0"

  }




}

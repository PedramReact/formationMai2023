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

  dimension: order {
    type: string
    sql: ${TABLE}.order_date ;;
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
    sql:  DATE_DIFF(${invoice_date}, ${order_date_v2_zobir}, DAY) ;;
    #sql:  DATETIME_DIFF(${TABLE}.invoice_date, ${TABLE}.order_date_v2_zobir) ;;
    drill_fields: [ diff_ord_inv_dt_MIN_zobir, diff_ord_inv_dt_AVG_zobir, diff_ord_inv_dt_MAX_zobir ]
    #sql:  DATETIME_DIFF(${invoice_date}, ${order_date_junaid_date}, DAY);;

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

  measure: nombre_distinct_models_zobir {
    group_label: "zobir"
    type: number
    sql:  (
        count(DISTINCT(${model}))
) ;;
  }

  measure: count_distinct_models_C_zobir {
    group_label: "zobir"
    type: number
    #sql: COUNT_DISTINCT(IF(substring(${model}, 1, 1) = "C", ${model},NULL)) ;;
    sql:  (
        count(DISTINCT(case when substring(${model}, 1, 1) = "C" then ${model} end))
) ;;
  }
#count(COUNT_DISTINCT(case when substring(${model}, 1, 1) = "C" then 1 end))
# count(COUNT_DISTINCT(case when substring(${model}, 1, 1) = "C" then 1 end))
# COUNT_DISTINCT(IF(Category="Stationery", Transaction ID,NULL))
# substring(${model}, 1, 1) = “C”
# count(distinct

  dimension: Concat_Brand_Carburant_zobir {
    group_label: "zobir"
    type: string
    #drill_fields: [count]
    sql: concat(${brand}, " - ", ${Type_de_Carburant_zobir})  ;;
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

 #####05
 dimension: Model_versionCQAS {
  group_label: "CQAS" label: "CONCAT_Medel_Version"
   type: string
   drill_fields: [brand, model, version]
   sql: concat(${model},"-", ${version});;
 }
#####06
  dimension: Order_DateC {
    group_label: "CQAS" label: "Order_Date"
    type: date
    sql: CAST(${order} as date) ;;

  }

#####07
 dimension: Format_date {
  group_label: "CQAS" label: "new format date"
   #type: date
   sql: ${invoice_date};;
  html: {{rendered_value | date: "%A,  %e, %b,, %y"}} ;;

 }
#####08
 measure: Min_Catal_price {
  group_label: "CQA" label: "MIN"
  type: min
  sql: ${catalogue_price} ;;
  value_format: "\"€\"0.0"

}
#####08
  measure: Max_Catal_price {
    group_label: "CQA" label: "MAX"
    type: max
    sql: ${catalogue_price} ;;
    value_format: "\"€\"0.0"

  }

  #####08
  measure: Avg_Catal_price {
   group_label: "CQA" label: "AVG"
    type: average
    sql: ${catalogue_price} ;;
    value_format: "\"€\"0.0"

  }
  #####09
 #measure: Diff_Date {
  #group_label: "CQA" label: "DifDate"
  #type: date
  #sql: DATE_DIFF(${TABLE}.invoice_date, ${Order_date_CQAS}) ;;

# }

 #####10
  dimension: Logo_Brand_CQAS  {
    group_label: "CQAS" label: "LogoBrand"
    sql: ${brand} ;;
    html:
        {% case value %}
    {% when "ALPINE"  %}
     <img src="https://logos-world.net/wp-content/uploads/2021/08/Alpine-Logo.png" width="60" height= "41" >
    {% when "DACIA"  %}
     <img src="https://th.bing.com/th/id/R.d2ad9cb08750329f7f3a9c26d1c099a9?rik=DcdZmpfkHN%2ffeQ&pid=ImgRaw&r=0" width="60" height= "41"">
    {% else %}
     <img src="https://th.bing.com/th/id/OIP.zDzBfI6j78kO-rH3cOfDgAHaHa?pid=ImgDet&rs=1" width="60" height= "41">
    {% endcase %};;
  }



}

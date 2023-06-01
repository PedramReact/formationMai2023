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

  measure: count_distinct_DEB {
    type: count_distinct
    sql: ${model};;
    drill_fields: [model]
  }
  measure: count_distinct {
    type: count_distinct
    sql: ${model};;
  }

  measure: count_distinct_asma {
    group_label: "asma"
    type:  count_distinct
    sql: ${model} ;;
    drill_fields: [model]
  }

  dimension: modified_dealer_name_asma {
    group_label: "asma"
    type: string
    sql:  replace(${dealer_name}, " ", "_");;
  }


  dimension:  modified_fuel_type_asma {
    group_label: "asma"
    type: string
    sql: CASE
          WHEN ${fuel_type} = 'DIESEL' THEN 'Gasoil'
          WHEN ${fuel_type} = 'ELECTRIC' THEN 'Electrique'
          WHEN ${fuel_type} = 'PETROL' THEN 'Essence'
          WHEN ${fuel_type} IN ('PETROL CNGGAZ', 'PETROL LPG') THEN 'GAZ'
          ELSE ${fuel_type}
         END ;;
  }


dimension:  concat_model_version_asma {
  group_label: "asma"
  type:  string
  sql: concat(${model},"-", ${version});;
  drill_fields: [brand, model, version, catalogue_price]
  }


dimension_group: order_date_asma{
  group_label: "asma"
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


dimension: invoice_date_asma {
  group_label: "asma"
  sql: ${invoice_date} ;;
  html:{{ rendered_value | date: "%A %d %b %y" }};;

  }

measure: max_catalogue_price_asma {
  group_label: "asma"
    type: max
    sql: ${catalogue_price};;
    value_format: "0.0"
  }

measure: min_catalogue_price_asma {
  group_label: "asma"
    type: min
    sql: ${catalogue_price};;
    value_format: "0.0"

  }

measure: avg_catalogue_price_asma {
  group_label: "asma"
    type: average
    sql: ${catalogue_price};;
    value_format: "0.0"
  }

dimension: difference_invoice_order_date_asma {
  group_label: "asma"
  sql: DATE_DIFF(${invoice_date}, ${order_date_asma_date}, day) ;;
  }

measure: min_difference_invoice_order_date_asma {
  group_label: "asma"
  type: min
  sql: ${difference_invoice_order_date_asma} ;;
  }

measure: max_difference_invoice_order_date_asma{
  group_label: "asma"
  type: max
  sql: ${difference_invoice_order_date_asma} ;;
  }

measure: avg_difference_invoice_order_date_asma {
  group_label: "asma"
  type: average
  sql: ${difference_invoice_order_date_asma} ;;
  }

  dimension: Brand_Logo_asma {
    group_label: "asma"
    type: string
    sql: CASE
         WHEN ${brand} = 'ALPINE' THEN 'https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg'
         WHEN ${brand} = 'DACIA' THEN 'https://logodix.com/logo/1208196.png'
         WHEN ${brand} = 'RENAULT' THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg'
         END;;
    html: <img src={{ value }} width="125">;;
  }


  dimension:  logo_asma {
    sql: ${brand} ;;
    html:
    {% if value == "ALPINE" %}
      <img src= "https://logo-marque.com/wp-content/uploads/2021/08/Alpine-Logo-650x366.png" height= "1700" width="255">
    {% elsif value == "RENAULT" %}
      <img src="https://logo-marque.com/wp-content/uploads/2021/04/Renault-Logo-650x366.pn
    {% elsif value =="DACIA" %}g" height= "170" width="255">
      <img src= "https://logo-marque.com/wp-content/uploads/2021/06/Dacia-Logo-650x366.jpg" height= "1700" width="255">

    {% endif %}
 ;;
  }

  dimension: logo_a {
    type: string
    sql: ${brand} ;;
    html: {% if brand._value == "RENAULT" %}
      <img src="https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg" height="150" width="80">
                    {% elsif brand._value == "ALPINE" %}
      <img src="https://upload.wikimedia.org/wikipedia/fr/b/b7/Alpine_F1_Team_2021_Logo.svg" height="150" width="80">
                    {% elsif brand._value == "DACIA" %}
      <img src="https://logodix.com/logo/1208196.png" height="150" width="80">
                    {% else %}
      <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="170" width="170">
                    {% endif %} ;;
  }

  dimension:  brand_logo_aa{
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

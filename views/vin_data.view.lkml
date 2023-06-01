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

  dimension: new_invoice {
    sql:  ${invoice_date};;
    html:{{ rendered_value | date: "%A %d %b %y" }};;
  }

  dimension: marginal_profit {
    type: number
    sql: ${TABLE}.marginal_profit ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      date,
      week,
      day_of_week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date;;

  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: New_dealer_name {
    type: string
    sql: replace(${dealer_name}," ","_") ;;
  }

dimension: type_de_carburant {
  type: string
  sql:
    case
    when ${fuel_type} = "DIESEL" then "Gasoil"
    when ${fuel_type} = "ELECTRIC" then "Electrique"
    when ${fuel_type} = "PETROL" then "Essence"
    when ${fuel_type} = "PETROL CNGGAZ" then "GAZ"
    when ${fuel_type} = "PETROL LPG" then "GAZ"
    end;;
}

    dimension: type_de_logo {
    sql: ${brand} ;;
      html:
      {% if value == "RENAULT" %}
      <img src="https://logo-marque.com/wp-content/uploads/2021/04/Renault-Logo-2021-present.jpg" height="170" width="255"/>
      {% elsif value == "ALPINE" %}
      <img src="https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg" height="170" width="255"/>
      {% elsif value == "DACIA"%}
      <img src="https://motorsactu.com/wp-content/uploads/2021/06/NOUVEAU-LOGO-DACIA.jpg" height="170" width="255"/>

        {% endif %};;
    }

  dimension: Concat_Model_Version {
    type: string
    sql: ${model}||"-"||${version}
    ;;
    drill_fields: [brand,model,version,catalogue_price]
  }

 dimension: diff_order_invoice {
  sql: DATE_DIFF(${invoice_date},${order_date},day) ;;
 }

dimension: logo {
  type: string
  sql:
    case
    when ${brand}= "ALPINE" then "https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg"
    when ${brand}= "DACIA" then "https://motorsactu.com/wp-content/uploads/2021/06/NOUVEAU-LOGO-DACIA.jpg"
    when ${brand}= "RENAULT" then "https://logo-marque.com/wp-content/uploads/2021/04/Renault-Logo-2021-present.jpg"
  end;;
  html: "<img src={{value}}/>";;
  }


  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Day"
      value: "day"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
  }

  dimension: date {
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${order_day_of_week}
    {% elsif date_granularity._parameter_value == 'month' %}
      ${order_month}
    {% elsif date_granularity._parameter_value == 'week' %}
      ${order_week}
    {% else %}
      ${order_year}
    {% endif %};;
  }



  measure: count {
    type: count
    drill_fields: [dealer_name]
  }

  measure: discount {
    type: count_distinct
    sql: ${version} ;;
  }

  measure: count_models_Maximilien {
    type: count_distinct
    sql: ${model};;
    drill_fields: [model]
  }

  measure: min_price {
    type:  min
    sql: ${catalogue_price} ;;
    value_format: "0.0"
  }

  measure: max_price {
    type:  max
    sql: ${catalogue_price} ;;
    value_format: "0.0"
  }

  measure: average_price {
    type:  average
    sql: ${catalogue_price} ;;
    value_format: "0.0"
  }

  measure: min_diff_order_invoice {
    type:  min
    sql: ${diff_order_invoice} ;;
  }

  measure: max_diff_order_invoice {
    type:  max
    sql: ${diff_order_invoice} ;;

  }

  measure: average_diff_order_invoice {
    type:  average
    sql: ${diff_order_invoice} ;;
    value_format: "0.0"
  }
}

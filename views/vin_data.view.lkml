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

  parameter: date_granularity_junaid {
    group_label: "date_junaid"
    type: unquoted
    allowed_value: {
      label: "Année"
      value: "year"
    }
    allowed_value: {
      label: "Mois"
      value: "month"
    }
    allowed_value: {
      label: "Semaine"
      value: "week"
    }
  }

  dimension: order_date_granularity_junaid {
    group_label: "date_junaid"
    sql:
    {% if date_granularity_junaid._parameter_value == 'year' %}
      ${order_date_junaid_year}
    {% elsif date_granularity_junaid._parameter_value == 'month' %}
      ${order_date_junaid_month}
    {% elsif date_granularity_junaid._parameter_value == 'week' %}
      ${order_date_junaid_week}
    {% else %}
      ${order_date_junaid_year}
    {% endif %};;
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


  measure: count_models_Maximilien {
    type: count_distinct
    sql: ${model};;
    drill_fields: [model]
  }

  measure: nombre_distinct_modeles_junaid {
    group_label: "junaid"

    type: count_distinct
    sql: ${model};;
    drill_fields: [model]
  }


  measure: min_price {
    type:  min
    sql: ${catalogue_price} ;;
    value_format: "0.0"
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
    group_label: "anastasiia"
    type:  count_distinct
    sql:  ${model} ;;
    drill_fields: [ model, count ]
  }


  dimension: DealerNameModif_Matveeva {}
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
    sql:  DATETIME_DIFF(${invoice_date}, ${order_date_v2_zobir}, DAY);;
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

  parameter: Order_date_gran_zobir {
    group_label: "zobir"
    hidden: yes
    type: string
    allowed_value: {value:"year"}
    allowed_value: {value:"month"}
  }

  dimension: order_dt_G_zobir {
    hidden: yes
    group_label: "zobir"
    label_from_parameter: Order_date_gran_zobir
    sql:
          case
            when  {% parameter Order_date_gran_zobir  %} == "year" THEN  ${order_date_zobir_year}
            when  {% parameter Order_date_gran_zobir  %} == "month" THEN ${order_date_zobir_month}
          end
           ;;
  }

# zobir
  parameter: date_granularity_zobir {
    type: unquoted
    allowed_value: {
      label: "semaine"
      value: "week"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Year"
      value: "year"
    }
    allowed_value: {
      label: "Jours"
      value: "Day"
    }
  }

  dimension: date_zobir {
    group_label: "zobir"
    sql:
        {% if date_granularity_zobir._parameter_value == 'week' %}
      ${order_date_zobir_week}
        {% elsif date_granularity_zobir._parameter_value == 'month' %}
         ${order_date_zobir_month}
        {% elsif date_granularity_zobir._parameter_value == 'year' %}
      ${order_date_zobir_year}
        {% endif %};;
  }
# zobir



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
  dimension_group: Order_DateC {
    group_label: "CQAS" label: "Order_Date"

    type: time
    sql: CAST(${order_date_v2_zobir} as date) ;;

    timeframes: [
      date,
      day_of_week,
      month,
      week,
      year
    ]
    datatype: date


  }

#####07
 dimension: Format_date {
  group_label: "CQAS" label: "new format date"
   #type: date
   sql: ${invoice_date};;
  html: {{rendered_value | date: "%A,  %e, %b, %y"}} ;;

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
 measure: Diff_Date {
  group_label: "CQA" label: "DifDate"
  type: number
  sql: DATE_DIFF(${TABLE}.invoice_date, ${Order_DateC_date}.days) ;;

 }

####


 #####10
  dimension: Logo_Brand_CQAS  {
    group_label: "CQAS" label: "LogoBrand"
    sql: ${brand} ;;
    html:
        {% case value %}
    {% when "ALPINE"  %}
     <img src="https://logos-world.net/wp-content/uploads/2021/08/Alpine-Logo.png" width="60" height= "41" >
    {% when "DACIA"  %}
     <img src="https://th.bing.com/th/id/R.d2ad9cb08750329f7f3a9c26d1c099a9?rik=DcdZmpfkHN%2ffeQ&pid=ImgRaw&r=0" width="60" height= "41">
    {% else %}
     <img src="https://th.bing.com/th/id/OIP.zDzBfI6j78kO-rH3cOfDgAHaHa?pid=ImgDet&rs=1" width="60" height= "41">
    {% endcase %};;
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

  dimension_group: order_pedram {
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
  dimension_group: order_date_DEB {
    type: time
    timeframes: [date, day_of_week, month, week, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  measure: max_catalogue_price_DEB {
    group_label: "DEB"
    type: max
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
  }
  dimension: fuel_type_DEB {
    group_label: "DEB"
    type: string
    sql: REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(fuel_type,"DIESEL","Gasoil"),"ELECTRIC","Electrique"),"PETROL CNGGAZ","GAZ"),"PETROL LPG","GAZ"),"PETROL","Essence") ;;
  }

  #___________________ start amal

  dimension: dealer_name_modified_amal {
    label: "dealer name modified amal"
    group_label: "AMAL"
    type: string
    sql: replace(${dealer_name}, " ", "_") ;;
  }

  dimension: fuel_type_amal {
    label: "fuel type"
    group_label: "AMAL"
    type: string
    sql:(
      CASE
        WHEN ${TABLE}.fuel_type = "DIESEL" THEN "Gasoil"
        WHEN ${TABLE}.fuel_type = "ELECTRIC" THEN "Electrique"
        WHEN ${TABLE}.fuel_type = "PETROL" THEN "Essence"
        WHEN ${TABLE}.fuel_type = "PETROL ONGAZ" THEN "GAZ"
        WHEN ${TABLE}.fuel_type = "PETROL LPG" THEN "GAZ"
        ELSE "Other"
       END ) ;;
    }

  dimension: concat_model_version_AMAL {
    label: "Concat Model Version"
    group_label: "AMAL"
    type: string
    sql: CONCAT(${model}, "-",${version});;
    drill_fields: [brand, model, version, catalogue_price]
  }

  dimension_group: order_date_AMAL {
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

  dimension: invoice_date_formatted_AMAL {
    label: "invoice date formatted"
    group_label: "AMAL"
    sql: ${TABLE}.invoice_date ;;
    html: {{ rendered_value | date: "%A %d %b %y" }};;
  }

  measure: min_catalogue_price_AMAL{
    label: "min catalogue price"

    group_label: "AMAL"
    type: min
    value_format:"0.0€"
    sql: ${catalogue_price};;

  }

  measure: max_catalogue_price_AMAL {
    label: "max catalogue price"
    group_label: "AMAL"
    type: max
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
  }

  measure: average_catalogue_price_AMAL {
    label: "average catalogue price"

    group_label: "AMAL"
    type: average
    value_format: "0.0€"
    sql: ${catalogue_price} ;;
  }

  dimension: diff_order_invoice_date_AMAL {
    group_label: "AMAL"
    type: number
    sql:  DATETIME_DIFF(${invoice_date}, ${order_date_AMAL_date}, DAY);;
  }

  measure: average_dif_order_invoice_AMAL{
    group_label: "AMAL"
    type: average
    sql: ${diff_order_invoice_date_AMAL};;
    value_format: "0"
  }

  measure: max_dif_order_invoice_AMAL {
    group_label: "AMAL"
    type: max
    sql: ${diff_order_invoice_date_AMAL} ;;
  }

  measure: min_dif_order_invoice_AMAL {
    group_label: "AMAL"
    type: min
    sql: ${diff_order_invoice_date_AMAL} ;;
  }

  dimension: Logo_Brand_AMAL  {
    group_label: "AMAL"
    label: "Logo brand"
    sql: ${brand} ;;
    html:
        {% case value %}
    {% when "ALPINE"  %}
     <img src="https://logos-world.net/wp-content/uploads/2021/08/Alpine-Logo.png" width="60" height= "41" >
    {% when "DACIA"  %}
     <img src="https://th.bing.com/th/id/R.d2ad9cb08750329f7f3a9c26d1c099a9?rik=DcdZmpfkHN%2ffeQ&pid=ImgRaw&r=0" width="60" height= "41">
    {% else %}
     <img src="https://th.bing.com/th/id/OIP.zDzBfI6j78kO-rH3cOfDgAHaHa?pid=ImgDet&rs=1" width="60" height= "41">
    {% endcase %};;
  }


  #___________________ end amal

  dimension: Brand_Logo {
    group_label: "asma"
    type: string
    sql: CASE
         WHEN ${brand} = 'ALPINE' THEN 'https://www.retro-laser.com/wp-content/uploads/2021/12/2021-12-13-at-08-17-16.jpg'
         WHEN ${brand} = 'DACIA' THEN 'https://upload.wikimedia.org/wikipedia/fr/4/4d/Logo_Dacia.svg'
         WHEN ${brand} = 'RENAULT' THEN 'https://upload.wikimedia.org/wikipedia/commons/4/49/Renault_2009_logo.svg'
         END;;
    html: <img src={{value}} width="255">;;
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
  measure: min_difference_invoicedate_orderdate {
    group_label: "asma"
    type: min
    sql: ${difference_invoice_order_date_asma} ;;
  }

  measure: max_difference_invoicedate_orderdate{
    group_label: "asma"
    type: max
    sql: ${difference_invoice_order_date_asma} ;;
  }

  measure: avg_difference_invoicedate_orderdate {
    group_label: "asma"
    type: average
    sql: ${difference_invoice_order_date_asma} ;;
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

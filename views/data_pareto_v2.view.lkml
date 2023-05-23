view: data_pareto_v2 {
  sql_table_name: `REACT_DEV_DATA.DATA_PARETO_V2`
    ;;

  dimension: annemois {
    type: number
    sql: ${TABLE}.annemois ;;
  }

  dimension: certificated_country {
    type: string
    sql: ${TABLE}.certificated_country ;;
  }

  dimension: cod_et_apv_prov {
    type: number
    sql: ${TABLE}.cod_et_apv_prov ;;
  }

  dimension: cod_ident_pb {
    type: string
    sql: ${TABLE}.COD_IDENT_PB ;;
  }

  dimension: customer_complaint {
    type: string
    sql: ${TABLE}.customer_complaint ;;
  }

  dimension: customer_complaint_label_en {
    type: string
    sql: ${TABLE}.customer_complaint_label_en ;;
  }

  dimension: customer_complaint_label_fr {
    type: string
    sql: ${TABLE}.customer_complaint_label_fr ;;
  }

  dimension: date_deliv_pieces_def {
    type: string
    sql: ${TABLE}.date_deliv_pieces_def ;;
  }

  dimension: date_livraison {
    type: string
    sql: ${TABLE}.date_livraison ;;
  }

  dimension_group: datealerte {
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
    sql: ${TABLE}.datealerte ;;
  }

  dimension_group: dateapplipremsiteserprov {
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
    sql: ${TABLE}.dateapplipremsiteserprov ;;
  }

  dimension_group: datemaxapvprov {
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
    sql: ${TABLE}.datemaxapvprov ;;
  }

  dimension_group: datemaxserdef {
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
    sql: ${TABLE}.datemaxserdef ;;
  }

  dimension_group: datemaxserprov {
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
    sql: ${TABLE}.datemaxserprov ;;
  }

  dimension_group: datep3 {
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
    sql: ${TABLE}.datep3 ;;
  }

  dimension_group: datephyreelap {
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
    sql: ${TABLE}.datephyreelap ;;
  }

  dimension: delivery_region {
    type: string
    sql: ${TABLE}.delivery_region ;;
  }

  dimension: delivery_region_label_en {
    type: string
    sql: ${TABLE}.delivery_region_label_en ;;
  }

  dimension: delivery_region_label_fr {
    type: string
    sql: ${TABLE}.delivery_region_label_fr ;;
  }

  dimension: distribution_country {
    type: string
    sql: ${TABLE}.distribution_country ;;
  }

  dimension: distribution_country_label_en {
    type: string
    sql: ${TABLE}.distribution_country_label_en ;;
  }

  dimension: distribution_country_label_fr {
    type: string
    sql: ${TABLE}.distribution_country_label_fr ;;
  }

  dimension_group: distribution {
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
    sql: ${TABLE}.distribution_date ;;
  }

  dimension: dll_checksum {
    type: number
    sql: ${TABLE}.DLL_CHECKSUM ;;
  }

  dimension_group: dll_date_creation {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DLL_DATE_CREATION ;;
  }

  dimension_group: dll_date_maj {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DLL_DATE_MAJ ;;
  }

  dimension: dll_validite {
    type: number
    sql: ${TABLE}.DLL_VALIDITE ;;
  }

  dimension: drg_status_code {
    type: string
    sql: ${TABLE}.drg_status_code ;;
  }

  dimension_group: dt_appli_prev_ser_def {
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
    sql: ${TABLE}.dt_appli_prev_ser_def ;;
  }

  dimension_group: dtappliprevsolprov {
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
    sql: ${TABLE}.dtappliprevsolprov ;;
  }

  dimension: ecr_code {
    type: string
    sql: ${TABLE}.ecr_code ;;
  }

  dimension: ecr_label_en {
    type: string
    sql: ${TABLE}.ecr_label_en ;;
  }

  dimension: ecr_label_fr {
    type: string
    sql: ${TABLE}.ecr_label_fr ;;
  }

  dimension: efficiency_rate {
    type: number
    sql: ${TABLE}.efficiency_rate ;;
  }

  dimension: engine_index {
    type: number
    sql: ${TABLE}.engine_index ;;
  }

  dimension: engine_type {
    type: string
    sql: ${TABLE}.engine_type ;;
  }

  dimension: expenditure_code {
    type: string
    sql: ${TABLE}.expenditure_code ;;
  }

  dimension: factory_manufacturing_box {
    type: string
    sql: ${TABLE}.factory_manufacturing_box ;;
  }

  dimension: factory_manufacturing_box_label_en {
    type: string
    sql: ${TABLE}.factory_manufacturing_box_label_en ;;
  }

  dimension: factory_manufacturing_box_label_fr {
    type: string
    sql: ${TABLE}.factory_manufacturing_box_label_fr ;;
  }

  dimension: factory_manufacturing_engine {
    type: string
    sql: ${TABLE}.factory_manufacturing_engine ;;
  }

  dimension: factory_manufacturing_engine_label_en {
    type: string
    sql: ${TABLE}.factory_manufacturing_engine_label_en ;;
  }

  dimension: factory_manufacturing_engine_label_fr {
    type: string
    sql: ${TABLE}.factory_manufacturing_engine_label_fr ;;
  }

  dimension: factory_manufacturing_vehicle {
    type: number
    sql: ${TABLE}.factory_manufacturing_vehicle ;;
  }

  dimension: factory_manufacturing_vehicle_label_en {
    type: string
    sql: ${TABLE}.factory_manufacturing_vehicle_label_en ;;
  }

  dimension: factory_manufacturing_vehicle_label_fr {
    type: string
    sql: ${TABLE}.factory_manufacturing_vehicle_label_fr ;;
  }

  dimension_group: fic_opening {
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
    sql: ${TABLE}.fic_opening_date ;;
  }

  dimension: function_code_label_en {
    type: string
    sql: ${TABLE}.function_code_label_en ;;
  }

  dimension: function_code_label_fr {
    type: string
    sql: ${TABLE}.function_code_label_fr ;;
  }

  dimension: gearbox_index {
    type: number
    sql: ${TABLE}.gearbox_index ;;
  }

  dimension: gearbox_type {
    type: string
    sql: ${TABLE}.gearbox_type ;;
  }

  dimension_group: global_incident {
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
    sql: ${TABLE}.global_incident_date ;;
  }

  dimension: gq05_plantdesc {
    type: string
    sql: ${TABLE}.gq05_plantdesc ;;
  }

  dimension: gq23_alertlabel {
    type: string
    sql: ${TABLE}.gq23_alertlabel ;;
  }

  dimension_group: gq23_createddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.gq23_createddate ;;
  }

  dimension: gq28_elementname {
    type: string
    sql: ${TABLE}.gq28_elementname ;;
  }

  dimension: gq30_incidentname {
    type: string
    sql: ${TABLE}.gq30_incidentname ;;
  }

  dimension_group: gq38_putinplace {
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
    sql: ${TABLE}.gq38_putinplace ;;
  }

  dimension: gq41_elementcode {
    type: string
    sql: ${TABLE}.gq41_elementcode ;;
  }

  dimension: gq42_incidentcode {
    type: string
    sql: ${TABLE}.gq42_incidentcode ;;
  }

  dimension_group: gq50_closeddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.gq50_closeddate ;;
  }

  dimension: gq50_qflabel {
    type: string
    sql: ${TABLE}.gq50_qflabel ;;
  }

  dimension: gq50_statuscode {
    type: number
    sql: ${TABLE}.gq50_statuscode ;;
  }

  dimension_group: icm_connection {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.icm_connection_date ;;
  }

  dimension: id_ig {
    type: number
    sql: ${TABLE}.id_ig ;;
  }

  dimension: ig_has_drg {
    type: yesno
    sql: ${TABLE}.ig_has_drg ;;
  }

  dimension: ig_has_fic {
    type: yesno
    sql: ${TABLE}.ig_has_fic ;;
  }

  dimension: ig_has_icm {
    type: yesno
    sql: ${TABLE}.ig_has_icm ;;
  }

  dimension: is_incident {
    type: yesno
    sql: ${TABLE}.is_incident ;;
  }

  dimension: lborigineprobleme {
    type: string
    sql: ${TABLE}.lborigineprobleme ;;
  }

  dimension: lbscodpr {
    type: string
    sql: ${TABLE}.lbscodpr ;;
  }

  dimension: lbscodts {
    type: string
    sql: ${TABLE}.lbscodts ;;
  }

  dimension: lbscriticite {
    type: number
    sql: ${TABLE}.lbscriticite ;;
  }

  dimension: lbsdirpt1 {
    type: string
    sql: ${TABLE}.lbsdirpt1 ;;
  }

  dimension: lbsetat {
    type: number
    sql: ${TABLE}.lbsetat ;;
  }

  dimension: lbsite2 {
    type: string
    sql: ${TABLE}.lbsite2 ;;
  }

  dimension: lbspoletrait {
    type: string
    sql: ${TABLE}.lbspoletrait ;;
  }

  dimension: lbsquestion {
    type: string
    sql: ${TABLE}.lbsquestion ;;
  }

  dimension: lbsstatusapp {
    type: number
    sql: ${TABLE}.lbsstatusapp ;;
  }

  dimension: lib_ident_pb {
    type: string
    sql: ${TABLE}.LIB_IDENT_PB ;;
  }

  dimension: llbquestion {
    type: string
    sql: ${TABLE}.llbquestion ;;
  }

  dimension_group: manufacturing {
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
    sql: ${TABLE}.manufacturing_date ;;
  }

  dimension: mis_alliance {
    type: number
    sql: ${TABLE}.mis_alliance ;;
  }

  dimension: model_code {
    type: string
    sql: ${TABLE}.model_code ;;
  }

  dimension: nitg {
    type: string
    sql: ${TABLE}.nitg ;;
  }

  dimension: nitg_label_en {
    type: string
    sql: ${TABLE}.nitg_label_en ;;
  }

  dimension: nitg_label_fr {
    type: string
    sql: ${TABLE}.nitg_label_fr ;;
  }

  dimension: numero_nc {
    type: string
    sql: ${TABLE}.numero_nc ;;
  }

  dimension_group: opening_date_or {
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
    sql: ${TABLE}.opening_date_or ;;
  }

  dimension: operation_state {
    type: string
    sql: ${TABLE}.operation_state ;;
  }

  dimension: pivot_engine {
    type: string
    sql: ${TABLE}.pivot_engine ;;
  }

  dimension: pivot_gearbox {
    type: string
    sql: ${TABLE}.pivot_gearbox ;;
  }

  dimension: project_code {
    type: string
    sql: ${TABLE}.project_code ;;
  }

  dimension: protection {
    type: string
    sql: ${TABLE}.protection ;;
  }

  dimension: repair_dealer_country {
    type: string
    sql: ${TABLE}.repair_dealer_country ;;
  }

  dimension: repair_dealer_country_label_en {
    type: string
    sql: ${TABLE}.repair_dealer_country_label_en ;;
  }

  dimension: repair_dealer_country_label_fr {
    type: string
    sql: ${TABLE}.repair_dealer_country_label_fr ;;
  }

  dimension: rob_ap {
    type: string
    sql: ${TABLE}.ROB_AP ;;
  }

  dimension: safe_detect_ignore {
    type: string
    sql: ${TABLE}.safe_detect_ignore ;;
  }

  dimension: subfunction_code {
    type: number
    sql: ${TABLE}.subfunction_code ;;
  }

  dimension: subfunction_code_label_en {
    type: string
    sql: ${TABLE}.subfunction_code_label_en ;;
  }

  dimension: subfunction_code_label_fr {
    type: string
    sql: ${TABLE}.subfunction_code_label_fr ;;
  }

  dimension: symptom_code {
    type: string
    sql: ${TABLE}.symptom_code ;;
  }

  dimension: symptom_code_label_en {
    type: string
    sql: ${TABLE}.symptom_code_label_en ;;
  }

  dimension: symptom_code_label_fr {
    type: string
    sql: ${TABLE}.symptom_code_label_fr ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: tauxefficacitequ {
    type: number
    sql: ${TABLE}.tauxefficacitequ ;;
  }

  dimension: topic_id {
    type: string
    sql: ${TABLE}.topic_id ;;
  }

  dimension: topic_labell {
    type: string
    sql: ${TABLE}.topic_labell ;;
  }

  dimension: type_protection {
    type: string
    sql: ${TABLE}.type_protection ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  dimension: warranty_1 {
    type: yesno
    sql: ${TABLE}.warranty_1 ;;
  }

  dimension: warranty_2 {
    type: yesno
    sql: ${TABLE}.warranty_2 ;;
  }

  dimension: warranty_3 {
    type: yesno
    sql: ${TABLE}.warranty_3 ;;
  }

  measure: count {
    type: count
    drill_fields: [gq30_incidentname, gq28_elementname]
  }
}

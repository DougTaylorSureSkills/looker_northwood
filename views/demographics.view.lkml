view: demographics {
  sql_table_name: cloud-training-demos.k12_nwhs.demographics
    ;;

  dimension: district {
    type: string
    sql: ${TABLE}.District ;;
  }

  dimension: econ_disadv {
    type: yesno
    sql: ${TABLE}.EconDisadv ;;
  }

  dimension: el_level {
    type: number
    sql: ${TABLE}.EL_Level ;;
  }

  dimension: ell_flag {
    type: yesno
    sql: ${TABLE}.ELL_Flag ;;
  }

  dimension: ese_flag {
    type: yesno
    sql: ${TABLE}.ESE_Flag ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.Ethnicity ;;
  }

  dimension: gain_flag {
    type: number
    sql: ${TABLE}.GainFlag ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: home_language {
    type: string
    sql: ${TABLE}.HomeLanguage ;;
  }

  dimension: school {
    type: string
    sql: ${TABLE}.School ;;
  }

  dimension: school_year {
    type: string
    sql: ${TABLE}.SchoolYear ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.StudentID ;;
  }

  dimension: subgroup {
    type: string
    sql: ${TABLE}.Subgroup ;;
  }

measure: distinct_students_in_subgroup {
  label: "Distinct Students in Subgroup"
  type: count_distinct
  sql: CONCAT(${student_id}, ",", ${subgroup}) ;;
  # Filter the measure to only include students where the subgroup is set
  #filters: [subgroup: "-NULL"]
  #drill_fields: [student_id]
}

measure: students_making_gains {
  label: "Students Making Gains"
  type: sum
  # Summing the gain_flag counts students who made a gain
  sql: ${gain_flag} ;;
}

measure: percent_making_gains {
  label: "Percent Making Gains (%)"
  type: number
  value_format: "0.00%"
  # Formula: (Count of Students Making Gains) / (Count of Students in Subgroup)
  sql: ${students_making_gains} / NULLIF(${distinct_students_in_subgroup}, 0) ;;
  # NOTE: In the Explore, you will need to filter on ell_flag: Yes OR ese_flag: Yes
}
}

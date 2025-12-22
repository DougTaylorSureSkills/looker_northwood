view: title_i_audit_eligibility_data {
  derived_table: {
    sql: SELECT
      StudentID,
      School,
      District,
      SchoolYear,
      Gender,
      Ethnicity,
      HomeLanguage,
      Subgroup,
      EconDisadv,
      ELL_Flag,
      CASE
       WHEN t1.EconDisadv = 'Y' THEN TRUE      -- TRUE means eligible for Title I funding
       ELSE FALSE
      END AS is_econ_disadv,
      CASE
       WHEN t1.ELL_Flag = 'Y' THEN TRUE        -- TRUE means student is currently an English Learner
       ELSE FALSE
      END AS is_ell
      FROM cloud-training-demos.k12_nwhs.demographics
      WHERE SchoolYear = '2024-2025' ;;
      }

  dimension: student_id {
    description: "Unique ID for each student."
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: school {
    description: "The school that the student attends."
    type: string
    sql: ${TABLE}.school ;;
  }

  dimension: district {
    description: "The district in whic hthe school resides."
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: school_year {
    description: "The school year to which the data applies."
    type: string
    sql: ${TABLE}.school_year ;;
  }

  dimension: gender {
    description: "The gender of the student."
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: ethnicity {
    description: "The ethnicity of the student."
    type: string
    sql: ${TABLE}.echnicity ;;
  }

  dimension: home_language {
    description: "The home lanuguage of the student."
    type: string
    sql: ${TABLE}.home_language ;;
  }

  dimension: sub_group {
    description: "The sub-group to which the student belongs."
    type: string
    sql: ${TABLE}.sub_group ;;
  }

  dimension: econ_disadv {
    description: "Whether or not the student is economically disadvantaged and elligible for Title I funding (Y/N). Maintained for auditing pursposes."
    type: string
    sql: ${TABLE}.econ_disadv ;;
  }

  dimension: ell_flag {
    description: "Whether the student is currently an English Language Learner (Y/N). Maintained for auditing pursposes."
    type: string
    sql: ${TABLE}.ell_flag ;;
  }

  dimension: is_econ_disadv {
    description: "Boolean version of the econ_disadv field."
    type: yesno
    sql: ${TABLE}.is_econ_disadv ;;
  }

  dimension: is_ell {
    description: "Boolean version of the ell_flag field."
    type: yesno
    sql: ${TABLE}.is_ell ;;
  }
}

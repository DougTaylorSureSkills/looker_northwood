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
    description: "Unique ID for each student"
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: school {
    description: "The identifier of the school"
    type: string
    sql: ${TABLE}.school ;;
  }

  dimension: district {
    description: "The school district"
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: school_year {
    description: "The school year"
    type: string
    sql: ${TABLE}.school_year ;;
  }

  dimension: gender {
    description: "The student's gender marker"
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: ethnicity {
    description: "The student's ethnicity"
    type: string
    sql: ${TABLE}.echnicity ;;
  }

  dimension: home_language {
    description: "The student's home language"
    type: string
    sql: ${TABLE}.home_language ;;
  }

  dimension: sub_group {
    description: "The subgroup for a school in a district"
    type: string
    sql: ${TABLE}.sub_group ;;
  }

  dimension: econ_disadv {
    description: "The economically disadvantaged flag"
    type: string
    sql: ${TABLE}.econ_disadv ;;
  }

  dimension: ell_flag {
    description: "The ELL flag for non-native English students"
    type: string
    sql: ${TABLE}.ell_flag ;;
  }

  dimension: is_econ_disadv {
    description: "Whether a student is economically disadvantaged Y/N"
    type: yesno
    sql: ${TABLE}.is_econ_disadv ;;
  }

  dimension: is_ell {
    description: "Whether a student is a non-native English speaker Y/N"
    type: yesno
    sql: ${TABLE}.is_ell ;;
  }
}

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
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: school {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.school ;;
  }

  dimension: district {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: school_year {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.school_year ;;
  }

  dimension: gender {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: ethnicity {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.echnicity ;;
  }

  dimension: home_language {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.home_language ;;
  }

  dimension: sub_group {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.sub_group ;;
  }

  dimension: econ_disadv {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.econ_disadv ;;
  }

  dimension: ell_flag {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.ell_flag ;;
  }

  dimension: is_econ_disadv {
    description: "The total number of orders for each user"
    type: yesno
    sql: ${TABLE}.is_econ_disadv ;;
  }

  dimension: is_ell {
    description: "The total number of orders for each user"
    type: yesno
    sql: ${TABLE}.is_ell ;;
  }
}

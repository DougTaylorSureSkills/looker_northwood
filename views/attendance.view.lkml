view: attendance {
  sql_table_name: cloud-training-demos.k12_nwhs.attendance
    ;;

  dimension: absences {
    type: number
    sql: ${TABLE}.Absences ;;
  }

  dimension: attendance_rate {
    type: number
    sql: ${TABLE}.AttendanceRate ;;
  }

  dimension: chronic_flag {
    type: number
    sql: ${TABLE}.ChronicFlag ;;
  }

  dimension: course_id {
    type: string
    sql: ${TABLE}.CourseID ;;
  }

  dimension: course_name {
    type: string
    sql: ${TABLE}.CourseName ;;
  }

  dimension: grade_level {
    type: number
    sql: ${TABLE}.GradeLevel ;;
  }

  dimension: school_year {
    type: string
    sql: ${TABLE}.SchoolYear ;;
  }

  dimension: section_id {
    type: string
    sql: ${TABLE}.SectionID ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.StudentID ;;
  }

  dimension: teacher_email {
    type: string
    sql: ${TABLE}.TeacherEmail ;;
  }

  dimension: teacher_id {
    type: string
    sql: ${TABLE}.TeacherID ;;
  }

  dimension: term {
    type: string
    sql: ${TABLE}.Term ;;
  }

  dimension: total_days {
    type: number
    sql: ${TABLE}.TotalDays ;;
  }

  measure: distinct_students_enrolled {
    label: "Distinct Students Enrolled (Current Term)"
    type: count_distinct
    sql: ${student_id} ;;
    drill_fields: [student_id, course_name]
  }

  measure: students_chronic_absent {
    label: "Students Chronically Absent"
    type: sum
    # Summing the chronic_flag counts students who are chronically absent (flag = 1)
    sql: ${chronic_flag} ;;
    drill_fields: [student_id, course_name]
  }

  measure: chronic_absence_rate {
    label: "Chronic Absence Rate (%)"
    type: number
    value_format: "0.00%"
    # Formula: (Count of Chronically Absent Students) / (Count of Students Enrolled)
    sql: ${students_chronic_absent} / NULLIF(${distinct_students_enrolled}, 0) ;;
    # NOTE: This should be used in the course_attendance Explore
  }
}

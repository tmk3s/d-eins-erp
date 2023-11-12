class AttendanceItem < ApplicationRecord
  belongs_to :company
  has_many :employee_salary_attendance_items, dependent: :destroy
  has_many :payroll_group_attendance_items, dependent: :destroy
end
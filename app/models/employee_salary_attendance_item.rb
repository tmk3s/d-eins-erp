class EmployeeSalaryAttendanceItem < ApplicationRecord
  belongs_to :company
  belongs_to :employee_salary
  belongs_to :attendance_item
end
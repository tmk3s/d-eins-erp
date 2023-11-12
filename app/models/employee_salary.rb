class EmployeeSalary < ApplicationRecord
  belongs_to :company
  belongs_to :employee
  belongs_to :payroll_group

  has_many :employee_salary_attendance_items, dependent: :destroy
  has_many :employee_salary_deduction_items, dependent: :destroy
  has_many :employee_salary_payment_items, dependent: :destroy
end
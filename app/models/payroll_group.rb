class PayrollGroup < ApplicationRecord
  belongs_to :company
  has_many :payroll_group_attendance_items, dependent: :destroy
  has_many :payroll_group_payment_items, dependent: :destroy
  has_many :payroll_group_deduction_items, dependent: :destroy
  has_many :employee_salaries, dependent: :destroy
end
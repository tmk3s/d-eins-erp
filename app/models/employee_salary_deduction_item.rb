class EmployeeSalaryDeductionItem < ApplicationRecord
  belongs_to :company
  belongs_to :employee_salary
  belongs_to :deduction_item

  enum :item_type, [:health, :nursing, :pension, :child, :customize], prefex: true
  enum :setting_type, [:employee, :formula], prefex: true
end
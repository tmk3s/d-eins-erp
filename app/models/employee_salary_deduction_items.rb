class EmployeeSalaryDeductionItem < ApplicationRecord
  belongs_to :company
  belongs_to :employee_salary
  belongs_to :deduction_item
end
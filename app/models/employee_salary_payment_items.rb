class EmployeeSalaryPaymentItem < ApplicationRecord
  belongs_to :company
  belongs_to :employee_salary
  belongs_to :payment_item
end
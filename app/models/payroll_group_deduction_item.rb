class PayrollGroupDeductionItem < ApplicationRecord
  belongs_to :company
  belongs_to :payroll_group
  belongs_to :deduction_item
end
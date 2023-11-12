class PayrollGroupPaymentItem < ApplicationRecord
  belongs_to :company
  belongs_to :payroll_group
  belongs_to :payment_item
end
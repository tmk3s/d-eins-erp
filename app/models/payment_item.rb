class PaymentItem < ApplicationRecord
  belongs_to :company
  has_many :employee_salary_payment_items, dependent: :destroy
  has_many :payroll_group_payment_items, dependent: :destroy

  enum :item_type, [:base, :customize]
  enum :setting_type, [:employee, :formula]
end
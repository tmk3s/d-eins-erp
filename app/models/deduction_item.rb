class DeductionItem < ApplicationRecord
  belongs_to :company
  has_many :employee_salary_deduction_items, dependent: :destroy
  has_many :payroll_group_deduction_items, dependent: :destroy

  enum :item_type, [:health, :nursing, :pension, :child, :customize], prefex: true
  enum :setting_type, [:employee, :formula], prefex: true
end
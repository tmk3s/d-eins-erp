class Employee < ApplicationRecord
  belongs_to :company

  has_one :employee_address, dependent: :destroy

  has_many :employee_banks, dependent: :destroy
  has_many :employee_families, dependent: :destroy
  has_many :employee_payroll_groups, dependent: :destroy
  has_many :employee_qualifications, dependent: :destroy
  has_many :employee_salaries, dependent: :destroy

  enum :gender, [:male, :female], prefix: true

  validates :code, uniqueness: { scope: :company_id }
end
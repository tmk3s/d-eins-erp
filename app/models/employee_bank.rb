class EmployeeBank < ApplicationRecord
  belongs_to :company
  belongs_to :employee
  belongs_to :bank
  belongs_to :bank_branch
end
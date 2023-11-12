class EmployeeQualification < ApplicationRecord
  belongs_to :company
  belongs_to :employee
  belongs_to :qualification
end
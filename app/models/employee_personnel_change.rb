class EmployeePersonnelChange < ApplicationRecord
  belongs_to :company
  belongs_to :employee
  belongs_to :office
  belongs_to :department
  belongs_to :post
  belongs_to :occupation
  belongs_to :grade
end
class Post < ApplicationRecord
  belongs_to :company
  has_many :employee_personnel_changes
end
class Office < ApplicationRecord
  belongs_to :company
  belongs_to :prefecture

  has_many :employee_personnel_changes
end

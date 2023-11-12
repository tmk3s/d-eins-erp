class Qualification < ApplicationRecord
  belongs_to :company
  has_many :employee_qualifications, dependent: :destroy
end
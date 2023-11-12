class AssociationKenpoRate < ApplicationRecord
  enum :insurance_type, [:health, :nursing, :pension, :child], prefex: true
end
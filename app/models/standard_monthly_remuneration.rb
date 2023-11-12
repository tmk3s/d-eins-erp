class StandardMonthlyRemuneration < ApplicationRecord
  enum :insurance_type, [:health, :pension], prefix: true
end
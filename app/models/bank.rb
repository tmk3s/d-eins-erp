class Bank < ApplicationRecord
  has_many :bank_branches, dependent: :destroy
end
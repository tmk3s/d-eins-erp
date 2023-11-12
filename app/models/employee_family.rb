class EmployeeFamily < ApplicationRecord
  belongs_to :company
  belongs_to :employee

  enum :relationship, [
    :husband, 
    :wife,
    :older_brother,
    :younger_brother,
    :sister,
    :younger_sister,
    :grandfather,
    :grandmother
  ], prefix: true
end
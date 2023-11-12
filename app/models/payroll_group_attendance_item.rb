class PayrollGroupAttendanceItem < ApplicationRecord
  belongs_to :company
  belongs_to :payroll_group
  belongs_to :attendance_item
end
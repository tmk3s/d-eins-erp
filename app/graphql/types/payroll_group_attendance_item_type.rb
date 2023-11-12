module Types
  class PayrollGroupAttendanceItemType < Types::BaseObject
    description "給与グループの勤怠項目"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :payroll_group_id, ID, null: false, description: '給与グループID'
    field :attendance_item_id, ID, null: false, description: '勤怠項目ID'
    field :row_no, Int, null: false, description: '行No'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
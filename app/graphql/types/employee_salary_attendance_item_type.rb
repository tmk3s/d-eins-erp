module Types
  class EmployeeSalaryAttendanceItemType < Types::BaseObject
    description "従業員給与の勤怠項目"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :attendance_item_id, ID, null: false, description: '勤怠項目ID'
    field :row_no, Int, null: false, description: '行No'
    field :name, String, null: false, description: '項目名'
    field :value, String, null: false, description: '値'
    field :is_delete, Boolean, null: false, description: '削除フラグ'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
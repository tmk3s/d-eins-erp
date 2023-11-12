module Types
  class AttendanceItemType < Types::BaseObject
    description "勤怠項目マスタ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :name, String, null: false, description: '項目名'
    field :is_delete, Boolean, null: false, description: '削除フラグ'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
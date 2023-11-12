module Types
  class EmployeeJobCareerType < Types::BaseObject
    description "従業員職歴"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :start_on, ISO8601Date, null: false, description: '開始日'
    field :name, String, null: false, description: '名前'
    field :detail, String, null: true, description: '詳細'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
module Types
  class EmployeeQualificationType < Types::BaseObject
    description "従業員資格情報"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :acquisition_at, ISO8601Date, null: false, description: '取得日'
    field :qualification_id, ID, null: false, description: '資格ID'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
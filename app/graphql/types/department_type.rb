module Types
  class DepartmentType < Types::BaseObject
    description "部署マスタ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :start_on, ISO8601Date, null: false, description: '開始日'
    field :name, String, null: false, description: '部署名'
    field :parent_id, ID, null: false, description: '親ID'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
module Types
  class QualificationType < Types::BaseObject
    description "資格マスタ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :name, String, null: false, description: '名称'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
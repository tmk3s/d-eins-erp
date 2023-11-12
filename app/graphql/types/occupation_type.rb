module Types
  class OccupationType < Types::BaseObject
    description "職種マスタ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :start_on, String, null: false, description: '開始日'
    field :name, String, null: false, description: '職種名'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
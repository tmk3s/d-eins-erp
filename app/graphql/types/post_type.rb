module Types
  class PostType < Types::BaseObject
    description "役職マスタ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :start_on, String, null: false, description: '開始日'
    field :name, String, null: false, description: '役職名'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
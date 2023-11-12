module Types
  class GradeType < Types::BaseObject
    description "グレード・等級名マスタ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :name, String, null: false, description: 'グレード・等級名'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
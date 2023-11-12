module Types
  class BankType < Types::BaseObject
    description "銀行マスタ"
    field :id, ID, null: false
    field :code, String, null: false, description: 'コード'
    field :name, String, null: false, description: '銀行名'
    field :name_ryaku, String, null: false, description: '銀行名略'
    field :name_kana, String, null: false, description: '銀行名カナ'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
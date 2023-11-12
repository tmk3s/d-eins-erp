module Types
  class BankBranchType < Types::BaseObject
    description "銀行支店マスタ"
    field :id, ID, null: false
    field :bank_id, ID, null: false, description: '銀行ID'
    field :code, String, null: false, description: 'コード'
    field :name, String, null: false, description: '支店名'
    field :name_kana, String, null: false, description: '支店名カナ'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
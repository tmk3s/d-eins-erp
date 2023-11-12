module Types
  class PayrollGroupPaymentItemType < Types::BaseObject
    description "給与グループの支給項目"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :name, String, null: false, description: 'グループ名'
    field :close_day, Int, null: false, description: '締日'
    field :payment_day, Int, null: false, description: '支給日'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
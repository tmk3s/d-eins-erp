module Types
  class DeductionItemType < Types::BaseObject
    description "控除項目マスタ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :name, String, null: false, description: '項目名'
    field :item_type, [Types::ItemTypeType], null: false, description: '項目種別'
    field :setting_type, [Types::ItemTypeType], null: false, description: '金額設定種別'
    field :formula, String, description: '計算式'
    field :is_minus, Boolean, null: false, description: 'マイナスフラグ'
    field :is_delete, Boolean, null: false, description: '削除フラグ'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
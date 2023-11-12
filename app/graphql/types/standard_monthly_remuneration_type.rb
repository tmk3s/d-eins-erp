module Types
  class StandardMonthlyRemunerationType < Types::BaseObject
    description "標準報酬月額マスタ"
    field :id, ID, null: false
    field :start_on, ISO8601Date, null: false, description: '開始日'
    field :insurance_type, [Types::InsuranceType], null: false, description: '保険種別'
    field :rank, Int, null: false, description: '等級'
    field :monthly_amount, String, null: false, description: '月額'
    field :daily_amount, String, null: true, description: '月額'
    field :monthly_remuneration_from, String, null: true, description: '報酬月額(from)'
    field :monthly_remuneration_to, String, null: true, description: '報酬月額(to)'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
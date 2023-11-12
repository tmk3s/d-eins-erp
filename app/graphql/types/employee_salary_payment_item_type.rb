module Types
  class EmployeeSalaryPaymentItemType < Types::BaseObject
    description "従業員給与の支給項目"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :payment_item_id, ID, null: false, description: '支給項目ID'
    field :row_no, Int, null: false, description: '行No'
    field :name, String, null: false, description: '項目名'
    field :value, String, null: false, description: '値'
    field :item_type, [Types::ItemTypeType], null: false, description: '項目種別'
    field :setting_type, [Types::ItemTypeType], null: false, description: '金額設定種別'
    field :formula, String, null: true, description: '計算式'
    field :calculation_process_file, String, null: true, description: '計算過程のファイル'
    field :is_minus, Boolean, null: false, description: 'マイナスフラグ'
    field :is_delete, Boolean, null: false, description: '削除フラグ'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
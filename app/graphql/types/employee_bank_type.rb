module Types
  class EmployeeBankType < Types::BaseObject
    description "従業員口座"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :row_no, Int, null: false, description: '行No'
    field :bank_id, ID, null: false, description: '銀行ID'
    field :bank_branches_id, ID, null: false, description: '銀行支店ID'
    field :bank_number, String, null: false, description: '口座番号'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
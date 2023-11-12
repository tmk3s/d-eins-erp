module Types
  class EmployeePayrollGroupType < Types::BaseObject
    description "従業員の給与グループ"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :payroll_group_id, ID, null: false, description: '給与グループID'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end
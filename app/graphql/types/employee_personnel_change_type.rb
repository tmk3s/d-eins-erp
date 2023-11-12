module Types
  class EmployeePersonnelChangeType < Types::BaseObject
    description "従業員人事異動"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :start_on, String, null: false, description: '開始日'
    field :office_id, ID, null: false, description: '事業所ID'
    field :department_id, ID, null: true, description: '部署ID'
    field :post_id, ID, null: true, description: '役職ID'
    field :occupation_id, ID, null: true, description: '職種ID'
    field :grade_id, ID, null: true, description: 'グレード・等級ID'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
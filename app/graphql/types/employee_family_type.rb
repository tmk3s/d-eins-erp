module Types
  class EmployeeFamilyType < Types::BaseObject
    description "従業員家族"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :row_no, Int, null: false, description: '行No'
    field :relationship, [Types::RelationshipType], null: false, description: '続柄'
    field :last_name, String, null: false, description: '姓'
    field :first_name, String, null: false, description: '名'
    field :last_name_kana, String, null: false, description: '姓(カナ)'
    field :first_name_kana, String, null: false, description: '名(カナ)'
    field :gender, [Types::GenderType], null: true, description: '性別'
    field :birthday, String, null: true, description: '誕生日'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
module Types
  class EmployeeAddressType < Types::BaseObject
    description "従業員住所"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :employee_id, ID, null: false, description: '従業員ID'
    field :post_code1, String, null: false, description: '郵便番号1'
    field :post_code2, String, null: false, description: '郵便番号2'
    field :prefecture_id, ID, null: false, description: '都道府県ID'
    field :address, String, null: false, description: '住所'
    field :building, String, null: false, description: '建物名'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
module Types
  class EmployeeType < Types::BaseObject
    description "従業員"
    field :id, ID, null: false
    field :company_id, ID, null: false, description: '会社ID'
    field :code, String, null: false, description: '従業員番号'
    field :last_name, String, null: false, description: '姓'
    field :first_name, String, null: false, description: '名'
    field :last_name_kana, String, null: true, description: '姓(カナ)'
    field :first_name_kana, String, null: true, description: '名(カナ)'
    field :gender, Types::GenderType, null: true, description: '性別'
    field :birthday, String, null: true, description: '誕生日'
    field :joined_on, String, null: true, description: '入社日'
    field :retirement_on, String, null: true, description: '退社日'
    field :introduction, String, null: true, description: '自己紹介'
    field :image, String, null: true, description: '画像'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'

    field :employee_address, Types::EmployeeAddressType
    field :employee_banks, [Types::EmployeeBankType]
    field :employee_families, [Types::EmployeeFamilyType]
    field :employee_payroll_groups, [Types::EmployeePayrollGroupType]
    field :employee_qualifications, [Types::EmployeeQualificationType]
    field :employee_salaries, [Types::EmployeeSalaryType]
  end
end
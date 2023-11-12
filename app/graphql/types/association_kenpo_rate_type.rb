# https://graphql-ruby.org/getting_started.html
# https://graphql-ruby.org/type_definitions/scalars.html
module Types
  class AssociationKenpoRateType < Types::BaseObject
    description "協会けんぽんの料率"
    field :id, ID, null: false
    field :start_on, String, null: false, description: '開始日'
    field :prefecture_id, ID, null: false, description: '都道府県ID'
    field :insurance_type, [Types::InsuranceType], null: false, description: '保険種別'
    field :employee_rate, [Types::Decimal], null: false, description: '従業員負担分の料率'
    field :employer_rate, [Types::Decimal], null: false, description: '事業主負担分の料率'
    field :rate, [Types::Decimal], null: false, description: '全体の料率'
    field :created_at, String, null: false, description: '作成日'
    field :updated_at, String, null: false, description: '更新日'
  end
end
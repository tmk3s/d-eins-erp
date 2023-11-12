module Types
  class PrefectureType < Types::BaseObject
    description "都道府県マスタ"
    field :id, ID, null: false
    field :name, String, null: false, description: '名称'
    field :created_at, ISO8601Date, null: false, description: '作成日'
    field :updated_at, ISO8601Date, null: false, description: '更新日'
  end
end